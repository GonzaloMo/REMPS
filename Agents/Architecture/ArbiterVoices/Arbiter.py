"""
Copyright (c) 2023 Gonzalo Montesino Valle
Created on 2023-06-27 
Author: Gonzalo Montesino Valle
Email: gonzalo.montesino-valle@strath.ac.uk
"""
from abc import ABC, abstractmethod
from typing import Dict, List, Tuple, Union, Any
from gym import spaces
from Architecture.ArbiterVoices.Voice import Voice

class Arbiter(ABC):

    def __init__(self, Voices: List[Voice]):
        self.Voices = Voices
        self.

    def addVoice(self, voice):
        self.Voices.append(voice)
    
    def removeVoice(self, voice):
        self.Voices.remove(voice)
    
