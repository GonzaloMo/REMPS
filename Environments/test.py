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
parser.add_argument("-r", "--render", type=str, dest="render", default="", help="Render Type")
parser.add_argument("-a", "--action", dest="inAct", action="store_true")
parser.add_argument("-o", "--observation", dest="pobs", action="store_true")
args = parser.parse_args()
env_name, config_file, n_test, render, pObs, inAct = args.env, args.config, args.n_test, args.render, args.pobs, args.inAct
env_div = env_name.split("-")

if config_file == "":
    config_file = f"./{env_div[0]}/{env_div[0]}/envs/{env_div[1]}/Configurations/{env_div[2]}.yaml"

if pObs:
    console = curses.initscr()
    console.keypad(True)
with open(config_file, "r") as f:
    config = yaml.load(f, Loader=yaml.FullLoader)
action_input = {"w": 0, "s": 1, "a": 2, "d": 3, "q": "q"}

env = gym.make(env_name,**config)
for epi in tqdm(range(n_test)):
    observation, _ = env.reset()
    env.render(render_type=render)
    done = False
    episode_reward = 0
    exitloop = False
    action_info = {"Last Action": " ", "Actions": " "}
    info = {**action_info, "Instant Reward":  0,"Reward": 0}
    last_action = " "
    if pObs:
        console =  print_obs(observation, console, other_info=info, stp=env.sim.grid_size)
    while not done:
        if inAct:
            
            action_in = console.getstr(26,21, 2).decode(encoding="utf-8")
            if action_in in action_input.keys():
                action = action_input[action_in]
        else:
            action = env.action_space.sample()
        
        if action == "q":
            exitloop = True
            break
        
        if action < env.action_space.n:
            if last_action == " ":
                last_action = "None"
            else:
                last_action = env.action_list[int(last_action)]
            action_info["Last Action"] = last_action
            action_info["Actions"] = env.action_list[int(action)]
            last_action = action
            observation, reward, done, info_env = env.step(action)
            action_name = env.action_list[action]
            episode_reward += reward
            info = {**action_info, "Instant Reward":  reward,"Reward": episode_reward, **info_env}
            if pObs:
                console =  print_obs(observation, 
                                    console, 
                                    other_info=info, 
                                    stp=env.sim.grid_size)
                console.refresh()
            
            env.render(render_type=render)
        else:
            last_action = "Not Valid Action"
    env.quit()
    if exitloop:
        break
if pObs:
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



