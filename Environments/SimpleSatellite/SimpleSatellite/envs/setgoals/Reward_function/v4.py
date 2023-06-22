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
    pos = cossin_2_degrees(obs["Pos"][0], obs["Pos"][1])
    goals = env.goals
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
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

    if env.SatSim.orbit > limit_orbits and pos>359:
        reward -= min(10**((env.SatSim.orbit-limit_orbits)/40), 100)
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 0.01:
            reward = -100000
    return reward

def Reward_test_2(env: gym.Env, action_in: Tuple[int,int]):
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
        reward += 100
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

def Reward_v3(env: gym.Env, action_in: Tuple[int,int]):
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


########
# penalty for taking to long to achieve goals increase penalty for no power

def Reward_v4(env: gym.Env, action_in: Tuple[int,int]):
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
            reward -= .1
        elif add_info == "Not above target":
            reward -= .1
        elif add_info == "Not in light":
            reward -= .01
        elif add_info == "No image to analyse":
            reward -= .1
        elif add_info == "No image to dump":
            reward -= .1
        elif add_info == "Not above GS":
            reward -= .1
        elif add_info == "Satellite busy":
            reward -= 1

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
            reward = -10000000000
        elif obs["Power"] < 100. and \
                env.SatSim.check_light()>0 and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward


def Reward_v5(env: gym.Env, action_in: Tuple[int,int]):
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
            reward -= .1
        elif add_info == "Not above target":
            reward -= .1
        elif add_info == "Not in light":
            reward -= .01
        elif add_info == "No image to analyse":
            reward -= .1
        elif add_info == "No image to dump":
            reward -= .1
        elif add_info == "Not above GS":
            reward -= .1
        elif add_info == "Satellite busy":
            reward -= 1
        
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 10
        elif obs["Power"] < 1:
            reward = -10000000000
        elif obs["Power"] < 100. and \
                env.SatSim.check_light()>0 and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward


#########################################################################################
# lesser reward function
def Reward_v6(env: gym.Env, action_in: Tuple[int,int]):
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
                reward += 5 * env.SatSim.DURATION_TAKE_IMAGE
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += 6 * env.SatSim.DURATION_ANALYSE
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 7 * env.SatSim.DURATION_DUMP
            if goals[img-1] == 1:
                reward += 14 * env.SatSim.DURATION_DUMP
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= .01
        elif add_info == "Not above target":
            reward -= .001
        elif add_info == "Not in light":
            reward -= .001
        elif add_info == "No image to analyse":
            reward -= .001
        elif add_info == "No image to dump":
            reward -= .001
        elif add_info == "Not above GS":
            reward -= .001
        elif add_info == "Satellite busy":
            reward -= .1
        
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward = -10
        elif obs["Power"] < 1:
            reward = min(-1e6, (limit_orbits-env.SatSim.orbit) * (2e5))
        elif obs["Power"] < 100. and \
                env.SatSim.check_light()>0 and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward



#########################################################################################
# more positve reward
def Reward_v7(env: gym.Env, action_in: Tuple[int,int]):
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
                reward += 7 * env.SatSim.DURATION_TAKE_IMAGE
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 0:
                reward += 8 * env.SatSim.DURATION_ANALYSE
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 9 * env.SatSim.DURATION_DUMP
            if goals[img-1] == 1:
                reward += 16 * env.SatSim.DURATION_DUMP
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= .01
        elif add_info == "Not above target":
            reward -= .001
        elif add_info == "Not in light":
            reward -= .001
        elif add_info == "No image to analyse":
            reward -= .001
        elif add_info == "No image to dump":
            reward -= .001
        elif add_info == "Not above GS":
            reward -= .001
        elif add_info == "Satellite busy":
            reward -= .0001
        
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward = -10
        elif obs["Power"] < 1:
            reward = min(-1e6, (limit_orbits-env.SatSim.orbit) * (2e5))
        elif obs["Power"] < 100. and \
                env.SatSim.check_light()>0 and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward



def Reward_v6_cv(env: gym.Env, action_in: Tuple[int,int], task_dificulty: int = 1):
    done = False
    reward = 0
    # Get action and observation
    obs = env.get_obs()
    Memory_pic = obs["Images"]
    Memrory_analysed = obs["Analysis"]
     
    goals = env.goals
    goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
    goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    goals_after_action = deepcopy(goals)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                reward += 10
                if goals[img-1] == 1:
                    reward += 50
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                reward += 20
                if goals[img-1] == 1:
                    reward += 50
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                reward += 30
                goals_after_action[img-1] -= 1
            if goals[img-1] == 1:
                reward += 50
        if action == SatelliteSim.ACTION_DO_NOTHING:
            reward += .01

    if reward <= 0:
        reward -= 0.001


    if pos > env.SatSim.CIRCUNFERENCE and (env.SatSim.orbit+1) >= env.SatSim.MAX_ORBITS:
        done = True
        
    if np.sum(goals_after_action) == 0:
        done = True
        reward += 1000 * math.log(math.e + 6*task_dificulty)
        reward += 200 * (1 - env.SatSim.orbit/env.SatSim.MAX_ORBITS)
    
    if done:
        tot_goals = np.sum(env.initial_goals)
        if tot_goals  > 0:
            reward += 1000 * (1 - np.sum(goals_after_action)/np.sum(env.initial_goals)) * math.log(math.e + 6*task_dificulty)
    
    if env.SatSim.POWER_OPTION:
        if (obs["Power"]*100) < 25:
            reward -= .001
        if (obs["Power"]*100) < .2:
            reward -= 1000
    if obs["Memory Level"] > 0.9:
        reward -= .001
    elif obs["Memory Level"] > 0.8:
        reward -= .0001
    return reward
