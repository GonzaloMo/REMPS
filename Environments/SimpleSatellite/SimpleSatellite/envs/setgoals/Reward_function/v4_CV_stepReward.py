from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import math
import gym
import numpy as np

# Leran to take picture, analyse and dump of specific goals no penalties
def Reward_0(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  .1
        elif action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                return .2
        elif action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                return .5
            
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
            return -1
    return -.01/period

# Leran to take picture, analyse and dump of specific goals with penalties for wrong actions 
def Reward_1(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        goals = env.goals
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] == 1:
                return 1
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
            return -1
    return -.01/period

# Leran to take picture, analyse and dump of specific goals with penalties for wrong actions 
def Reward_2(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        goals = env.goals
        if action == SatelliteSim.ACTION_DUMP:
            # Reward achieveing final goal
            if goals[img-1] == 1 and np.sum(goals) == 1:
                return 10
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
            return -1
    return -.01/period

# Leran to take picture, analyse and dump of specific goals no penalties
def Reward_0_1(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  .5
        elif action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                return 1.
        elif action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                return 2.
            
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

        if sim.POWER_CONSUMPTION[compMode] < 0 and not sim.Valid_action:
            return -.01
        if Power < 0:
            return -100
    return .1

def Reward_1_1(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  .1
        elif action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                return .5
        elif action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                return 1.
            
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

        if sim.POWER_CONSUMPTION[compMode] < 0 and not sim.Valid_action:
            return -.005
        if Power < 0:
            return -1
    return 0

### Reward where the penalty increases the further away from the goal the action is
def Reward_bullseye(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    standard_penalty = -10/period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  1
        elif action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                return 2
        elif action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                return 5
        elif action == SatelliteSim.ACTION_DO_NOTHING:
            check_TP, _ = env.SatSim.check_action(SatelliteSim.ACTION_TAKE_IMAGE, None)
            check_AP, _ = env.SatSim.check_action(SatelliteSim.ACTION_ANALYSE, None)
            check_DP, _ = env.SatSim.check_action(SatelliteSim.ACTION_DUMP, None)
            if not (check_TP or check_AP or check_DP):
                return 0
    else:
        state = env.SatSim.get_state()
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            Pos = state["Pos"]
            window = state["Targets"][img-1]
            return 0

        elif action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals_analysed_mem[img-1] > 0:
                return 2
        elif action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 0:
                return 5
        
    return standard_penalty







############# Step Rewards 23/06/2023 #############
# Learn to not loose power and take, analyse and dump pictures of any target
def R_0(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            return 1
        elif action == SatelliteSim.ACTION_ANALYSE:
            return 3
        elif action == SatelliteSim.ACTION_DUMP:
            return 9
            
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

        if sim.POWER_CONSUMPTION[compMode] < 0 and not sim.Valid_action:
            return -.01
        if Power < 0:
            return -100
    return .1

# Learn to take pictures, and reduce benefits of Idle
def R_1(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  2
        elif action == SatelliteSim.ACTION_ANALYSE:
            return 3
        elif action == SatelliteSim.ACTION_DUMP:
            return 9
            
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

        if sim.POWER_CONSUMPTION[compMode] < 0 and not sim.Valid_action:
            return -.01
        if Power < 0:
            return -100
    return .001

# Learn to analyze pictures
def R_2(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  2
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals_analysed_mem[img-1] > 0:
                return 6
        elif action == SatelliteSim.ACTION_DUMP:
            return 9
            
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

        if sim.POWER_CONSUMPTION[compMode] < 0 and not sim.Valid_action:
            return -.01
        if Power < 0:
            return -100
    return .001

# Learn to dump pictures
def R_3(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  2
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals_analysed_mem[img-1] > 0:
                return 6
        elif action == SatelliteSim.ACTION_DUMP:
            if goals[img-1] > 0:
                return 18
            
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

        if sim.POWER_CONSUMPTION[compMode] < 0 and not sim.Valid_action:
            return -.01
        if Power < 0:
            return -100
    return .001

# Learn to reduce Idle time
def R_4(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    period = env.SatSim.period
    if check_action:
        # Get action and observation 
        obs = env.get_obs()
        Memory_pic = obs["Images"] * env.initial_goals
        Memrory_analysed = obs["Analysis"][0] * env.initial_goals
        goals = env.goals
        # images in memory
        goals_pic_mem = np.array([max(0,goals[i] - Memory_pic[i]) for i in range(len(goals))])
        goals_analysed_mem = np.array([max(0,goals[i] - Memrory_analysed[i]) for i in range(len(goals))])
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals_pic_mem[img-1] > 0:
                return  2
        elif action == SatelliteSim.ACTION_ANALYSE:
            if goals_analysed_mem[img-1] > 0:
                return 6
        elif action == SatelliteSim.ACTION_DUMP:
            if goals[img-1] > 0:
                return 18
            
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

        if sim.POWER_CONSUMPTION[compMode] < 0 and not sim.Valid_action:
            return -.01
        if Power < 0:
            return -100
    return -.001
