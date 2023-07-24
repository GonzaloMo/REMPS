from typing import Dict, List, Tuple, Union
import gym
import numpy as np
def Reward_Test(env, action_in):
    # Get action and observation
    info = {}
    reward = 0.
    grid_size = env.sim.grid_size
    obs = env.get_obs()
    Map = np.reshape(obs["Map"], (grid_size, grid_size))
    VisiblePalnStates = np.reshape(obs["Visible_Plan_States"], (grid_size, grid_size))
    dpos = env.action_pos_dict[action_in]
    pos = env.pos
    x_n, y_n = pos + dpos
    if x_n < 0 or x_n >= grid_size or y_n < 0 or y_n >= grid_size:
        return -1, info
    x_n, y_n = np.clip(pos + dpos, 0, grid_size-1)
    if Map[x_n][y_n] == env.sim.obstacleTag:
        return -1, info
        
    if Map[x_n][y_n] == env.sim.goalPositionTag:
        return 1, info
    if [x_n, y_n] in VisiblePalnStates:
        return 1, info
    # {"x_n": x_n, "y_n": y_n, "blocked": blocked, "reward": reward, "next_pos": next_pos, "pos": pos, "dpos": dpos, "Map": Map, "Map_plan": Map_plan, "action": action_in}
    return reward, info

def Reward_0(env, action_in):
    # Get action and observation
    info = {}
    reward = 0.
    grid_size = env.sim.grid_size
    obs = env.get_obs()
    Map = np.reshape(obs["Map"], (grid_size, grid_size))
    VisiblePalnStates = np.reshape(obs["Visible_Plan_States"], (grid_size, grid_size))
    next_pos = env.next_plan_state
    dpos = env.action_pos_dict[action_in]
    pos = env.pos
    x_n, y_n = pos + dpos
    if x_n < 0 or x_n >= grid_size or y_n < 0 or y_n >= grid_size:
        return -1, info
    x_n, y_n = np.clip(pos + dpos, 0, grid_size-1)
    if Map[x_n][y_n] == env.sim.obstacleTag:
        return -1, info
        
    if Map[x_n][y_n] == env.sim.goalPositionTag:
        return 20, info
    X_nn, Y_nn = next_pos
    if [x_n, y_n] in VisiblePalnStates:
        if X_nn == x_n and Y_nn == y_n:
            return 5, info
        return 1, info
    # {"x_n": x_n, "y_n": y_n, "blocked": blocked, "reward": reward, "next_pos": next_pos, "pos": pos, "dpos": dpos, "Map": Map, "Map_plan": Map_plan, "action": action_in}
    return reward, info

def Reward_1(env, action_in):
    # Get action and observation
    info = {}
    reward = -0.01
    grid_size = env.sim.grid_size
    obs = env.get_obs()
    Map = np.reshape(obs["Map"], (grid_size, grid_size))
    obsVSP = list(np.reshape(obs["Visible_Plan_States"], (-1, 2)))
    VisiblePalnStates = [list(a) for a in obsVSP]
    info["VisiblePalnStates"] = VisiblePalnStates
    next_pos = env.next_plan_state
    dpos = env.action_pos_dict[action_in]
    pos = env.pos
    x, y = pos
    x_n, y_n = pos + dpos
    if x_n < 0 or x_n >= grid_size or y_n < 0 or y_n >= grid_size:
        return -1, info
    x_n, y_n = np.clip(pos + dpos, 0, grid_size-1)
    if Map[x_n][y_n] == env.sim.obstacleTag:
        return -1, info
        
    if Map[x_n][y_n] == env.sim.goalPositionTag:
        return 20, info
    X_nn, Y_nn = next_pos
    if [x_n, y_n] in VisiblePalnStates:
        if X_nn == x_n and Y_nn == y_n:
            return 5, info
        return 1, info
    # {"x_n": x_n, "y_n": y_n, "blocked": blocked, "reward": reward, "next_pos": next_pos, "pos": pos, "dpos": dpos, "Map": Map, "Map_plan": Map_plan, "action": action_in}
    return reward, info