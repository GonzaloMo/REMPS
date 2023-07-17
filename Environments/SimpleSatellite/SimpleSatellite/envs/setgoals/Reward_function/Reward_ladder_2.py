from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np
#####################################################################################################################################
##                                              Step Rewards 23/06/2023                                                            ##
#####################################################################################################################################
########### R0 ##########################################
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
                return 100
            return 5
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
            return .1 

        if Power < 0:
            return -100
        elif Power < 25:
            return -.5
    return reward

########### R1 ##########################################
def R_1(env: gym.Env, action_in: Tuple[int,int]):
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
            goals_after_action = deepcopy(env.goals)
            goals_after_action[img-1] = max(0, goals_after_action[img-1]-1)
            if np.sum(goals_after_action) == 0:
                return 100
            if goals[img-1] > 0:
                return 10
            else:
                return 1
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
            return -.5
    return reward

########### R2 ##########################################
def R_2(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            return 1
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 6
            else:
                return .5
        elif action == SatelliteSim.ACTION_DUMP:
            goals_after_action = deepcopy(env.goals)
            goals_after_action[img-1] = max(0, goals_after_action[img-1]-1)
            if np.sum(goals_after_action) == 0:
                return 100
            
            if goals[img-1] > -.5:
                return 10
            else:
                return 1
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
        if Power < 0:
            return -100
        elif Power < 25:
            return -.01
    return reward

########### R3 ##########################################
def R_3(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    # Max orbits reached terminate episode   
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if goals[img-1] > 0:
                return  2
            else:
                return .25
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 20
            else:
                return .5
        elif action == SatelliteSim.ACTION_DUMP:
            goals_after_action = deepcopy(env.goals)
            goals_after_action[img-1] = max(0, goals_after_action[img-1]-1)
            if np.sum(goals_after_action) == 0:
                return 100
            if goals[img-1] > -.5:
                return 10
            else:
                return 1
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
            return -.1 
        
    return reward


########### R4 ##########################################
def R_3(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    # Max orbits reached terminate episode   
    if check_action:
        # Get action and observation 
        goals = deepcopy(env.goals)
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if goals[img-1] > 0:
                return  2
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals[img-1] > 0:
                return 20
        elif action == SatelliteSim.ACTION_DUMP:
            goals_after_action = deepcopy(env.goals)
            goals_after_action[img-1] = max(0, goals_after_action[img-1]-1)
            if np.sum(goals_after_action) == 0:
                return 100
            if goals[img-1] > -.5:
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
            return .001
        if Power < 0:
            return -100 
        elif Power < 25:
            return -.1 
        
    return reward



