import gym
import os
import SimpleSatellite
import SimpleWorld
import curses
import yaml
import sys
from time import sleep
from tqdm import tqdm
from Utils.test_utils import *
import numpy as np

## Arguments
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-env", "--environment", type=str, dest="env", required=True, help="Environment registration name")
parser.add_argument("-c", "--config", type=str, dest="config", default="", help="Environment configuration file registration name")
parser.add_argument("-n", "--n_test", type=int, dest="n_test", default=10, help="Number of tests")
args = parser.parse_args()
env_name, config_file, n_test = args.env, args.config, args.n_test
env_div = env_name.split("-")

if config_file == "":
    config_file = f"./{env_div[0]}/{env_div[0]}/envs/{env_div[1]}/Configurations/{env_div[2]}.yaml"

with open(config_file, "r") as f:
    config = yaml.load(f, Loader=yaml.FullLoader)

def single_test(input_tuple):
    env_name, env_config, p = input_tuple
    env_config["name"] = f"Planner_{p}"
    print("Planner name", env_config["name"])
    env = gym.make(env_name,**env_config)
    observation, _ = env.reset()
    episode_reward = 0
    done = False
    while not done:
        action = env.action_space.sample()
        observation, reward, done, info = env.step(action)
        episode_reward += reward
    return episode_reward

from multiprocessing import Pool
if __name__ == "__main__":
    pool = Pool(processes=4)
    input_tuple = [(env_name, config, i) for i in range(n_test)]
    for i, episode_reward in enumerate(tqdm(pool.imap(single_test, input_tuple), total=n_test)):
        print(f"Episode {i}: {episode_reward}")
    pool.close()
