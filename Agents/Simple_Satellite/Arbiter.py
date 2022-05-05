import gym
from gym import spaces
import SimpleSatellite
import numpy as np
from ArbiterVoices.Planner import Planner_Voice

class Arbiter:
    def __init__(self, env: gym.Env, n_targets_per_planner :int = 2, n_planners: int = 2):
        self.env = env
        self.Voices = []
        for i in  range(n_planners):
            self.Voices.append(Planner_Voice(env.SatSim, name=f"Planner_{i}"))
        self.npp = n_targets_per_planner

    def take_action(self, obs):
        for i, voice in  enumerate(self.Voices):
            tb = i*self.npp
            tend = tb + i*self.npp
            action = voice.getAction(obs, tb, tend)
            if action < 3:
                print(f"Planner_{i} | action {action}")
                return action
        return 3
    
    def reset_voices(self, obs):
        for i, voice in  enumerate(self.Voices):
            tb = i*self.npp
            tend = tb + i*self.npp
            voice.get_plan(obs, tb, tend)



