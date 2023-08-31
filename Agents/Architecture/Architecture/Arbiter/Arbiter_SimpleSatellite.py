from Architecture import Arbiter, Voice
from typing import Dict, List, Tuple, Union, Any, Callable
import numpy as np
import gym

class setGoalsv4(Arbiter):
    def __init__(self,  
                env: gym.Env,
                Voices: List[Voice] = None,
                Policy: Union[str, Callable] = "greedy",
                ):
        super().__init__(env, Voices, Policy)
    
    def getTheta(self, obs: Dict[str, Any]) -> np.ndarray:
        """
        This function calculates the the Theta function that represents a verification layer of the arbiter.
        """
        Theta = np.ones((self.n_actions, ))
        for a in range(self.n_actions):
            action, img = self.env.Number2Tuple_action(a)
            check_action, _= self.env.SatSim.check_action(action, img)
            if check_action:
                Theta[a] = 1
            else:
                Theta[a] = 0
        Theta[0] = .1 # discourange no idle action
        return Theta
    
    def getEta(self, obs: Dict[str, Any]) -> np.ndarray:
        """
        This function calculates the the eta function that represents the preference of the user.
        """
        eta = np.ones((self.n_Voice, ))
        # eta = np.zeros((self.n_Voice, ))
        # eta[0] = 1
        return eta