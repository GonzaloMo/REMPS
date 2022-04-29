import gym
from gym import spaces
import SimpleSatellite
import numpy as np

class Arbiter:
    def __init__(self, env: gym.Env):
        self.env = env

    def take_action(self,obs):
        action = self.env.action_space.sample()
        return action

