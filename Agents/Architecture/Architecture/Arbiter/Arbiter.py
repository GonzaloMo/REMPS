"""
Copyright (c) 2023 Gonzalo Montesino Valle
Created on 2023-06-27 
Author: Gonzalo Montesino Valle
Email: gonzalo.montesino-valle@strath.ac.uk
"""
from abc import ABC, abstractmethod
from typing import Dict, List, Tuple, Union, Any
from gym import spaces
import numpy as np
from Architecture.ArbiterVoices.Voice import Voice

class Arbiter(ABC):

    def __init__(self, 
                n_actions: int, 
                Voices: List[Voice] = None,
                ):
        self.n_actions = n_actions
        if Voices is None:
            Voices = []
        self.Voices = Voices
        self.n_Voice = len(Voices)

    def addVoice(self, voice):
        self.Voices.append(voice)
    
    def removeVoice(self, voice):
        self.Voices.remove(voice)
    
    def getAction(self, obs: Dict[str, Any]) -> List[int]:
        
        action_probs = np.zeros((self.n_actions, ))
        for voice in enumerate(self.Voices):
            pi_v = voice.getActionProbs(obs)
            eta_v = self.get_eta(obs)
            action_probs += pi_v * eta_v



        return action
    
    @abstractmethod
    def getTheta(self, obs: Dict[str, Any]) -> np.ndarray:
        """
        This function calculates the the Theta function that represents a verification layer of the arbiter.

        Args:
            obs (Dict[str, Any]): The observation of the environment.
        
        Returns:
            List[float]: The theta function of the arbiter. Theta_i belongs to [0,1] 
        """
        state_theta = np.ones((self.n_actions, ))
        return state_theta
    
    @abstractmethod
    def get_eta(self, obs: Dict[str, Any]) -> np.ndarray:
        """
        This function calculates the the eta function that represents the preference of the user.

        Args:
            obs (Dict[str, Any]): The observation of the environment.
        
        Returns:
            List[float]: The eta function of the arbiter. eta_i belongs to [0,1] 
        """
        eta = np.ones((self.n_Voice, ))
        return eta
