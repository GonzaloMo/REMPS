import gym
from typing import Tuple
## V1
def Reward_v1(env: gym.Env, action_in: Tuple[int,int]) -> float:
    reward = 0
    action, img = action_in
    obs = env.get_obs()
    check, add_info = env.SatSim.check_action(action, img)
    # Rewards
    if action == env.SatSim.ACTION_TAKE_IMAGE and check: # Picture of the opportunity taken
        reward += 100
    if action == env.SatSim.ACTION_ANALYSE and check: # Opportunity analysed
        reward += 100
    if action == env.SatSim.ACTION_DUMP and check:  # Opportunity dumped
        reward += 100
    
    
    #Penalties
    if env.SatSim.POWER_OPTION:
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 10
        # Penalize for more than 99% of power
        elif obs["Power"] < 0.1:
            reward -= 1000

    if obs["Opportunity"] == 1 and action == env.SatSim.ACTION_TAKE_IMAGE:
        reward -= 10

    return reward

def Reward_v2(env: gym.Env, action_in: Tuple[int,int]) -> float:
    reward = 0
    action, img = action_in
    obs = env.get_obs()
    check, add_info = env.SatSim.check_action(action, img)
    # Rewards
    if action == env.SatSim.ACTION_TAKE_IMAGE and check: # Picture of the opportunity taken
        reward += 100
    if action == env.SatSim.ACTION_ANALYSE and check: # Opportunity analysed
        reward += 100
    if action == env.SatSim.ACTION_DUMP and check:  # Opportunity dumped
        reward += 100
    
    
    #Penalties
    if env.SatSim.POWER_OPTION:
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 10
        # Penalize for more than 99% of power
        elif obs["Power"] < 0.1:
            reward -= 1000
    return reward