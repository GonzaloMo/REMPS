import gym
from typing import Tuple

def Reward_v1(env: gym.Env, action_in: Tuple[int,int]) -> float:
    action, img = action_in
    obs = env.get_obs()
    check, _ = env.SatSim.check_action(action, img)
    if action == env.SatSim.ACTION_TAKE_IMAGE and check: # Picture of the opportunity taken
        return 1
    if action == env.SatSim.ACTION_ANALYSE and check: # Opportunity analysed
        return 1
    if action == env.SatSim.ACTION_DUMP and check:  # Opportunity dumped
        return 1
    
    if (obs["Opportunity"] == 0 and # No opportunity to take image
        obs["Images"] - obs["Analysis"] < 1  and # There are no images to analyse
        obs["Analysis"] < 1 and  # There are no images to dump
        action != env.SatSim.ACTION_DO_NOTHING): # action is not do nothing
            return -.0001
    return 0

def Reward_v2(env: gym.Env, action_in: Tuple[int,int]) -> float:
    action, img = action_in
    obs = env.get_obs()
    check, _ = env.SatSim.check_action(action, img)
    if action == env.SatSim.ACTION_TAKE_IMAGE and check: # Picture of the opportunity taken
        return 1
    if action == env.SatSim.ACTION_ANALYSE and check: # Opportunity analysed
        return 1
    if action == env.SatSim.ACTION_DUMP and check:  # Opportunity dumped
        return 1
    return 0

def Reward_v3(env: gym.Env, action_in: Tuple[int,int]) -> float:
    action, img = action_in
    obs = env.get_obs()
    check, _ = env.SatSim.check_action(action, img)
    if action == env.SatSim.ACTION_TAKE_IMAGE and check: # Picture of the opportunity taken
        return 100
    if action == env.SatSim.ACTION_ANALYSE and check: # Opportunity analysed
        return 100
    if action == env.SatSim.ACTION_DUMP and check:  # Opportunity dumped
        return 100
    if (obs["Opportunity"] == 0 and # No opportunity to take image
        obs["Images"] - obs["Analysis"] < 1  and # There are no images to analyse
        obs["Analysis"] < 1 and  # There are no images to dump
        action != env.SatSim.ACTION_DO_NOTHING): # action is not do nothing
            return -.001
    return 0