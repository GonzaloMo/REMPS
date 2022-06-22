import gym
from gym import spaces
import SimpleSatellite
import numpy as np
from ArbiterVoices.Planner import Planner_Voice
import IPython

class Arbiter:
    def __init__(self, env: gym.Env, n_targets_per_planner :int = 2, n_planners: int = 2):
        self.env = env
        self.Voices = []
        for i in  range(n_planners):
            First_target = i* n_targets_per_planner
            Last_target = First_target + n_targets_per_planner
            self.Voices.append(Planner_Voice(env.SatSim, First_target, Last_target, name=f"Planner_{i}"))
        self.npp = n_targets_per_planner

    def take_action(self, obs):
        for i, voice in  enumerate(self.Voices):
            First_target = i*self.npp
            Last_target = First_target + (i+1)*self.npp
            action = voice.getAction(obs)
            if action < 3:
                print(f"Planner_{i} | action {action}")
                return action
        return 3
    
    def reset_voices(self, obs):
        for i, voice in  enumerate(self.Voices):
            voice.get_plan(obs, amount=6)

    def render(self):
        self.env.render()



