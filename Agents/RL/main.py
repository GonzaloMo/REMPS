###### Arguments #############
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-m", "--mode", type=str, dest="mode", default=f"train", choices=["train", "test"], required=True)
parser.add_argument("-c", "--config", type=str, dest="config", default=f"./Configurations/Training_config.yml")
parser.add_argument("-n", "--n_test", type=int, dest="n_test", default=10)
args = parser.parse_args()
mode = args.mode
Config = args.config

###### Import Libraries ######
print("Importing Libraries")
import yaml
import numpy as np
import os
import ray
from typing import Dict
from agent import RAY_agent

print("Libraries Imported")
ray.init(ignore_reinit_error=True)
agent = RAY_agent()
###### Register Environment ######
print("Registering Environment")
from Utils import env_creator
from ray.tune.registry import register_env
register_env("SimpleSatellite-v0", env_creator)

###### Main #############
if __name__=="__main__":
    # Load Config
    if os.path.isfile(Config):
        with open(Config, "r") as f:
            MainConfig = yaml.load(f, Loader=yaml.FullLoader)
    else:
        raise ValueError(f"Configuration file {Config} not found")
    #----------------- Train Agent -----------------#
    if mode == "train":
        agent.train(**MainConfig)

    #----------------- Test Agent -----------------#
    elif mode == "test":
        # Create environment
        env_config = MainConfig["Environment"]["env_config"]
        env_config["Log_dir"] = "./Logs/Test/"
        env_config["Training_Env"] = "./Configurations/Environment_Config/Env_1.yaml"
        env = env_creator(env_config)
        obs_r, _ = env.reset()
        print(obs_r)
        obs_s, _, _, _, _ = env.step(env.action_space.sample())
        print(obs_s)