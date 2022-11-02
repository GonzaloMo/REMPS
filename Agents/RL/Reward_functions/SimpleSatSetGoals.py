from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from typing import Dict, List, Tuple, Union
import gym

def Reward_v0(env: gym.Env, action_in: Tuple[int,int]):
    # Get action and observation
    obs = env.get_ob_from_state()
    action, img = action_in
    reward = 0
    # Reward for dumping a picture
    if env.SatSim.check_action((action,img)):
        if action == SatelliteSim.ACTION_DUMP and obs["Goals"][img-1] > 1:
            reward += 100
            
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