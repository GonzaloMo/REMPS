import gym
from typing import Tuple

def Reward(env: gym.Env, action_in: Tuple[int,int]) -> float:
    reward = 0
    return reward