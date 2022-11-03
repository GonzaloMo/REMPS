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