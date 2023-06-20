from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np
def cossin_2_degrees(x: float, y: float) -> float:
    return np.degrees(np.arctan2(y, x))
#####
def Reward_test(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0
    # Get action and observation
    obs = env.get_obs()
    goals = env.goals
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action, img)
    limit_orbits = max(30, np.sum(env.initial_goals)/4)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += 1
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += 1
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 1
            if goals[img-1] == 1:
                reward += 100

    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 0.01:
            reward = -100000
    return reward