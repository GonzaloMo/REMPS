###### Import Libraries ######
import yaml
import numpy as np
import os
from typing import Dict


###### Arguments #############
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--env_name", type=str, default="SimpleSatellite-v0")
parser.add_argument("--save_dir", type=str, default=f"/Logs/Agent/")
parser.add_argument("--algo", type=str, default="PPO")
parser.add_argument("--reward_type", type=str, default="Reward_v1")
args = parser.parse_args()
env_name = args.env_name
current_path = os.path.dirname(os.path.abspath(__file__))
save_dir = current_path + args.save_dir
ALGORITHM = args.algo
Env_directory = f"Environment_Config/"
Reward_type = args.reward_type

###### Make Environment ######
import SimpleSatellite
import gym
from ray.tune.registry import register_env


def env_creator(env_config: Dict={"Config": "Trainning_1", "Reward_function": "Reward_v1"}):
    # Import Reward function
    import importlib
    module_name = "Reward_functions.SimpleSat"
    Rewards = importlib.import_module(module_name, package=None)
    name = env_config["Config"]
    with open(f"{current_path}/Environment_Config/{name}.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    config["Reward"] = getattr(Rewards, env_config["Reward_function"])
    MyEnv = gym.make("SimpleSatellite-v0", **config)
    return MyEnv  # return an env instance
register_env(env_name, env_creator)
###### Make Agent ######
from agent import RAY_agent
with open("Agent_Config/PPO_Config.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
config["env"] = env_name
agent = RAY_agent(run = ALGORITHM, config = config, save_dir=f"{save_dir}")

############################################################################################################
    ###### Train Agent ######
if __name__ == "__main__":
    # ["Trainning_1"] # ["Trainning_1", "Trainning_2", "Trainning_3", "Trainning_4", "Trainning_5"]
    configFiles = [f.replace(".yaml","") for f in os.listdir(Env_directory) if os.path.isfile(os.path.join(Env_directory, f))]
    configFiles.sort()
    print(configFiles)
    i = 0
    for env_config_file in configFiles[1:]:
        Save_path = f"{save_dir}{env_name}/{ALGORITHM}_{env_config_file}/"
        if i == 0:
            restore_lc = False
        else:
            restore_lc = True
        stop_criteria = {"timesteps_total": 10000000}
        env_config: Dict={"Config": env_config_file, "Reward_function": Reward_type}
        agent.train(stop_criteria, env_config, Save_path, restore_lc=restore_lc)
        i+=1

        ###### Save Agent ######
        agent.save(Save_path)