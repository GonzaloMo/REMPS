from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np

def Reward_v1(env: gym.Env, action_in: Tuple[int,int]):
    task_dificulty = env.get_task()
    return Reward_1(env, action_in)
    # if task_dificulty == 0:
    #     return Reward_0(env, action_in)
    # else:
    #     return Reward_1(env, action_in)


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
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"] * env.initial_goals
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
                return 0
    return standard_penalty