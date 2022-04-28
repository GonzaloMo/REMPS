from abc import ABC, abstractmethod
from typing import Tuple
from gym.spaces.space import Space as gym_space
import gym

class BaseVoice(ABC):
    def __init__(self, name: str):
        self.name = name
        # self.added_observation_space = []

    @abstractmethod
    def getAction(self, env) -> int:
        """
        Only valid for discrete spaces
        """
        obs = self.get_obs(env)
        action = self.env.action_space.sample()
        return action
    
    @abstractmethod
    def get_obs(self, env):
        # self.added_observation = []
        return env
