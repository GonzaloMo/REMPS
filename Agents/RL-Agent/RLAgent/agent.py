from typing import Dict
import yaml
import gym
import ray
from ray import tune 
from pathlib import Path as file_name_function



class RAY_agent:
    def __init__(self):
        self.config = {}

    def train(self, Training: Dict, Agent: Dict, Environment: Dict):
        Training["local_dir"] = Training["local_dir"]+ Environment["env_config"]["env"]
        # Load Agent Configuration Files
        algo_name = Agent["Algorithm"]
        if algo_name == "PPO":
            from ray.rllib.agents.ppo import PPOTrainer
            self.agent = PPOTrainer
        agent_files = Agent["Agent_Config"]
        config = {}
        for fileloc in agent_files:
            with open(fileloc, "r") as f:
                temp_config = yaml.load(f, Loader=yaml.FullLoader)
            config = {**config, **temp_config}

        # Load Environment Configuration Files
        Trianing_Envs = Environment["Trianing_Envs"]
        env_config = Environment["env_config"]
        reward = env_config["Reward_Function"]
        env_name = env_config["env"]
        config["render_env"] = Environment["render_env"]

        restore = None
        for env_file in Trianing_Envs:
            # Set Experiment config file
            Exp_name = file_name_function(env_file).stem
            env_config["Log_dir"] = f"./Simulation/"
            env_config["Env_setup"] = env_file
            config["env_config"] = env_config
            config["env"] = env_name

            # Set Trainning configuration dict
            Training["config"] = config
            Training["restore"] = restore
            Training["name"] = Exp_name
            # Train on set envirnment
            self.analysis = ray.tune.run(self.agent, **Training)
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

    def load(self, path: str, specific_checkpoint: str = None):
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
            checkpoint_path = Temp_config["save_dir"] + specific_checkpoint
        else:
            last_checkpoint_loc = Temp_config["last_checkpoint"]
   
        # Load Agent
        self.agent.restore(checkpoint_path=checkpoint_path)
        

    def test(self, env: gym.Env, render=False):
        """
        Test trained agent for a single episode. Return the episode reward
        :param env: Environment to test the agent on
        :return: Episode reward
        """

        # run until episode ends
        episode_reward = 0
        done = False
        obs = env.reset()
        while not done:
            action = self.agent.compute_single_action(obs)
            observation, reward, terminated, truncated, info = env.step(action)
            if render:
                env.render()
            if terminated or truncated:
                done = True
            episode_reward += reward
        return episode_reward

    def add_to_config(self, config: Dict):
        self.config = {**self.config, **config}
    
    def grid_search_config(self, search: Dict):
        for v, k in search.items():
            if type(v) == Dict:
                for v1, k1 in v.items():
                    self.config[k][k1] = tune.grid_search(v1)
            else:
                self.config[k] = tune.grid_search(v)
    