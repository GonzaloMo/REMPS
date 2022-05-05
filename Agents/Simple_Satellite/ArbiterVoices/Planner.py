import gym
from gym import spaces
from copy import copy
import SimpleSatellite
from SimpleSatellite.envs.simulation.Utils import BaseVoice
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import numpy as np
from ArbiterVoices.Planner_utlis.AgentPDDL import PDDLAgent

class Planner_Voice(BaseVoice):
    def __init__(self, SatSim: SatelliteSim, name="Planner"):
        super().__init__(name=name)
        self.planner = PDDLAgent(SatSim, name)
        
    def getAction(self, obs, t_b: int, t_end: int, epsilon=1) -> int:
        processed_obs = self.get_obs(obs, t_b, t_end)
        if len(self.plan)<1:
            if 0<obs['Pos']<2*epsilon:
                self.get_plan(obs, t_b, t_end)
            else:
                return 3
        p, ac, _, _ = self.plan[0]
        if processed_obs['Full_Pos']-epsilon < p < processed_obs['Full_Pos']+epsilon:
            self.plan.pop(0)
            return ac
        else:
            return 3          
            

    def get_plan(self, obs, t_b, t_end):
        processed_obs = self.get_obs(obs, t_b, t_end)
        self.plan = self.planner.generatePlan(processed_obs, amount=4)

    def get_obs(self, obs, t_b: int, t_end: int):
        state = copy(obs)
        state['Target'] = obs['Targets'][t_b:t_end, :]
        state['Full_Pos'] = 360*obs['Orbit'] + obs['Pos']
        return state
    
    def reset_env(self, env):
        env.SatSim.targets = env.SatSim.initRandomTargets(self.opp_targets)
        return env