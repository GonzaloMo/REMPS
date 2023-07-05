from Architecture.Voices.Base_Voice import Voice
from typing import Dict, List, Tuple, Union, Any
import numpy as np
from RLAgent.agent import RAY_agent

class VoiceSetGoalsV4(Voice):

    def __init__(self,
                agent_loc,
                n_actions = None,
                target_list: List[int] = None,
                name: str = None,
                obs_space: Dict[str, Any] = None,
                **kwargs
                ):
        action_space = [0]
        Target_tot = n_actions//3
        for j in range(3):
            for t in target_list:
                action_space.append(j*Target_tot+t)
        mod_obs_space = ["Analysis", "Images", "Targets",  "Goals"]
        index_list = [t-1 for t in target_list]
        for k in mod_obs_space:
            obs_space[k] = index_list

        super().__init__(n_actions=n_actions,
                        action_space=action_space,
                        Obs_space=obs_space,
                        name=name,)
        
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
                if v:
                    observation[k] = np.array(obs[k])
        return observation
    
    def transform_actionProbs(self, actionProbs: int) -> int:
        return super().transform_actionProbs(actionProbs)
    
