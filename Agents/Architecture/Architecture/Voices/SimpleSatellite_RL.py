from Architecture.Voices.Base_Voice import Voice
from typing import Dict, List, Tuple, Union, Any
import numpy as np
from RLAgent.agent import RAY_agent
from copy import deepcopy
from copy import copy

class VoiceSetGoalsV4(Voice):

    def __init__(self,
                agent_loc,
                n_actions = None,
                target_list: List[int] = None,
                name: str = None,
                obs_space: Dict[str, Any] = None,
                Max_orbit: int = 15,
                **kwargs
                ):
        action_space = [0]
        New_obs_space = copy(obs_space)
        Target_tot = n_actions//3
        for j in range(3):
            for t in target_list:
                action_space.append(j*Target_tot+t)
        mod_obs_space = ["Analysis", "Images", "Targets",  "Goals"]
        for k in mod_obs_space:
            New_obs_space[k] = [t-1 for t in target_list]
        self.target_list = target_list
        self.init_dumped = np.zeros((len(target_list), ))
        super().__init__(n_actions=n_actions,
                        action_space=action_space,
                        name=name,)
        
        self.agent = RAY_agent()
        self.agent.load(agent_loc, mode="test")
        self.Obs_space = New_obs_space
        self.Max_orbit = Max_orbit


    def transform_observation(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        observation = {}
        obs["Targets"] = np.reshape(obs["Targets"], (-1, 4))
        for k, v in self.Obs_space.items():
            if type(v) == list:
                if k == "Targets":
                    mod_obs = obs[k][v].flatten()
                else:
                    mod_obs = obs[k][v]
                observation[k] = np.array(mod_obs)
            else:
                if k == "Orbit":
                    orbit = float(v % self.Max_orbit)/self.Max_orbit
                    observation[k] = np.array([orbit], dtype=np.float32)
                elif v:
                    observation[k] = np.array(obs[k])
        return observation
    
    def transform_actionProbs(self, actionProbs: int) -> int:
        return super().transform_actionProbs(actionProbs)
    
    def generateGoals(self):
        tg = self.Obs_space["Targets"]
        goals = np.random.randint(0, 5, size=len(tg)) 
        self.init_goals = goals
        self.goals = goals

    def update(self, image_dumped):
        specific_goals = [image_dumped[i-1] for i in self.target_list]

        self.goals =  self.init_goals - specific_goals + self.init_dumped
        self.goals[self.goals<0] = 0

        # if np.sum(self.goals) == 0:
        #     print("Removing voice: ", self.name)
        #     print("Goals: ", self.goals)
        #     print("Dumped: ", specific_goals)
        #     print("Image: ", image_dumped)

        #     from IPython import embed; embed()

    def addInitDumpedImages(self, image_dumped):
        self.init_dumped = [image_dumped[i-1] for i in self.target_list]
