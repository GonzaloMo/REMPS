from typing import Dict, List, Tuple, Union
import gym
import numpy as np

def Reward_v0(env: gym.Env, action_in):
    # Get action and observation
    reward = 0
    grid_size = env.sim.grid_size
    obs = env.get_obs()
    Map = np.reshape(obs["Map"], (grid_size, grid_size))
    dpos = env.action_pos_dict[action_in]
    pos = env.pos
    x_n, y_n = pos + dpos
    if 0<x_n<grid_size-1:
        clipped = False
    else: 
        clipped = True
    if 0<y_n<grid_size-1:
        clipped = False
    else:
        clipped = True

    x_n, y_n = np.clip([x_n, y_n], a_min=0, a_max=grid_size-1)
    if Map[x_n][y_n] == env.sim.obstacleTag or clipped:
        reward = -100
    elif Map[x_n][y_n] == env.sim.goalPositionTag:
        reward = 10
    else:
        reward = -0.01
    return reward
