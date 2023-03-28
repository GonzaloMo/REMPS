from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np

def cossin_2_degrees(x: float, y: float) -> float:
    return np.degrees(np.arctan2(x, y))

def Reward_v1(env: gym.Env, action_in: Tuple[int,int]):
    
    reward = 0
    # Get action and observation
    obs = env.get_obs()
    
    goals = env.goals
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    goals_after_action = deepcopy(goals)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                reward += 1
                goals_after_action[img-1] -= 1
    
    
            
    if np.sum(goals_after_action) == 0:
        reward += env.Max_goals * env.SatSim.n_targets * 0.5
    # Negative reward per step 
    reward -= 0.1/env.SatSim.period
    if env.SatSim.POWER_OPTION:
        if (obs["Power"]*100) < 25:
            reward = -1
        if (obs["Power"]*100) < 1:
            reward = -10000
    return reward


def Reward_v2(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0
    # Get action and observation
    obs = env.get_obs()
    goals = env.goals
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    goals_after_action = deepcopy(goals)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += .001
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += .002 
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                reward += 1
                goals_after_action[img-1] -= 1
    
            
    if np.sum(goals_after_action) == 0:
        reward += env.Max_goals * env.SatSim.n_targets * 0.5
    
    # Negative reward per step 
    reward -= 0.1/env.SatSim.period
    if env.SatSim.POWER_OPTION:
        if (obs["Power"]*100) < 25:
            reward -= .01
        if (obs["Power"]*100) < 1:
            reward = -10000
    return reward

def Reward_v3(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0
    # Get action and observation
    obs = env.get_obs()
    goals = env.goals
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    goals_after_action = deepcopy(goals)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += .001
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += .002 
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                reward += .1
                goals_after_action[img-1] -= 1
            
    if np.sum(goals_after_action) == 0:
        reward += 100 * math.log(math.e + 6*env.task_dificulty)
    # Negative reward per step 
    reward -= 0.1/env.SatSim.period
    if env.SatSim.POWER_OPTION:
        if (obs["Power"]*100) < 25:
            reward -= .001
        if (obs["Power"]*100) < 1:
            reward -= 100
    if obs["Memory Level"] > 0.9:
        reward -= .001
    elif obs["Memory Level"] > 0.5:
        reward -= .0001
    return reward



        

def Reward_v4(env: gym.Env, action_in: Tuple[int,int]):
    done = False
    reward = 0
    # Get action and observation
    obs = env.get_obs()
    goals = env.goals
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    goals_after_action = deepcopy(goals)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += .001
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += .002 
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                reward += .1
                goals_after_action[img-1] -= 1
    else:
        reward -= .0001

    if pos > env.SatSim.CIRCUNFERENCE and (env.SatSim.orbit+1) >= env.SatSim.MAX_ORBITS:
        done = True
        
    if np.sum(goals_after_action) == 0:
        done = True
        reward += 100 * math.log(math.e + 6*env.task_dificulty)
        reward += 20 * (1 - env.SatSim.orbit/env.SatSim.MAX_ORBITS) 
    
    if done:
        tot_goals = np.sum(env.initial_goals)
        if tot_goals  > 0:
            reward += 100 * (1 - np.sum(goals_after_action)/np.sum(env.initial_goals))
    # Negative reward per step 
    reward -= 0.1/env.SatSim.period
    if env.SatSim.POWER_OPTION:
        if (obs["Power"]*100) < 25:
            reward -= .001
        if (obs["Power"]*100) < 1:
            reward -= 100
    if obs["Memory Level"] > 0.9:
        reward -= .001
    elif obs["Memory Level"] > 0.5:
        reward -= .0001
    return reward
