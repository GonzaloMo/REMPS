from typing import Dict
import yaml
import gym
import ray
from ray import tune 
import shutil
from pathlib import Path as file_name_function
from copy import deepcopy
import numpy as np

from RLAgent.Utils.ray import env_creator, Custom_TBXLoggerCallback
def pretty(d, indent=0):
   for key, value in d.items():
      print('\t' * indent + str(key))
      if isinstance(value, dict):
         pretty(value, indent+1)
      else:
         print('\t' * (indent+1) + str(value))


class RAY_agent:
    def __init__(self):
        self.config = {}
        self.state = None

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
        Exp_names = []
        Env_setups = []
        env_config_loaded = {}
        for main_env_file in Environment["Trianing_Envs"]["Main"]:
            with open(main_env_file, "r") as f:
                env_config_loaded.update(yaml.load(f, Loader=yaml.FullLoader))
        if Environment["Trianing_Envs"]["Changing"] == []:
            Env_setups.append(env_config_loaded)
            Exp_names.append("main")
        else:
            for changing_env_file in Environment["Trianing_Envs"]["Changing"]:
                with open(changing_env_file, "r") as f:
                    env_config_loaded.update(yaml.load(f, Loader=yaml.FullLoader))
                Env_setups.append(deepcopy(env_config_loaded))
                Exp_names.append(file_name_function(changing_env_file).stem)
        env_config = Environment["env_config"]
        reward = env_config["Reward_Function"]
        env_name = env_config["env"]
        # config["render_env"] = Environment["render_env"]

        restore = None
        config = self.check_config(config)
        # import IPython; IPython.embed()
        for i, env_setup in enumerate(Env_setups):
            # Set Experiment config file
            Exp_name = Exp_names[i]            
            env_config["Log_dir"] = f"./Simulation/"
            env_config["Env_setup"] = env_setup
            config["env_config"] = env_config
            config["env"] = env_name
            callback = [Custom_TBXLoggerCallback(env_creator(env_config))]
            # Set Trainning configuration dict
            Training["config"] = config
            Training["restore"] = restore
            Training["name"] = Exp_name
            # Train on set envirnment
            self.save(save_dir, Training, Agent, Environment, trainning_done=True)
            self.analysis = ray.tune.run(self.agent, **Training, callbacks=callback)
            self.last_checkpoint = self.analysis.get_last_checkpoint()
            # Save Agent
            restore = self.last_checkpoint._local_path
            # Store the configuration Dict
            save_dir = "/".join(restore.split("/")[:-2])
            self.save(save_dir, Training, Agent, Environment)

    def save(self, path: str, Training: Dict, Agent: Dict, Environment: Dict, trainning_done=False):
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
        if trainning_done:
            Temp_config["last_checkpoint"] = self.last_checkpoint._local_path
        path += f"/Model/"
        if not os.path.exists(path):
            os.makedirs(path)
        # del Temp_config["Environment"]["Env_setup"]["Reward"]
        pretty(Temp_config)
        
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
            checkpoint_path = path +"/"+ specific_checkpoint
        else:
            checkpoint_path = path + "/" +Temp_config["last_checkpoint"].split("/")[-2]
        algo_name = Agent["Algorithm"]
        config = Training["config"]
        if algo_name == "PPO":
            if mode == "test":
                config["num_workers"] = 0
                config["num_envs_per_worker"] = 1
                # config["explore"] = False
            from RLAgent.Utils.ray import PPO
            self.agent = PPO(config=config)
   
        # Load Agent
        self.agent.restore(checkpoint_path=checkpoint_path)
        self.config = config
        return Training, Agent, Environment
        
    def load_from_cehckpoint(self, path: str, config: Dict, mode="test"):
        from RLAgent.Utils.ray import PPO
        if mode == "test":
            config["num_workers"] = 0
            config["num_envs_per_worker"] = 1
        self.agent = PPO(config=config)
        self.agent.restore(checkpoint_path=path)

    def get_action(self, observation, **kwargs):
        if self.state is None and (self.config["model"]["use_lstm"]):
            if "lstm_cell_size" in self.config["model"].keys():
                cell_size = self.config["model"]["lstm_cell_size"]
            else:
                cell_size = 256
            state = [np.zeros(cell_size, np.float32),
               np.zeros(cell_size, np.float32)]
        else:
            state = self.state
        if state is not None:
            action, state, logits = self.agent.compute_action(observation, state, **kwargs)
        else:
            action = self.agent.compute_single_action(observation, **kwargs)
        self.state = state

        return action
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