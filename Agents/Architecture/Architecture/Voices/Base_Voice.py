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
import numpy as np

class Voice(ABC):

    def __init__(self,
                 agent, 
                 n_actions: int,
                 action_space: List[int],
                 Obs_space: Dict[str, Any],
                 name: str = None,
                 ):

        self.agent = agent
        self.n_actions = n_actions
        self.action_space = action_space
        self.Obs_space = Obs_space
        if name is None:
            name = self.agent.name
        self.name = name
    
    @abstractmethod
    def transform_observation(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        observation = obs
        return observation

    def transform_actionProbs(self, actionProbs: int) -> int:
        action_Probs = np.zeros((self.n_actions, ))
        action_Probs[self.action_space] = actionProbs
        return action_Probs

    def getActionProbs(self, obs: Dict[str, Any]) -> List[float]:
        _, action_probs = self.agent.get_action(obs, Prob=True)
        return self.transform_actionProbs(action_probs)
    
