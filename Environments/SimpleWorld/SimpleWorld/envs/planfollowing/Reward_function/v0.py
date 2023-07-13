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
    next_pos = env.next_plan_state
    dpos = env.action_pos_dict[action_in]
    pos = env.pos
    x, y = pos
    blocked = False
    x_n, y_n = np.clip(pos + dpos, 0, grid_size-1)
    if x_n < 0 or x_n >= grid_size or y_n < 0 or y_n >= grid_size:
        blocked = True
        reward =  -1
    if Map[x_n][y_n] == env.sim.obstacleTag:
        blocked = True
        reward =  -1
        
    elif Map[x_n][y_n] == env.sim.goalPositionTag:
        reward = 20
    else:
        reward = 0
    X_nn, Y_nn = next_pos
    if Map_plan[x_n][y_n] == env.sim.goalPositionTag and not blocked:
        if X_nn == x_n and Y_nn == y_n:
            reward += 2
        reward += 1
    info = {}
    return reward, info

def Reward_v1(env, action_in):
    # Get action and observation
    reward = 0.01
    grid_size = env.sim.grid_size
    obs = env.get_obs()
    Map = np.reshape(obs["Map"], (grid_size, grid_size))
    Map_plan = np.reshape(obs["Planner_Map"], (grid_size, grid_size))
    next_pos = env.next_plan_state
    dpos = env.action_pos_dict[action_in]
    pos = env.pos
    x, y = pos
    blocked = False
    x_n, y_n = np.clip(pos + dpos, 0, grid_size-1)
    if x_n < 0 or x_n >= grid_size or y_n < 0 or y_n >= grid_size:
        blocked = True
        reward =  -1
    if Map[x_n][y_n] == env.sim.obstacleTag:
        blocked = True
        reward =  -1
        
    elif Map[x_n][y_n] == env.sim.goalPositionTag:
        reward = 20
    else:
        reward = 0
    X_nn, Y_nn = next_pos
    if Map_plan[x_n][y_n] == env.sim.goalPositionTag and not blocked:
        if X_nn == x_n and Y_nn == y_n:
            reward += 2
        reward += 1
    info = {}
    return reward, info