from SimpleSatellite.envs.simulation.Base import SatelliteSim_Base as SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np

def cossin_2_degrees(x: float, y: float) -> float:
    return np.degrees(np.arctan2(x, y))
       
def Reward_v1(env: gym.Env, action_in: Tuple[int,int]):
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
                reward += .1
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += .1 
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                goals_after_action[img-1] -= 1
        if action == SatelliteSim.ACTION_DO_NOTHING:
            reward += .001
    else:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            reward -= .01
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            reward -= .01 
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            reward -= .01

    if pos > env.SatSim.CIRCUNFERENCE and (env.SatSim.orbit+1) >= env.SatSim.MAX_ORBITS:
        done = True
        
    if np.sum(goals_after_action) == 0:
        done = True
        reward += 1000 * math.log(math.e + 6*env.task_dificulty)
        reward += 200 * (1 - env.SatSim.orbit/env.SatSim.MAX_ORBITS)
    
    if done:
        tot_goals = np.sum(env.initial_goals)
        if tot_goals  > 0:
            reward += 1000 * (1 - np.sum(goals_after_action)/np.sum(env.initial_goals)) * math.log(math.e + 6*env.task_dificulty)
    
    if env.SatSim.POWER_OPTION:
        if (obs["Power"]*100) < 25:
            reward -= .001
        if (obs["Power"]*100) < .2:
            reward -= 1000
    if obs["Memory Level"] > 0.9:
        reward -= .001
    elif obs["Memory Level"] > 0.5:
        reward -= .0001
    return reward
