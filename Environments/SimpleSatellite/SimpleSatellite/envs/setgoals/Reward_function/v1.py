from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
import gym
import numpy as np

def Reward_v0(env: gym.Env, action_in: Tuple[int,int]):
    # Get action and observation
    obs = env.get_obs()
    if len(action_in) == 1:
        action = action_in[0]
        img = None
    else:
        action, img = action_in
    reward = 0
    goals = obs["Goals"]
    # Reward for dumping a picture
    if env.SatSim.check_action(action,img):
        if img is None:
            for img in range(len(env.SatSim.analysis), 0, -1):
                if env.SatSim.analysis[img-1]:
                    break
        if action == SatelliteSim.ACTION_DUMP and goals[img-1] > 1:
            reward += 10
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                reward += 10000
    
    if env.SatSim.POWER_OPTION:
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 10
        # Penalize for more than 99% of power
        elif obs["Power"] > 99.:
            reward -= .01
        elif obs["Power"] < 0.1:
            reward -= 1000000000
        else:
            reward += .001

    return reward


def Reward_v1(env: gym.Env, action_in: Tuple[int,int]):
    # Get action and observation
    obs = env.get_obs()
    if len(action_in) == 1:
        action = action_in[0]
        img = None
    else:
        action, img = action_in
    reward = 0
    goals = obs["Goals"]
    # Reward for dumping a picture
    if env.SatSim.check_action((action,img)):
        if img is None:
            for img in range(len(env.SatSim.analysis), 0, -1):
                if env.SatSim.analysis[img-1]:
                    break
        if action == SatelliteSim.ACTION_DUMP and goals[img-1] > 1:
            reward += 10
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                reward += 10000
    
    if env.SatSim.POWER_OPTION:
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 10
        # Penalize for more than 99% of power
        elif obs["Power"] > 99.:
            reward -= .1
        else:
            reward += .001

    return reward

############################################################################################################

