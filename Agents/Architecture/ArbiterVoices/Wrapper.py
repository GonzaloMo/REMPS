"""
Copyright (c) 2022 Gonzalo Montesino Valle
Created on 2022-12-14 
Author: Gonzalo Montesino Valle
Email: gonzalo.montesino-valle@strath.ac.uk
Description:
    This python scripts contains the Wrapper classes. The wrapper for the voices alogrithm and the wrapper
    for the arbiter algorithm.
"""
from abc import ABC, abstractmethod
from typing import Dict, List, Tuple, Union, Any
from gym import spaces

class Voice(ABC):

    def __init__(self, name):
        self.name = name
    
    @abstractmethod
    def reset(self):
        pass
    
    @abstractmethod
    def transform_observation(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        observation = obs
        return observation

    @abstractmethod
    def get_action(self, obs: Dict[str, Any]) -> int:
        action = 0
        return action
    
    @abstractmethod
    def get_extra_observation(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        extra_observation = None
        return extra_observation
    
    @abstractmethod
    def extra_observation_space(self) -> spaces.Dict[str, spaces.Space]:
        observation_space = None
        return observation_space
    
    def get_voice_output(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        voice_output = {}
        voice_output["Action"] = self.get_action(obs)
        if self.extra_observation_space() is not None:
            voice_output["Extra_Observation"] = self.get_extra_observation(obs)
        return voice_output
    
class Arbiter(ABC):

    def __init__(self, name):
        self.name = name
    
    @abstractmethod
    def compute_action(self, obs: Dict[str, Any]) -> int:
        return 0