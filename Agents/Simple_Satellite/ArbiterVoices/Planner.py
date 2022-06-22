import gym
from gym import spaces
from copy import copy
import SimpleSatellite
from SimpleSatellite.envs.simulation.Utils import BaseVoice
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import numpy as np
from ArbiterVoices.Planner_utlis.AgentPDDL import PDDLAgent

class Planner_Voice(BaseVoice):
    def __init__(self, SatSim: SatelliteSim, First_target, Last_target, name="Planner"):
        super().__init__(name=name)
        self.planner = PDDLAgent(SatSim, name)
        self.opp_targets = np.arange(First_target, Last_target)
        self.name = name
        self.full_plan = []
        self.excuted_plan = []
        
    def getAction(self, obs, epsilon=1) -> int:
        if self.excuted_plan == []:
            if 0<obs['Pos']<5*epsilon:
                self.get_plan(obs)
                if len(self.full_plan)<1:
                    return 3
            else:
                return 3
        processed_obs = self.get_obs(obs)
        for i in range(len(self.excuted_plan)):
            p, _ , _, _ = self.excuted_plan[i]
            if p < processed_obs['Full_Pos']-epsilon:
                for j in range(i):
                    self.excuted_plan.pop(0)
        p, ac, _, _ = self.excuted_plan[0]
        if processed_obs['Full_Pos']-epsilon < p < processed_obs['Full_Pos']+epsilon:
            p, ac, _, _ = self.excuted_plan.pop(0)
            return ac
        else:
            return 3
            

    def get_plan(self, obs, amount=4):
        processed_obs = self.get_obs(obs)
        self.full_plan = self.planner.generatePlan(processed_obs, amount=4)
        self.excuted_plan = self.full_plan.copy()
        print(f"{self.name} | {self.full_plan}")
        self.planpointer = 0 

    def get_obs(self, obs):
        state = copy(obs)
        state['Targets'] = obs['Targets'][self.opp_targets]
        state['Full_Pos'] = 360*obs['Orbit'] + obs['Pos']
        return state
    
    def reset_env(self, env):
        env.SatSim.targets = env.SatSim.initRandomTargets(self.opp_targets)
        return env