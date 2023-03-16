import gym
import SimpleSatellite
import curses
import yaml
import sys
import numpy as np

Mainconfigfile = "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/v2.yaml"
CV_path = [
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_0.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_1.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_2.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_3.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_4.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_5.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_6.yaml",
]
env = gym.make('SimpleSatellite-setgoals_CV-v2', config_files={"main_config_file": Mainconfigfile, "CV_path": CV_path, "Reward_Function": "Reward_v1"})

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

def print_obs(obs):
    obs_list = get_obs_str(obs).split("\n")
    # for i, v in enumerate(obs_list):
    #     print(i, v)
    console.clear()
    for i, v in enumerate(obs_list):
       console.addstr(i , 0, v)
    console.refresh()
console = curses.initscr()

def sinCos2degree(x, y):
    rad = np.arctan2(x, y)
    if rad < 0:
        rad += 2 * np.pi
    return rad * 180 / np.pi

for i in range(5,len(CV_path)):
    env.set_task(i)
    # print(env.difficulty_config[i])
    obs = env.reset()
    done = False
    
    while not done:
        action = env.action_space.sample()
        observation, reward, done, info = env.step(action)
        env.render()
        obs = env.SatSim.get_state()
        print_obs(observation)
        # print_obs(obs, stp=1)

    
env.view.quit()
curses.endwin()