def Reward_v2(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture
            reward += 1
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 5
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture
            reward += 1
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 5
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture
            reward += 10
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                reward += 10000000
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= 10
        elif add_info == "Not above target":
            reward -= 100
        elif add_info == "Not in light":
            reward -= 1
        elif add_info == "No image to analyse":
            reward -= 10
        elif add_info == "No image to dump":
            reward -= 10
        elif add_info == "Not above GS":
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward

############################################################################################################

def Reward_v3(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    max_steps = (env.SatSim.MAX_ORBITS * env.SatSim.period)
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture
            reward += 1
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 10
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture
            reward += 1
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 10
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture
            reward += 2
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                percenof_total_steps = 1 - env.step_count/max_steps
                reward += 10000000*percenof_total_steps 
    if env.done and max_steps <= env.step_count:

        tot_goals_achieved = np.sum(goals)
        tot_goals = np.sum(env.initial_goals)
        print("Total goals achieved: ", tot_goals_achieved)
        print("Total goals: ", tot_goals)
        reward += 10000000 * tot_goals_achieved/tot_goals
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= 10
        elif add_info == "Not above target":
            reward -= 100
        elif add_info == "Not in light":
            reward -= 1
        elif add_info == "No image to analyse":
            reward -= 10
        elif add_info == "No image to dump":
            reward -= 10
        elif add_info == "Not above GS":
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Incentivise having not having the memory free
    if obs["Memory Level"] > 0.1:
        reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward

############################################################################################################

def Reward_v4(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    max_steps = (env.SatSim.MAX_ORBITS * env.SatSim.period)
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture
            reward += 5
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 200
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture
            reward += 5
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 200
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture
            reward += 5
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                percenof_total_steps = 1 - env.step_count/max_steps
                reward += 10000000*percenof_total_steps 
    if env.done and max_steps <= env.step_count:

        tot_goals_achieved = np.sum(goals)
        tot_goals = np.sum(env.initial_goals)
        print("Total goals achieved: ", tot_goals_achieved)
        print("Total goals: ", tot_goals)
        reward += 10000000 * tot_goals_achieved/tot_goals
    else:
        # Action that made action to not be executed
        if add_info == "Memory full":
            reward -= 10
        elif add_info == "Not above target":
            reward -= 100
        elif add_info == "Not in light":
            reward -= 1
        elif add_info == "No image to analyse":
            reward -= 10
        elif add_info == "No image to dump":
            reward -= 10
        elif add_info == "Not above GS":
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Incentivise having not having the memory free
    if obs["Memory Level"] > 0.1:
        reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward

############################################################################################################
def Reward_eval(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture
            reward += .00001
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 1
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                reward += 1000
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 0.01:
            reward -= 1000000
    return reward



############################################################################################################

def Reward_v5(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    max_steps = (env.SatSim.MAX_ORBITS * env.SatSim.period)
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture
            reward += 5
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 200
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture
            reward += 5
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 200
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture
            reward += 5
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                percenof_total_steps = 1 - env.step_count/max_steps
                reward += 10000000*percenof_total_steps 
    if env.done and max_steps <= env.step_count:

        tot_goals_achieved = np.sum(goals)
        tot_goals = np.sum(env.initial_goals)
        print("Total goals achieved: ", tot_goals_achieved)
        print("Total goals: ", tot_goals)
        reward += 10000000 * tot_goals_achieved/tot_goals
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
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Incentivise having not having the memory free
    if obs["Memory Level"] > 0.1:
        reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward

############################################################################################################
# incresed reward for analysing to compensate fromthe time consumption and energy consumption
def Reward_v6(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    max_steps = (env.SatSim.MAX_ORBITS * env.SatSim.period)
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture
            reward += 5
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 200
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture
            reward += 10
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 400
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture
            reward += 5
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                percenof_total_steps = 1 - env.step_count/max_steps
                reward += 10000000*percenof_total_steps 
    if env.done and max_steps <= env.step_count:

        tot_goals_achieved = np.sum(goals)
        tot_goals = np.sum(env.initial_goals)
        print("Total goals achieved: ", tot_goals_achieved)
        print("Total goals: ", tot_goals)
        reward += 10000000 * tot_goals_achieved/tot_goals
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
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Incentivise having not having the memory free
    if obs["Memory Level"] > 0.1:
        reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward

############################################################################################################
# INCREASE IN TAKE PICTUERE 
def Reward_v7(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    max_steps = (env.SatSim.MAX_ORBITS * env.SatSim.period)
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture
            reward += 10
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 1000
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture
            reward += 10
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 400
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture
            reward += 5
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                percenof_total_steps = 1 - env.step_count/max_steps
                reward += 10000000*percenof_total_steps 
    if env.done and max_steps <= env.step_count:

        tot_goals_achieved = np.sum(goals)
        tot_goals = np.sum(env.initial_goals)
        print("Total goals achieved: ", tot_goals_achieved)
        print("Total goals: ", tot_goals)
        reward += 10000000 * tot_goals_achieved/tot_goals
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
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Incentivise having not having the memory free
    if obs["Memory Level"] > 0.1:
        reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward


############################################################################################################
# remove reward for non goal pictures
def Reward_v8(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    max_steps = (env.SatSim.MAX_ORBITS * env.SatSim.period)
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 1000
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 400
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                percenof_total_steps = 1 - env.step_count/max_steps
                reward += 10000000*percenof_total_steps 
    if env.done and max_steps <= env.step_count:

        tot_goals_achieved = np.sum(goals)
        tot_goals = np.sum(env.initial_goals)
        print("Total goals achieved: ", tot_goals_achieved)
        print("Total goals: ", tot_goals)
        reward += 10000000 * tot_goals_achieved/tot_goals
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
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Incentivise having not having the memory free
    if obs["Memory Level"] > 0.1:
        reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward



############################################################################################################
# ronly give positive rewad at episode ending early if there is power left
def Reward_v9(env: gym.Env, action_in: Tuple[int,int]):
    reward = 0 
    max_steps = (env.SatSim.MAX_ORBITS * env.SatSim.period)
    # Get action and observation
    obs = env.get_obs()
    goals = obs["Goals"]
    action, img = action_in
    check_action, add_info = env.SatSim.check_action(action,img)
    # Reward for taking a correct action
    if check_action:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Reward for taking a picture of a goal
            if goals[img-1] > 1:
                reward += 1000
        if action == SatelliteSim.ACTION_ANALYSE:
            # Reward for analysing a picture of a goal
            if goals[img-1] > 1:
                reward += 400
        if action == SatelliteSim.ACTION_DUMP:
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 500
            if goals[img-1] == 1:
                reward += 100000
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                percenof_total_steps = 1 - env.step_count/max_steps
                reward += 10000000*percenof_total_steps 
    if env.done and max_steps <= env.step_count:

        tot_goals_achieved = np.sum(goals)
        tot_goals = np.sum(env.initial_goals)
        print("Total goals achieved: ", tot_goals_achieved)
        print("Total goals: ", tot_goals)
        reward += 10000000 * tot_goals_achieved/tot_goals
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
            reward -= 100
        elif add_info == "Satellite busy":
            reward -= 100
        pass
    # Incentivise having not having the memory free
    if obs["Memory Level"] > 0.1:
        reward += min(obs["Memory Level"][0], env.SatSim.MEMORY_SIZE*.5) * reward
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 100
        elif obs["Power"] < 0.01:
            reward = -1000000000
        elif obs["Power"] < 100. and \
                env.SatSim.light_range[0] < obs["Pos"] < env.SatSim.light_range[1] and \
                env.SatSim.Taking_action == SatelliteSim.ACTION_DO_NOTHING:
            reward += 1
    return reward
