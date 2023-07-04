from Architecture.Voices.Base_Voice import Voice
from typing import Dict, List, Tuple, Union, Any
import numpy as np
from RLAgent.agent import RAY_agent

class SimpleSatellite_RL(Voice):

    def __inti__(self,
                agent_loc,
                **kwargs
                 ):

        super().__init__(**kwargs)
        self.agent = RAY_agent()
        self.agent.load(agent_loc, mode="test")

    def transform_observation(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        observation = {}
        for k, v in self.Obs_space:
            if type(v) == list:
                observation[k] = []
                for i in v:
                    observation[k].append(obs[k][i])
            else:
                observation[k] = np.array(obs[k])
        return observation
    
    def transform_actionProbs(self, actionProbs: int) -> int:
        return super().transform_actionProbs(actionProbs)
    
