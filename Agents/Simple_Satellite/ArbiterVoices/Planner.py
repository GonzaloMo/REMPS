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
        if len(self.excuted_plan) < 1:
            self.get_plan(obs)
            self.getAction(obs, epsilon=epsilon)
        pos, next_action, image, memory = self.excuted_plan[0]
        obs = self.get_obs(obs)
        if obs["Full_Pos"]-epsilon < pos < obs["Full_Pos"]+epsilon:
            return next_action
        else:
            return 3
            
    def get_plan(self, obs, amount=4):
        processed_obs = self.get_obs(obs)
        goals = self.Goal_ref.goals.copy()
        print(f"{self.name} | Goals: ", goals)
        self.full_plan = self.planner.generatePlan(processed_obs, goals)
        self.excuted_plan = self.full_plan.copy()
        print(f"{self.name} | {self.full_plan}")

    def get_obs(self, obs):
        state = copy(obs)
        state['Full_Pos'] = 360*obs['Orbit'] + obs['Pos']
        return state
    
    def reset_env(self, env):
        env.SatSim.targets = env.SatSim.initRandomTargets(self.opp_targets)
        return env
    
    def prune_plan(self, obs):
        plan = self.excuted_plan.copy()
        pos = 360*obs['Orbit'] + obs['Pos']
        for i in range(len(self.excuted_plan)):
            if plan[i][0] > pos:
                break
        self.excuted_plan = plan[i:].copy()
        if i == len(self.excuted_plan):
            self.excuted_plan = []

    