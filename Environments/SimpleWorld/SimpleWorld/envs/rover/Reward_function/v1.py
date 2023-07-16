from typing import Dict, List, Tuple, Union
import gym
import numpy as np

def Reward_Test(env: gym.Env, action_in):
    # Get action and observation
    grid_size = env.sim.grid_size
    obs = env.get_obs()
    Map = np.reshape(obs["Map"], (grid_size, grid_size))
    goalMap = np.reshape(obs["Goal"], (grid_size, grid_size))
    dpos = env.action_pos_dict[env.action_list[action_in]]
    pos = env.pos
    x_n, y_n = pos + dpos
    if x_n < 0 or x_n >= grid_size or y_n < 0 or y_n >= grid_size:
        return -1, {}
    else:
        x_n, y_n = np.clip(pos - np.array(dpos), a_min=0, a_max=grid_size-1)
    if goalMap[x_n][y_n]:
        return 10, {}

    if Map[x_n][y_n] == env.sim.obstacleTag:
        return -1, {}
    elif Map[x_n][y_n] == env.sim.goalPositionTag:
        return .1, {}
    else:
        return -.01, {}
