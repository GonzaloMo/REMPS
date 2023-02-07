from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
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
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                reward += 1
    # Negative reward per step 
    reward -= 0.1/env.SatSim.period
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 0.01:
            reward = -10000
    return reward