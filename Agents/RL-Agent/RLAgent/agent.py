from typing import Dict
import yaml
import gym
import ray
from ray import tune 
from pathlib import Path as file_name_function

from RLAgent.Utils.ray import env_creator, Custom_TBXLoggerCallback

class RAY_agent:
    def __init__(self):
        self.config = {}

    def train(self, Training: Dict, Agent: Dict, Environment: Dict):
        Training["local_dir"] = Training["local_dir"]+ Environment["env_config"]["env"]
        # Load Agent Configuration Files
        algo_name = Agent["Algorithm"]
        if algo_name == "PPO":
            from RLAgent.Utils.ray import PPO as agent
        self.agent = agent
        agent_files = Agent["Agent_Config"]
        config = {}
        for fileloc in agent_files:
            with open(fileloc, "r") as f:
                temp_config = yaml.load(f, Loader=yaml.FullLoader)
            config = {**config, **temp_config}

        # Load Environment Configuration Files
        Trianing_Envs = Environment["Trianing_Envs"]["Changing"]
        env_config = Environment["env_config"]
        reward = env_config["Reward_Function"]
        env_name = env_config["env"]
        # config["render_env"] = Environment["render_env"]

        restore = None
        config = self.check_config(config)
        # import IPython; IPython.embed()
        
        for env_file in Trianing_Envs:
            # Set Experiment config file
            Exp_name = file_name_function(env_file).stem
            env_config["Log_dir"] = f"./Simulation/"
            env_config["Env_setup"] = Environment["Trianing_Envs"]["Main"] + [env_file]
            config["env_config"] = env_config
            config["env"] = env_name
            callback = [Custom_TBXLoggerCallback(env_creator(env_config))]
            # Set Trainning configuration dict
            Training["config"] = config
            Training["restore"] = restore
            Training["name"] = Exp_name
            # Train on set envirnment
            self.analysis = ray.tune.run(self.agent, **Training, callbacks=callback)
            self.last_checkpoint = self.analysis.get_last_checkpoint()
            # Save Agent
            restore = self.last_checkpoint._local_path
            # Store the configuration Dict
            save_dir = "/".join(restore.split("/")[:-2])
            self.save(save_dir, Training, Agent, Environment)

    def save(self, path: str, Training: Dict, Agent: Dict, Environment: Dict):
        import os
        
        # Save Trainning data 
        # self.analysis.save(path+'/Model/Analysis')
        # Save Configuration Variables
        import json
        Temp_config = {}
        Temp_config["Training"] = Training
        Temp_config["Agent"] = Agent
        Temp_config["Environment"] = Environment
        Temp_config["save_dir"] = path
        Temp_config["last_checkpoint"] = self.last_checkpoint._local_path
        path += f"/Model/"
        if not os.path.exists(path):
            os.makedirs(path)
        with open(path+'Config.json', 'w') as outfile:
            json.dump(Temp_config, outfile)
        print('Agent Saved')

    def load(self, path: str, mode: str="train", specific_checkpoint: str = None):
        """
        Agent loading function.
        :param path: Path to the saved agent
        """
        # Load Configuration Variables
        import json
        with open(path+'/Model/Config.json') as file:
            Temp_config = json.load(file)
        Training = Temp_config["Training"]
        Agent = Temp_config["Agent"]
        Environment = Temp_config["Environment"]
        if specific_checkpoint is not None:
            checkpoint_path = Temp_config["save_dir"] +"/"+ specific_checkpoint
        else:
            checkpoint_path = path + "/" +Temp_config["last_checkpoint"].split("/")[-2]
        algo_name = Agent["Algorithm"]
        config = Training["config"]

        if algo_name == "PPO":
            if mode == "test":
                config["num_workers"] = 0
                config["num_envs_per_worker"] = 1
                config["explore"] = False
            from RLAgent.Utils.ray import PPO
            self.agent = PPO(config=config)
   
        # Load Agent
        self.agent.restore(checkpoint_path=checkpoint_path)
        return Training, Agent, Environment
        

    def get_action(self, observation):
        return self.agent.compute_single_action(observation)

    def add_to_config(self, config: Dict):
        self.config = {**self.config, **config}
    
    def grid_search_config(self, search: Dict):
        for v, k in search.items():
            if type(v) == Dict:
                for v1, k1 in v.items():
                    self.config[k][k1] = tune.grid_search(v1)
            else:
                self.config[k] = tune.grid_search(v)
    def check_config(self, config: Dict):
        for item, value in config.items():
            if type(value) == Dict:
                config[item] = self.check_config(value)
            elif type(value) == list:
                config[item] = tune.grid_search(value)
        return config