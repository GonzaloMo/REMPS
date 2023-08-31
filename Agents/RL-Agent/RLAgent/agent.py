from typing import Dict
import yaml
import gym
import os
import json
import ray
from ray import tune 
from time import sleep
from copy import deepcopy
from datetime import datetime
from RLAgent.Utils.tune import env_creator
from RLAgent.Utils.helpers import actionDistribution2Probabilities
from SimpleSatellite.envs.setgoals.CV_learning import curriculum_fn, CurriculumEnv, CV_CallBack
from RLAgent.Utils.rllib import PG_callback
import numpy as np


def pretty(d, indent=0):
   for key, value in d.items():
      print('\t' * indent + str(key))
      if isinstance(value, dict):
         pretty(value, indent+1)
      else:
         print('\t' * (indent+1) + str(value))


class RAY_agent:
    def __init__(self):
        self.date = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
        self.state = None
        self.Agent_config = None
        self.Env_congif = None
        self.Triaining_config = None
        self.loaded_checkpoint = None
        self.config_types = ["Training", "Environment",  "Agent",]
        self.restore = False


    def setup(self, config: Dict):
        self.setupAgent(config["Agent"])
        self.setupEnvironment(config["Environment"])
        self.setupTraining(config["Training"])

    def setupAgent(self, Algorithm: str, config: Dict={}, Agent_Config: str=None, **kwargs):
        if Algorithm == "PPO":
            from RLAgent.Utils.tune import PPO as agent
        elif Algorithm == "APPO":
            from RLAgent.Utils.tune import APPO as agent
        else:
            raise ValueError(f"Algorithm {Algorithm} not supported")
        
        if Agent_Config is not None:
            if os.path.isfile(Agent_Config[0]):
                config = {}
                for fileloc in Agent_Config:
                    with open(fileloc, "r") as f:
                        temp_config = yaml.load(f, Loader=yaml.FullLoader)
                    config = {**config, **temp_config}
            else:
                # So it is compatible with the old config files
                print("WARNING: Old config file format detected")
                config = self.Training_config["config"]
        self.Agent_config = {"Algorithm": Algorithm, "config": config}
        self.agent = agent
        self.algo_name = Algorithm

    def setupEnvironment(self, env: str, Env_setup: Dict, **kwargs):
        if type(Env_setup) == str:
            Env_setup = Env_setup.replace("./", f"{os.getcwd()}/")
            with open(Env_setup, "r") as f:
                Env_setup = yaml.load(f, Loader=yaml.FullLoader)
        self.Env_congif = {"env": env, "Env_setup": Env_setup, **kwargs}

    def setupTraining(self, config: Dict, train: bool=True, **kwargs):
        if train:
            config["name"] = f"{self.date}/"
        self.Training_config = config

    def train(self, Training: Dict=None, Agent: Dict=None, Environment: Dict=None, recover: str=None, specific_chk: bool=False):
        ### Load and Check congifurations ###
        # Agent
        if Agent is not None:
            self.setupAgent(**Agent)
        assert self.Agent_config is not None, "Agent not set"
        config = self.check_config(self.Agent_config["config"])

        # Environment
        if Environment is not None:
            self.setupEnvironment(**Environment)
        assert self.Env_congif is not None, "Environment not set"
        Environment = self.Env_congif

        # Training
        if Training is not None:
            self.setupTraining(Training)
        assert self.Training_config is not None, "Training not set"
        Training = self.Training_config

        # Merge all configuration for Training
        training_config = deepcopy(Training)
        training_config["config"] = config
        training_config["local_dir"] = Training["local_dir"] + "/" + Environment["env"]
        self.localdir = training_config["local_dir"] + "/" + Training["name"]

        self.save_config()
        
        if "CV" in Environment["env"]:
            training_config["config"]["env"] = CurriculumEnv
            training_config["config"]["env_config"] = {**Environment["Env_setup"], "local_dir": self.localdir}
            training_config["config"]["env_task_fn"] = curriculum_fn
            training_config["config"]["callbacks"] = CV_CallBack
        else:
            training_config["config"]["env"] = Environment["env"]
            training_config["config"]["env_config"] = Environment
            training_config["config"]["callbacks"] = PG_callback
        if recover is not None:
            from ray.tune.registry import register_env
            exec("register_env(env, env_creator)",{"register_env": register_env}, {"env": Environment["env"], "env_creator": env_creator})
            training_config["restore"] = self.getChkPath(recover, specific_chk)
        self.analysis = ray.tune.run(self.agent, **training_config)

    def save_config(self):
        path = self.localdir
        
        Temp_config = {"Training": self.Training_config, 
                       "Agent": self.Agent_config, 
                       "Environment": self.Env_congif}
        path += f"/Model/"
        if not os.path.exists(path):
            os.makedirs(path) 
        for key, value in Temp_config.items():
            with open(f"{path}/{key}.json", 'w') as outfile:
                json.dump(value, outfile)      
        print('Agent Config Saved')

    def load(self, path: str, specific_chk: bool=False, mode="train", env = None):
        """
        Agent loading function.
        :param path: Path to the saved agent
        """
        path_config = f"{path}/Model/"
        self.localdir = path
        # Load Configuration Variables
        if os.path.isfile(path_config+"Config.json") :
            with open(f"{path_config}/Config.json") as file:
                Temp_config = json.load(file)
        else:
            Temp_config = {}
            for config_type in self.config_types:
                assert os.path.isfile(f"{path_config}/{config_type}.json"), f"{config_type} configuration file not found"
                with open(f"{path_config}/{config_type}.json") as file:
                    Temp_config[config_type] = json.load(file)
        
        # Load Configurations
        self.setupTraining(Temp_config["Training"])
        self.setupAgent(**Temp_config["Agent"])
        if mode == "test":
            self.setTestMode()
        self.setupEnvironment(**Temp_config["Environment"])

        # Define Checkpoint path
        checkpoint_path = self.getChkPath(path, specific_chk)

        # Load Agent
        config = self.Agent_config["config"]
        if env is not None:
            config["env"] = env["env"]
            config["env_config"] = env["env_config"]
        else:
            if "CV" in self.Env_congif["env"]:
                config["env"] = CurriculumEnv
                config["env_config"] = {**self.Env_congif["Env_setup"], "local_dir": self.localdir}
                config["env_task_fn"] = curriculum_fn
                config["callbacks"] = CV_CallBack
            else:
                from ray.tune.registry import register_env
                exec("register_env(env, env_creator)",{"register_env": register_env}, {"env": self.Env_congif["env"], "env_creator": env_creator})
                config["env"] = self.Env_congif["env"]
                config["env_config"] = self.Env_congif
        self.agent = self.agent(config=config)
        self.agent.restore(checkpoint_path=checkpoint_path)
    
    def setTestMode(self):
        self.Agent_config["config"]["num_workers"] = 0
        self.Agent_config["config"]["num_envs_per_worker"] = 1

    def get_action(self, observation, add_info=True, **kwargs):
        if self.state is None and (self.Agent_config["config"]["model"]["use_lstm"]):
            if "lstm_cell_size" in self.Agent_config["config"]["model"].keys():
                cell_size = self.Agent_config["config"]["model"]["lstm_cell_size"]
            else:
                cell_size = 256
            state = [np.zeros(cell_size, np.float32),
               np.zeros(cell_size, np.float32)]
        else:
            state = self.state
        res = self.agent.compute_single_action(observation, state=state, full_fetch=add_info, **kwargs)
        if add_info:
            action = res[0]
            action_dict = res[2]
            action_probs = actionDistribution2Probabilities(action_dict['action_dist_inputs'])
            return action, action_probs
        else:
            return res
            
    def check_config(self, config: Dict):
        for item, value in config.items():
            if type(value) == Dict:
                config[item] = self.check_config(value)
            elif type(value) == list:
                config[item] = tune.grid_search(value)
        return config
    
    def getChkPath(self, path, specific_chk):
        from RLAgent.Utils.helpers import get_checkpoints
        root_folders, checkpoints_all = get_checkpoints(path)
        if len(checkpoints_all) == 0:
            raise ValueError(f"No checkpoints found in {path}")
        for i, ch in enumerate(checkpoints_all):
            folderdir_ = deepcopy(root_folders[i]).split('/')[-2]
            if specific_chk:
                if "task" in folderdir_.lower():
                    print(f"{i}: {ch} - {folderdir_} End")
                else:
                    print(f"{i}: {ch}")
        if specific_chk:
            answer = input("Select checkpoint: ")
            assert answer.isdigit(), "Must input an integer"
            answer = int(answer)
            assert 0<= answer< len(checkpoints_all), "Not a valid checkpoint"
        else:
            answer = len(checkpoints_all)-1
        checkpoint_path = root_folders[int(answer)] + checkpoints_all[int(answer)]
        self.loaded_checkpoint = checkpoints_all[int(answer)]
        print(f"Loading checkpoint {self.loaded_checkpoint}")
        return checkpoint_path
