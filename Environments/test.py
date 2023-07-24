import gym
import os
import SimpleSatellite
import SimpleWorld
import curses
import yaml
import sys
from copy import deepcopy
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

action_input = []

env = gym.make(env_name,**config)
action_input = []
action_list_render = "\n"
for i in range(0, len(env.action_list), 2):
    action_input.append(i)
    action_input.append(i+1)
    action_list_render += f"{i}: {env.action_list[i]:<20} {i+1}: {env.action_list[i+1]}\n"
action_input.append("q")
if "CV" in env_name:
    difficulty = 0
    env.set_task(difficulty)
for epi in tqdm(range(n_test)):
    n_timestep = 0
    observation = env.reset()
    env.render(render_type=render)
    done = False
    episode_reward = 0
    exitloop = False
    action_info = {"Action": "", "Last Action": " ", "Actions List": action_list_render}
    info = [action_info, observation, {"Instant Reward":  0,"Reward": 0}]
    last_action = " "
    if pObs:
        console =  print_obs(info, console) # , stp=env.sim.grid_size)
    while not done:
        if inAct:
            action_in = None
            if type(observation) == dict and "Busy" in observation.keys():
                if observation["Busy"] == 1:
                    action_in = 0
            if action_in is None:
                if n_timestep > 0:
                    n_timestep -= 1
                    action_in = 0
                else:
                    Correct_action = False
                    while not Correct_action:
                        if pObs:
                            action_in = console.getstr(1,21, 4).decode(encoding="utf-8")
                            while len(action_in)<1:
                                action_in = console.getstr(1,21, 4).decode(encoding="utf-8")
                        else:
                            action_in = input(f"Action {action_list_render} ")
                        if action_in == "q":
                            if pObs:
                                curses.endwin() 
                            exit()
                        elif len(action_in) > 1 and action_in[0] == "0":
                            n_timestep = int(action_in[1:])
                            action_in = 0
                            Correct_action = True
                        else:
                            n_timestep = 0
                            action_in = int(action_in)
                            if int(action_in) < len(action_input):
                                Correct_action = True
            action = action_input[action_in]
            action_info["Action"] = " "
        else:
            action = env.action_space.sample()
            action_info["Action"] = env.action_list[int(action)]
        
        
        if action < env.action_space.n:
            if last_action == " ":
                last_action = "None"
            else:
                last_action = env.action_list[int(last_action)]
            action_info["Last Action"] = last_action
            
            last_action = action
            observation, reward, done, info_env = env.step(action)
            action_name = env.action_list[action]
            episode_reward += reward
            info = [action_info, observation, {"Reward Type": env.Reward_name,  "Instant Reward":  reward,"Reward": episode_reward}, info_env]
            if pObs:
                console =  print_obs(info, 
                                    console, 
                                    )
                console.refresh()
            
            env.render(render_type=render)
            
        else:
            last_action = "Not Valid Action"
    if "CV" in env_name:
        difficulty += 1
        env.set_task(difficulty)
    if pObs:
        next_episode = console.getstr(1,21, 4).decode(encoding="utf-8")
        if not next_episode == "y": 
            break


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



