from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from typing import Dict, List, Tuple, Union
import gym

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
            reward += 1
            # Reward for dumping a picture of a goal
            if goals[img-1] > 1:
                reward += 50
            # Reward for dumping all pictures
            all_complete = False
            for obs_goal in goals:
                if obs_goal < 0:
                    all_complete = True
                    break
            if all_complete:
                reward += 10000
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
          
    # Power 
    if env.SatSim.POWER_OPTION:
        if obs["Power"] < 25.:
            reward -= 10
        elif obs["Power"] > 99.:
            reward -= .01
        elif obs["Power"] < 0.01:
            reward -= 1000000000
        else:
            reward += 1
    return reward