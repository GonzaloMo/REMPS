import os
from typing import Dict
import yaml

###### Arguments #############
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--env_name", type=str, default="SimpleSatellite-v0")
parser.add_argument("--save_dir", type=str, default=f"/Logs/Agent/")
parser.add_argument("--algo", type=str, default="PPO")
parser.add_argument("--reward_module", type=str, default="Reward_functions.SimpleSat")
parser.add_argument("--reward_type", type=str, default="Reward_v1")
parser.add_argument("--env_config", type=str, default="Trainning_1")
parser.add_argument("--n_episodes", type=int, default=10)
parser.add_argument("--render", type=bool, default=False)
args = parser.parse_args()
env_name = args.env_name
current_path = os.path.dirname(os.path.abspath(__file__))
save_dir = current_path + args.save_dir
ALGORITHM = args.algo
Env_directory = f"Environment_Config/"
env_config = args.env_config
Reward_type = args.reward_type
Reward_module = args.reward_module


###### Make Environment ######
import SimpleSatellite
import gym
Rewards = importlib.import_module(Reward_module, package=None)
with open(f"{current_path}/Environment_Config/{env_config}.yaml", "r") as f:
     config = yaml.load(f, Loader=yaml.FullLoader)
config["Reward"] = getattr(Rewards, Reward_type)
env = gym.make("SimpleSatellite-v0", **config)

###### Load Agent ######
from agent import RAY_agent
agent = RAY_agent()
Save_path = f"Logs/Agent/{env_name}/{ALGORITHM}_{env_config}"
agent.load(Save_path)
    
###### Test Agent ######
reward = 0
for i in range(n_episodes):
    reward += agent.test(env, render=True)
print(f"Average reward: {reward/n_episodes}")