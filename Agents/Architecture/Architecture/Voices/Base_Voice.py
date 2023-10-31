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
from copy import deepcopy

class Voice(ABC):

    def __init__(self,
                 agent=None, 
                 n_actions: int=None,
                 action_space: List[int]=None,
                 name: str = None,
                 ):
        """
        Initialize the Voice class
        
        Parameters
        ----------
        agent : Agent, optional. Base agent Class. The default is None.
        n_actions : int, optional. Total number of actions. The default is None.
        action_space : List[bool], optional. List of actions values. The default is None.
        Obs_space : Dict[str, Any], optional. Observation space dictionary. The default is None.
        name : str, optional. Name of the voice. The default is None.
        """

        self.agent = agent
        self.action_space = action_space
        self.n_actions = n_actions
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
        obs_T = self.transform_observation(deepcopy(obs))
        _, action_probs = self.agent.get_action(obs_T, Prob=True)
        self.action_probs_own = np.array(action_probs)
        return self.transform_actionProbs(action_probs)
