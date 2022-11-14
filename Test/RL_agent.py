###### Arguments #############
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-m", "--mode", type=str, dest="mode", default=f"train", choices=["train", "test"], required=True)
parser.add_argument("-c", "--config", type=str, dest="config", default=f"./Configurations/RLAgent/")
parser.add_argument("-n", "--n_test", type=int, dest="n_test", default=10)
parser.add_argument("-r", "--recover", type=str, dest="recover", default=None)
args = parser.parse_args()
mode = args.mode
Config = args.config
recover = args.recover
if Config == "./Configurations/RLAgent/": 
    Config = Config + f"{mode}_config.yml"
###### Import Libraries ######
print("Importing Libraries")
import yaml
import numpy as np
import os
import ray
from typing import Dict
from RLAgent import RAY_agent, env_creator

print("Libraries Imported")
###### Load Configuration ######
print("Loading Configuration")
if os.path.isfile(Config):
    with open(Config, "r") as f:
        MainConfig = yaml.load(f, Loader=yaml.FullLoader)
else:
    raise ValueError(f"Configuration file {Config} not found")
###### Register Environment ######
print("Registering Environment")

from ray.tune.registry import register_env
if "env_config" in MainConfig["Environment"]:
    env_name = MainConfig["Environment"]["env_config"]["env"]
else:
    env_name = MainConfig["Environment"]["env"]
register_env(env_name, env_creator)

###### Start Ray ######
ray.init(ignore_reinit_error=True)
agent = RAY_agent()
if recover is not None:
    agent.load(recover)
    print(f"Recovering from {recover}")

###### Main #############
if __name__=="__main__":
    # Load Config
    
    #----------------- Train Agent -----------------#
    if mode == "train":
        agent.train(**MainConfig)
    #----------------- Test Agent -----------------#
    elif mode == "test":
        # Create environment
        env_config = MainConfig["Environment"]
        env = env_creator(env_config)
        obs = env.reset()
        while True:
            action = agent.get_action(obs)
            print(env.Number2name_action(action))
            obs, reward, done, info = env.step(action)
            env.render()
            if done:
                break