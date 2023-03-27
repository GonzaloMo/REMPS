import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-d', '--debug', action='store_true', help='debug mode')
args = parser.parse_args()
debug = args.debug

import gym
import SimpleSatellite
if not debug:
    import curses
import yaml
import sys
import numpy as np
from matplotlib import pyplot as plt

#############################################################
#####   Function helpers
#############################################################
def get_obs_str(obs, stp = 4):
    hline = "-" *10 + "\n"
    blank_space = " "
    obs_str = ""
    obs_str += hline
    for k, v in obs.items():
       key_str = k+":"
       if k == "Ground Stations" or k == "Targets":
            obs_str += f"{key_str: <20} {v[0:stp]}\n"
            for j in range(stp, len(v), stp):
                up_lim = int(min(j+stp, len(v)))
                obs_str += f"{blank_space: <20} {v[j:up_lim]}\n"
            
       else:
            obs_str += f"{key_str: <20} {v}\n"
    obs_str += hline
    return obs_str
if not debug:
    def print_obs(obs):
        obs_list = get_obs_str(obs).split("\n")
        # for i, v in enumerate(obs_list):
        #     print(i, v)
        console.clear()
        for i, v in enumerate(obs_list):
            console.addstr(i , 0, v)
            console.refresh()

def sinCos2degree(x, y):
    rad = np.arctan2(x, y)
    if rad < 0:
        rad += 2 * np.pi
    return rad * 180 / np.pi

def plot_windows(obs, fig, ax):
    x = np.arange(0, len(obs["Light Condition"]))
    i = 0
    ax.cla()
    colors = {"Target Visibility": (1., 128/255, 0.), "Ground Station Visibilty": (128/255., 0., 1.), "Light Condition":(1., 1., 0)}
    for k, v in obs.items():
        if k == "Target Visibility" or k == "Ground Station Visibilty" or k == "Light Condition":
            ax.plot(x, v+i*(1.25), label=k, color=colors[k])
            i+=1
    ax.legend(loc="upper center")
    ax.xlim = (0, len(obs["Light Condition"]))
    ax.set_yticks([])
    fig.canvas.draw_idle()
    plt.pause(0.0001)
    

#############################################################
#####   MAIN
#############################################################

Mainconfigfile = "./Configurations/setgoals_v2.yaml"
with open(Mainconfigfile) as f:
    config = yaml.load(f, Loader=yaml.FullLoader)
env = gym.make('SimpleSatellite-setgoals-v2', **config)

from ORToolAgent import makeAgent

if not debug:
    console = curses.initscr()  
obs = env.reset()
agent = makeAgent(env)
done = False
fig, ax = plt.subplots(1,1)
while not done:
    action = agent.getAction(obs)
    observation, reward, done, info = env.step(action)
    env.render()
    obs = env.SatSim.get_state()
    obs_agent = agent.observationHandler(obs)
    print_obs(obs)
    plot_windows(obs_agent, fig, ax)

env.view.quit()
if not debug:
    curses.endwin()