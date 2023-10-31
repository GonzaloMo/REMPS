from Architecture import Arbiter, Voice
from typing import Dict, List, Tuple, Union, Any, Callable
import numpy as np
import gym
from time import sleep
from copy import copy

class setGoalsv4(Arbiter):
    def __init__(self,  
                env: gym.Env,
                Voices: List[Voice] = None,
                Policy: Union[str, Callable] = "greedy",
                ):
        super().__init__(env, Voices, Policy)
        self.idle_action = 0
    
    def getTheta(self, obs: Dict[str, Any]) -> np.ndarray:
        """
        This function calculates the the Theta function that represents a verification layer of the arbiter.
        """
        Theta = np.zeros((self.n_actions, ))
        if obs["Memory Level"] > 0.9 or obs["Power"] < .25:
            Theta[0] = 1
            return Theta
        for a in range(self.n_actions):
            action, img = self.env.Number2Tuple_action(a)
            check_action, _= self.env.SatSim.check_action(action, img)
            if check_action:
                Theta[a] = 1
            else:
                Theta[a] = 0
        
        goals = obs["Goals"]
        tot_tg = len(goals)
        for i, goal in enumerate(goals):
            if goal == 0:
                idx = [i+1, tot_tg + i+1, 2*tot_tg + i+1]
                # print("idx: ", idx)
                # print("actions: ", [a for i, a in enumerate(self.action_list) if i in idx])
                # print()
                # from time import sleep
                # sleep(1)
                Theta[idx] = 0

        Theta[0] = .1 # discourange no idle action
        return Theta

    def getActionProbs(self, obs: Dict[str, Any]) -> List[float]:
        action_prob = super().getActionProbs(obs)
        for voice in self.Voices:
            key = voice.name + "_Goals"
            self.telemetry[key].append(list(voice.goals))
        return action_prob
    
    def getEta(self, obs: Dict[str, Any]) -> np.ndarray:
        """
        This function calculates the the eta function that represents the preference of the user.
        """
        eta = np.ones((self.n_Voice, ))
        def get_totgoals(vc):
            return np.sum(vc.goals)
        voices_list = copy(self.Voices)
        voices_list.sort(key=get_totgoals)
        weight_list = np.linspace(1, 1/self.n_Voice, num=self.n_Voice)
        for i, v in enumerate(self.Voices):
            for vs in voices_list:
                if v.name == vs.name:
                    eta[i] = weight_list[i] 
        eta = np.ones((self.n_Voice, ))
        return eta

    def getConfig(self):
        config = {}
        for voice in self.Voices:
            k1 = voice.name + " " + "Targets"
            config[k1] = [list(voice.Obs_space["Targets"])]
        return config
    
    def update(self, Dumped_image):
        voice_removed = False
        for i, voice in enumerate(self.Voices):
            voice.update(Dumped_image)
            if np.sum(voice.goals) == 0:
                print2log(f"---- Voice {voice.name} removed ----")
                print2log(f"{voice.name} goals {voice.goals}")
                for j, v in enumerate(self.Voices):
                    print2log(f"      {v.name} goals {v.goals}")
                self.removeVoice(voice)
                voice_removed = True
        if voice_removed:
            print2log(f"Voices: {len(self.Voices)} and {self.n_Voice}")
    
    def addVoice(self, voice):
        extension = 0
        for k, v in self.telemetry.items():
            if "Goals" in k:
                extension = max(extension, len(v))
        init_telemetry = []
        if extension > 0:
            init_telemetry = list([ [0 for _ in range(5)] for _ in range(extension)])
        self.telemetry[voice.name + "_Goals"] = init_telemetry
        return super().addVoice(voice)
    
    def reset_telemetry(self):
        super().reset_telemetry()
        for voice in self.Voices:
            self.telemetry[voice.name + "_Goals"] = []

    def reset(self):
        self.reset_telemetry()

    def get_goals(self):
        goals = np.zeros((self.env.SatSim.n_targets,))
        for voice in self.Voices:
            for i, goal in enumerate(voice.goals):
                goals[voice.target_list[i]-1] = max(goals[voice.target_list[i]-1], goal)
        return goals
    
    def generateGoals(self):
        for voice in self.Voices:
            voice.generateGoals()


def print2log(astring):
    with open("log.txt", "a") as f:
        assert isinstance(astring, str)
        f.write(astring + "\n")
        f.close()