import SimpleSatellite
from typing import Dict
import gym
import os
import ray.tune as tune
from typing import Dict, Any, List, Optional, Tuple, Union
from copy import deepcopy
current_dir = os.getcwd()
def env_creator_old(env_config: Dict={"env": "SimpleSatellite-setgoals-v0", "Env_setup": ["./Configurations/Environment_Config/Env_1.yaml"], 
            "Reward_Module": "Reward_functions.SimpleSat", "Reward_Function": "Reward_v1", "Log_dir": "./Results/Sim/"}):
    # Import Reward function
    import importlib
    split_env_name = env_config["env"].split("-")
    module_name = ".".join([split_env_name[0], "envs", split_env_name[1], "Reward_function", split_env_name[2]])
    Rewards = importlib.import_module(module_name, package=None)
    config = {}
    for env_config_file in env_config["Env_setup"]:
        env_config_file = env_config_file.replace("./", f"{current_dir}/")
        import yaml
        with open(env_config_file, "r") as f:
            config.update(yaml.load(f, Loader=yaml.FullLoader))
    config["Reward"] = getattr(Rewards, env_config["Reward_Function"])
    config["Log_dir"] = env_config["Log_dir"]
    MyEnv = gym.make(env_config["env"], **config)
    return MyEnv  # return an env instance

def env_creator(env_config: Dict={"env": "SimpleSatellite-setgoals-v0", "Env_setup": {},
     "Reward_Function": "Reward_v1", "Log_dir": "./Results/Sim/"}):
    # Import Reward function
    import importlib
    split_env_name = env_config["env"].split("-")
    module_name = ".".join([split_env_name[0], "envs", split_env_name[1], "Reward_function", split_env_name[2]])
    Rewards = importlib.import_module(module_name, package=None)
    config = deepcopy(env_config["Env_setup"])
    config["Reward"] = getattr(Rewards, env_config["Reward_Function"])
    config["Log_dir"] = env_config["Log_dir"]
    MyEnv = gym.make(env_config["env"], **config)
    return MyEnv  # return an env instance