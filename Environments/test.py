import gym
import os
import SimpleSatellite
import curses
import yaml
import sys
from tqdm import tqdm
from Utils.test_utils import *
import numpy as np

## Arguments
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-env", "--environment", type=str, dest="env", required=True, help="Environment registration name")
parser.add_argument("-c", "--config", type=str, dest="config", default="",  help="Environment configuration file registration name")
parser.add_argument("-n", "--n_test", type=int, dest="n_test", default=10, help="Number of tests")
parser.add_argument("-r", "--render", type=str, dest="render", default="", help="Render Type")
args = parser.parse_args()
env_name, config_file, n_test, render = args.env, args.config, args.n_test, args.render
env_div = env_name.split("-")
if config_file == "":
    config_file = f"./{env_div[0]}/{env_div[0]}/envs/{env_div[1]}/Configurations/v2.yaml"

console = curses.initscr()
with open(config_file, "r") as f:
    config = yaml.load(f, Loader=yaml.FullLoader)


env = gym.make(env_name,**config)
for epi in tqdm(range(n_test)):
    obs = env.reset()
    done = False
    while not done:
        action = env.action_space.sample()
        observation, reward, done, info = env.step(action)
        env.render(render_type=render)
        print_obs(observation, console)
env.quit()

curses.endwin()

# for i in range(0,4):
#     env.set_task(i)
#     epi_percentage = []
#     rewards = []
#     for epi in tqdm(range(100)):
#         obs = env.reset()
#         done = False
#         while not done:
#             action = env.action_space.sample()
#             observation, reward, done, info = env.step(action)
#             env.render()
#             print_obs(observation)