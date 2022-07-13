import gym
from gym import spaces
from copy import copy
import SimpleSatellite
from SimpleSatellite.envs.simulation.Utils import BaseVoice
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import numpy as np
from ArbiterVoices.Planner_utlis.AgentPDDL import PDDLAgent
from ArbiterVoices.Planner_utlis.GoalReferee import GoalReferee

class Planner_Voice(BaseVoice):
    def __init__(self, SatSim: SatelliteSim, n_targets, tot_targets, name="Planner", log_dir="./Logs/Simulation/"):
        super().__init__(name=name)
        self.planner = PDDLAgent(SatSim, name)
        self.opp_targets = np.random.randint(0, tot_targets, n_targets)
        self.name = name
        self.full_plan = []
        self.excuted_plan = []
        self.Goal_ref = GoalReferee(tot_targets, n_targets)
        self.goals = self.Goal_ref.generateSingleGoals(amount=20)
        
    def getAction(self, obs, epsilon=1) -> int:
        planpointer = -1
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
            if processed_obs['Full_Pos']-epsilon < p < processed_obs['Full_Pos']+epsilon:
                planpointer = i
        if planpointer < 0:
            return 3
        self.excuted_plan = self.excuted_plan[planpointer:]
        if len(self.excuted_plan)>1:
            p, ac, _, _ = self.excuted_plan.pop(0)
            return ac
        else:
            return 3
            

    def get_plan(self, obs, amount=4):
        processed_obs = self.get_obs(obs)
        goals = self.Goal_ref.goals.copy()
        print(f"{self.name} | Goals: ", goals)
        self.full_plan = self.planner.generatePlan(processed_obs, goals)
        self.excuted_plan = self.full_plan.copy()
        print(f"{self.name} | {self.full_plan}")
        self.planpointer = 0 

    def get_obs(self, obs):
        state = copy(obs)
        state['Full_Pos'] = 360*obs['Orbit'] + obs['Pos']
        return state
    
    def reset_env(self, env):
        env.SatSim.targets = env.SatSim.initRandomTargets(self.opp_targets)
        return env
    
    