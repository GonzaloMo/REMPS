from typing import Dict, List, Tuple, Union
import gym
import numpy as np

def Reward_v0(env, action_in):
    # Get action and observation
    reward = 0
    grid_size = env.sim.grid_size
    obs = env.get_obs()
    Map = np.reshape(obs["Map"], (grid_size, grid_size))
    Map_plan = np.reshape(obs["Planner_Map"], (grid_size, grid_size))
    next_pos = obs["Next_state"]
    dpos = env.action_pos_dict[action_in]
    pos = env.pos
    x, y = pos
    x_n, y_n = pos + dpos
    info = {"Next_state": next_pos, "Planner_Map": Map_plan[x_n][y_n]}
    if x_n < 0 or x_n >= grid_size or y_n < 0 or y_n >= grid_size:
        return -1, info

    if Map[x_n][y_n] == env.sim.obstacleTag:
        return -1, info
    elif Map[x_n][y_n] == env.sim.goalPositionTag:
        reward = 40
    else:
        reward = -0.1
    X_nn, Y_nn = next_pos
    
    if Map_plan[x_n][y_n] == env.sim.goalPositionTag:
        if X_nn == x_n or Y_nn == y_n:
            reward += 5
        reward += 10

    return reward, info

