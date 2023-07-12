from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np
#####################################################################################################################################
##                                              Step Rewards 23/06/2023                                                            ##
#####################################################################################################################################
# Learn to keep batery above preferly above 25% and must be above 100% recharge
def R_0(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    if check_action:
        # Get action and observation 
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            return 1
        elif action == SatelliteSim.ACTION_ANALYSE:
            return 3
        elif action == SatelliteSim.ACTION_DUMP:
            goals = deepcopy(env.goals)
            goals[img-1] -= 1
            if np.sum(goals) == 0:
                return 1000
            return 9
    else:
        reward -= .1
    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt

        if sim.POWER_CONSUMPTION[compMode] > 0 and Power < 100: 
            reward += .1 
        if Power < 0:
            return -100
        elif Power < 25:
            return -.1
    return reward

# Learn to prefeberly dump picture which are part of the goal
def R_1(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    if check_action:
        # Get action and observation 
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            return 10
        elif action == SatelliteSim.ACTION_ANALYSE:
            return 10
        elif action == SatelliteSim.ACTION_DUMP:
            goals = deepcopy(env.goals)
            goals[img-1] -= 1
            if np.sum(goals) == 0:
                return 1000
            if goals[img-1] > -.5:
                return 50
            else:
                return 10
    else:
        reward -= .01
    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt

        if sim.POWER_CONSUMPTION[compMode] > 0 and Power < 100: 
            return .01 
        if Power < 0:
            return -100
        elif Power < 25:
            return -.01
    return reward

# Learn prefeberly to analyse picture which are part of the goal and only dump if they are part of the goal
def R_2(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            return 4
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 8
            else:
                return 1
        elif action == SatelliteSim.ACTION_DUMP:
            goals[img-1] -= 1
            if np.sum(goals) == 0:
                return 1000
            
            if goals[img-1] > -.5:
                return 12
    else:
        reward -= .01
    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt

        if sim.POWER_CONSUMPTION[compMode] > 0 and Power < 100: 
            return .001 
        if Power < 0:
            return -100
        elif Power < 25:
            return -.01
    return reward

# Learn preferbly to take pictures of goals and only analyse if they are part of the goal
def R_3(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    # Max orbits reached terminate episode
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    if pos > env.SatSim.CIRCUNFERENCE:   
        if env.SatSim.orbit + 1 >= env.SatSim.MAX_ORBITS:
           init_goals = env.initial_goals
           goals_after_action = deepcopy(env.goals)
           reward = np.sum(goals_after_action)/np.sum(init_goals)
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if goals[img-1] > 0:
                return  10 + reward
            else:
                return 1 + reward
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 20 + reward
            else:
                return 1 + reward
        elif action == SatelliteSim.ACTION_DUMP:
            goals[img-1] -= 1
            if np.sum(goals) == 0:
                return 1000 + reward
            if goals[img-1] > -.5:
                return 30 + reward
            else:
                return 1 + reward
    else:
        reward -= .01
    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt

        if sim.POWER_CONSUMPTION[compMode] > 0 and Power < 100: 
            return .001 + reward 
        if Power < 0:
            return -100 + reward
        elif Power < 25:
            return -.1 + reward
        
    return reward

# Only action that take you to the goal are rewarded
def R_4(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    # Max orbits reached terminate episode
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    if pos > env.SatSim.CIRCUNFERENCE:   
        if env.SatSim.orbit + 1 >= env.SatSim.MAX_ORBITS:
           init_goals = env.initial_goals
           goals_after_action = deepcopy(env.goals)
           reward = 1000*np.sum(goals_after_action)/np.sum(init_goals)
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if goals[img-1] > 0:
                return  10 + reward
            else:
                return 1 + reward
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 20 + reward
            else:
                return 1 + reward
        elif action == SatelliteSim.ACTION_DUMP:
            goals[img-1] -= 1
            if np.sum(goals) == 0:
                return 1000 + reward
            if goals[img-1] > -.5:
                return 40 + reward
            else:
                return 1 + reward
    else:
        reward -= .01
    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt

        # if sim.POWER_CONSUMPTION[compMode] > 0 and Power < 100: 
        #     return .001 + reward 
        if Power < 0:
            return -100 + reward
        elif Power < 25:
            return -.1 + reward
        
    return reward

# Only action that take you to the goal are rewarded
def R_5(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    # Max orbits reached terminate episode
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    if pos > env.SatSim.CIRCUNFERENCE:   
        if env.SatSim.orbit + 1 >= env.SatSim.MAX_ORBITS:
           init_goals = env.initial_goals
           goals_after_action = deepcopy(env.goals)
           reward = 1000*np.sum(goals_after_action)/np.sum(init_goals)
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if goals[img-1] > 0:
                return  5 + reward
            else:
                return 1 + reward
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 10 + reward
            else:
                return 1 + reward
        elif action == SatelliteSim.ACTION_DUMP:
            goals[img-1] -= 1
            if np.sum(goals) == 0:
                return 1000 + reward
            if goals[img-1] > -.5:
                return 80 + reward
            else:
                return 1 + reward
    else:
        reward -= .01
    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt

        # if sim.POWER_CONSUMPTION[compMode] > 0 and Power < 100: 
        #     return .001 + reward 
        if Power < 0:
            return -100 + reward
        elif Power < 25:
            return -.1 + reward
        
    return reward

# Only action that take you to the goal are rewarded
def R_6(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    # Max orbits reached terminate episode
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    if pos > env.SatSim.CIRCUNFERENCE:   
        if env.SatSim.orbit + 1 >= env.SatSim.MAX_ORBITS:
           init_goals = env.initial_goals
           goals_after_action = deepcopy(env.goals)
           return 1000*np.sum(goals_after_action)/np.sum(init_goals)
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        goals_after_action = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if goals[img-1] > 0:
                return  5 + reward
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 10 + reward
        elif action == SatelliteSim.ACTION_DUMP:
            goals_after_action[img-1] = max(0, goals_after_action[img-1]-1)
            if np.sum(goals_after_action) == 0:
                return 2000 + reward
            if goals[img-1] > 0:
                return 80 + reward
    else:
        reward -= .01
    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt

        # if sim.POWER_CONSUMPTION[compMode] > 0 and Power < 100: 
        #     return .001 + reward 
        if Power < 0:
            return -100 + reward
        elif Power < 25:
            return -.1 + reward
        
    return -0.001

# bullseye reward on the percentage of the goal achieved
def R_End(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    init_goals = env.initial_goals
    goals_after_action = deepcopy(env.goals)
    # All goals achieved terminate episode
    if check_action:
        if action == SatelliteSim.ACTION_DUMP:
            # check if all goals are achieved
            goals_after_action[img-1] -=1
            if np.sum(goals_after_action) == 0:
                done = True
    # Max orbits reached terminate episode
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    if pos > env.SatSim.CIRCUNFERENCE:   
        if env.SatSim.orbit + 1 >= env.SatSim.MAX_ORBITS:
            done = True

    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt
        if Power < 0:
            done = True
            reward -= 300
        elif Power < 25:
            reward -= .01
        if done:
            reward += 500*np.sum(goals_after_action)/np.sum(init_goals)
        
        if reward == 0:
            reward = -.001
            
    return reward