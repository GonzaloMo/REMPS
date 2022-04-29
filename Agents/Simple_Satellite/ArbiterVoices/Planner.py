import gym
from gym import spaces
import SimpleSatellite
from SimpleSatellite.envs.simulation.Utils import BaseVoice
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import numpy as np
from ArbiterVoices.Planner_utlis.AgentPDDL import PDDLAgent

class Planner(BaseVoice):
    def __init__(self, SatSim: SatelliteSim, name="Planner_camp1"):
        super(Planner).__init__(name="Planner_camp1")
        self.opp_targets = 4
        SatSim.n_tagets += self.opp_targets
        self.added_observation_space = spaces.Dict({'Opp Targets': spaces.Box(low=0, high=360., shape=(self.opp_targets,2)),})
        self.planner = PDDLAgent()
        return SatSim
        
    def getAction(self, obs) -> int:
        processed_obs = self.get_obs(obs)
        return super().getAction(processed_obs)
    
    def get_obs(self, obs):
        state = obs['State']
        state['Targets'] = obs['Opp Targets']
        return state
    
    def reset_env(self, env):
        env.SatSim.targets = env.SatSim.initRandomTargets(self.opp_targets)
        return env