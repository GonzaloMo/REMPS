import os
from typing import Dict
import yaml

###### Arguments #############
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--env_name", type=str, default="SimpleSatellite-v0")
parser.add_argument("--load_dir", type=str, default=f"./Results/SimpleSatellite-v0/PPO_Trainning_1")
parser.add_argument("--reward_module", type=str, default="Reward_functions.SimpleSat")
parser.add_argument("--reward_type", type=str, default="Reward_v1")
parser.add_argument("--env_config", type=str, default="Trainning_1")
parser.add_argument("--n_episodes", type=int, default=10)
parser.add_argument("--render", type=bool, default=False)
args = parser.parse_args()
env_name = args.env_name
current_path = os.path.dirname(os.path.abspath(__file__))
load_dir = args.load_dir
Env_directory = f"Environment_Config/"
env_config_type = args.env_config
Reward_type = args.reward_type
Reward_module = args.reward_module
n_episodes = args.n_episodes

###### Make Environment ######
import SimpleSatellite
import gym
import importlib
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
env_config = {"Config": env_config_type, "Reward_function": Reward_type}
env = env_creator(env_config)

###### Load Agent ######
from agent import RAY_agent
agent = RAY_agent()
agent.load(load_dir)
    
###### Test Agent ######
reward = 0
for i in range(n_episodes):
    reward += agent.test(env, render=True)
print(f"Average reward: {reward/n_episodes}")