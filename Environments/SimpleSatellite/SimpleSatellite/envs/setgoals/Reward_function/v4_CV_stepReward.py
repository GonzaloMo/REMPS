from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np

# Leran to take picture, analyse and dump of specific goals no penalties
def Reward_0(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  1
        elif action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                return 2
        elif action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                return 5
        elif action == SatelliteSim.ACTION_DO_NOTHING:
            check_TP, _ = env.SatSim.check_action(SatelliteSim.ACTION_TAKE_IMAGE, None)
            check_AP, _ = env.SatSim.check_action(SatelliteSim.ACTION_ANALYSE, None)
            check_DP, _ = env.SatSim.check_action(SatelliteSim.ACTION_DUMP, None)
            if not (check_TP or check_AP or check_DP):
                return 1/period
    return 0

# Leran to take picture, analyse and dump of specific goals with penalties for wrong actions 
def Reward_1(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    standard_penalty = -10/period
     
    obs = env.get_obs()
    orbit = obs["Orbit"]
    pos = env.SatSim.orbit_pos
    new_pos =  pos + env.SatSim.dt*env.SatSim.velocity
    if new_pos > env.SatSim.CIRCUNFERENCE and (orbit+1 > env.SatSim.MAX_ORBITS):
        reward = -100 * (np.sum(env.goals)/np.sum(env.initial_goals))
    else:
        reward = 0
    if check_action:
        # Get action and observation 
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  1 + reward
        elif action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                return 2 + reward
        elif action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                return 5 + reward
        elif action == SatelliteSim.ACTION_DO_NOTHING:
            check_TP, _ = env.SatSim.check_action(SatelliteSim.ACTION_TAKE_IMAGE, None)
            check_AP, _ = env.SatSim.check_action(SatelliteSim.ACTION_ANALYSE, None)
            check_DP, _ = env.SatSim.check_action(SatelliteSim.ACTION_DUMP, None)
            if not (check_TP or check_AP or check_DP):
                return 0 + reward
    return standard_penalty + reward