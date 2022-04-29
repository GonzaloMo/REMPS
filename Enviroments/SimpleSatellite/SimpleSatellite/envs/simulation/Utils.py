from abc import ABC, abstractmethod
from typing import Tuple
from gym.spaces.space import Space as gym_space
import gym

class BaseVoice(ABC):
    def __init__(self, name: str):
        self.name = name
        # self.added_observation_space = []

    @abstractmethod
    def getAction(self, obs) -> int:
        """
        Only valid for discrete spaces
        """
        obs = self.get_obs(obs)
        action = self.obs['Actions'].sample()
        return action
    
    @abstractmethod
    def get_obs(self, obs):
        # self.added_observation = []
        return obs
    
    @abstractmethod
    def reset_env(self, env):
        return env

