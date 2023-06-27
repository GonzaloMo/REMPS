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
    def transform_observation(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        observation = obs
        return observation

    @abstractmethod
    def getActionProbs(self, obs: Dict[str, Any]) -> List[float]:
        action_probs = []
        return action_probs
    