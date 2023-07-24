import gym
import os
import SimpleSatellite
import SimpleWorld
import PDDLPlanner
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
parser.add_argument("-c", "--config", type=str, dest="config", default="", help="Environment configuration file registration name")
parser.add_argument("-n", "--n_test", type=int, dest="n_test", default=10, help="Number of tests")
parser.add_argument("-r", "--render", type=str, dest="render", default="", help="Render Type")
parser.add_argument("-o", "--observation", dest="pobs", action="store_true")
args = parser.parse_args()
env_name, config_file, n_test, render, pObs = args.env, args.config, args.n_test, args.render, args.pobs
env_div = env_name.split("-")

if config_file == "":
    # config_file = f"/home/{env_div[0]}/{env_div[0]}/envs/{env_div[1]}/Configurations/{env_div[2]}.yaml"
    config_file = "./Utils/v0.yaml"

if pObs:
    console = curses.initscr()
with open(config_file, "r") as f:
    config = yaml.load(f, Loader=yaml.FullLoader)

env = gym.make(env_name,**config)

## Agent 
with open("./PDDLPlanner/Configurations/Planner.yml", "r") as f:
    config = yaml.load(f, Loader=yaml.FullLoader)
agent = PDDLPlanner.Planner(env, **config)
agent.generateDomain()

for epi in tqdm(range(n_test)):
    observation, _ = env.reset()
    env.render(render_type=render)
    # plan = agent.get_plan(obs)
    done = False
    i = 0
    while not done:
        action, info_agent = agent.get_action(observation)
        plan_eff = [a.getEffects() for a in agent.plan]
        if i == 0:
            env.render(render_type=render, Premade_path=plan_eff)
            startSim = input("Start Sim (y/n): ")
            if not startSim == "y":
                break
            i+=1
        observation, reward, done, info_env = env.step(action)
        info = {**info_agent, **info_env}
        if pObs:
            console =  print_obs(observation, 
                                 console, 
                                 other_info=info, 
                                 stp=env.sim.grid_size)
            console.refresh()
        env.render(render_type=render, Premade_path=plan_eff)
        
    env.quit()
    agent.reset_episode()
if pObs:
    curses.endwin() 