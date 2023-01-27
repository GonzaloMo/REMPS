from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
import gym
import numpy as np
def cossin_2_degrees(x: float, y: float) -> float:
    return np.degrees(np.arctan2(y, x))
#####
def Reward_test(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0
    # Get action and observation
    obs = env.get_obs()
    pos = cossin_2_degrees(obs["Pos"][0], obs["Pos"][1])
    goals = env.goals
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += 1
                print("reward for taking a picture of {} is {}".format(img, reward))
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += 1
                print("reward for analysing a picture of {} is {}".format(img, reward))
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 1
                print("reward for dumping a picture of {} is {}".format(img, reward))
            if goals[img-1] == 1:
                reward += 100
                print("reward for dumping all picture of {} is {}".format(img, reward))

    
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 0.01:
            reward = -100000
    return reward

#####
#idea from v1 Reward v9:
def Reward_v1(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    
    # Get action and observation
    obs = env.get_obs()
    pos = cossin_2_degrees(obs["Pos"][0], obs["Pos"][1])
    goals = env.goals
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += 1000
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += 400
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= 10
        elif add_info == "Not above target":
            reward -= 10
        elif add_info == "Not in light":
            reward -= 1
        elif add_info == "No image to analyse":
            reward -= 10
        elif add_info == "No image to dump":
            reward -= 10
        elif add_info == "Not above GS":
            reward -= 10
        elif add_info == "Satellite busy":
            reward -= 100
    # # Incentivise having not having the memory free
    # if obs["Memory Level"] > 0.1:
    #     reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward = -1000000000000
        elif obs["Power"] < 100. and \
                env.SatSim.check_light()>0 and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward


########
# penalty for taking to long to achieve goals

def Reward_v2(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    
    # Get action and observation
    obs = env.get_obs()
    pos = cossin_2_degrees(obs["Pos"][0], obs["Pos"][1])
    goals = env.goals
    limit_orbits = max(30, np.sum(env.initial_goals)/4)

    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += 1000
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += 400
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 1000
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= 1
        elif add_info == "Not above target":
            reward -= 1
        elif add_info == "Not in light":
            reward -= .1
        elif add_info == "No image to analyse":
            reward -= 1
        elif add_info == "No image to dump":
            reward -= 1
        elif add_info == "Not above GS":
            reward -= 1
        elif add_info == "Satellite busy":
            reward -= 10

    ## penalty for taking to long to achieve goals
    if env.SatSim.orbit > limit_orbits and pos>359:
        reward -= min(10**(env.SatSim.orbit-limit_orbits/20), 100)
    # Incentivise having not having the memory free
    # if obs["Memory Level"] > 0.1:
    #     reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 10
        elif obs["Power"] < 0.01:
            reward = -100000
        elif obs["Power"] < 100. and \
                env.SatSim.check_light()>0 and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward



########
# penalty for taking to long to achieve goals increase penalty for no power

def Reward_v2(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    
    # Get action and observation
    obs = env.get_obs()
    pos = cossin_2_degrees(obs["Pos"][0], obs["Pos"][1])
    goals = env.goals
    limit_orbits = max(30, np.sum(env.initial_goals)/4)

    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 0:
                reward += 1000
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += 400
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 1000
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= 1
        elif add_info == "Not above target":
            reward -= 1
        elif add_info == "Not in light":
            reward -= .1
        elif add_info == "No image to analyse":
            reward -= 1
        elif add_info == "No image to dump":
            reward -= 1
        elif add_info == "Not above GS":
            reward -= 1
        elif add_info == "Satellite busy":
            reward -= 10

    ## penalty for taking to long to achieve goals
    if env.SatSim.orbit > limit_orbits and pos>359:
        reward -= min(10**((env.SatSim.orbit-limit_orbits)/40), 100)
    # Incentivise having not having the memory free
    # if obs["Memory Level"] > 0.1:
    #     reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 10
        elif obs["Power"] < 0.01:
            reward = -10000000
        elif obs["Power"] < 100. and \
                env.SatSim.check_light()>0 and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward
