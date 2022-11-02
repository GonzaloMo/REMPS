import SimpleSatellite
from typing import Dict, List, Tuple, Union
import gym
import os
current_dir = os.getcwd()
def env_creator(env_config: Dict={"env": "SimpleSatellite-v0", "Env_setup": "./Configurations/Environment_Config/Env_1.yaml", 
            "Reward_Module": "Reward_functions.SimpleSat", "Reward_Function": "Reward_v1", "Log_dir": "./Results/Sim/"}):
    # Import Reward function
    import importlib
    module_name = env_config["Reward_Module"]
    Rewards = importlib.import_module(module_name, package=None)
    enc_config_file = env_config["Env_setup"].replace("./", f"{current_dir}/")
    import yaml
    with open(enc_config_file, "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    config["Reward"] = getattr(Rewards, env_config["Reward_Function"])
    config["Log_dir"] = env_config["Log_dir"]
    MyEnv = gym.make(env_config["env"], **config)
    return MyEnv  # return an env instance
        


