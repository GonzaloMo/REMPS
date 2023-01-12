import gym
from typing import Tuple

def Reward(env: gym.Env, action_in: Tuple[int,int]) -> float:
    action, img = action_in
    check, _ = env.SatSim.check_action(action, img)
    if action_in[0] == env.SatSim.ACTION_DUMP and check:
        return 1
    return 0