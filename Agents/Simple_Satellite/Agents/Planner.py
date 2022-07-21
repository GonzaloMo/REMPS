import gym
from gym import spaces
from copy import copy
import SimpleSatellite
from SimpleSatellite.envs.simulation.Utils import BaseVoice
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import numpy as np
from ArbiterVoices.Planner_utlis.AgentPDDL import PDDLAgent
from ArbiterVoices.Planner_utlis.GoalReferee import GoalReferee
from ArbiterVoices.utils import Action

class Planner(BaseVoice):
    def __init__(self, SatSim: SatelliteSim, name: str, goals: list):
        super().__init__(name=name)
        self.planner = PDDLAgent(SatSim, name)
        self.name = name
        self.full_plan = []
        self.excuted_plan = []
        self.goals = goals
        self.Initial_goals = goals
        self.Action_doNothing = Action(SatSim.ACTION_DO_NOTHING, name, -100)
        self.replan = True
        self.write_plan_log = True
        
    def getAction(self, obs, epsilon=2) -> int:
        # if len(self.excuted_plan) < 1:
        if np.sum(self.Goal_ref.goals) == 0:
            if self.write_plan_log:
                print(f"{self.name} | all goals achieved")
                self.write_plan_log = False
            return self.Action_doNothing
        if self.excuted_plan == [] and self.replan:
            self.get_plan(obs)
            return self.getAction(obs, epsilon=epsilon)
        elif self.excuted_plan == [] and not self.replan:
            if self.write_plan_log:
                print(f"{self.name} | Not replanning")
                self.write_plan_log = False
            return self.Action_doNothing
        pos, next_action, image, memory = self.excuted_plan[0]
        obs = self.get_obs(obs)
        if obs["Full_Pos"] < pos < obs["Full_Pos"]+epsilon:
            action  = Action(next_action, self.name, pos)
            action.set_action_tuple(next_action, image)
            return action
        else:
            return self.Action_doNothing
            
    def get_plan(self, obs, amount=4):
        self.current_orbit = obs["Orbit"][0]
        self.current_pos = obs["Pos"][0]
        processed_obs = self.get_obs(obs)
        processed_obs["Orbit"] = obs["Orbit"] - self.current_orbit
        goals = self.goals.copy()
        self.full_plan, self.replan = self.planner.generatePlan(processed_obs, goals, 9, orbits = self.SatSim.MAX_ORBITS, time_limit=3600)
        # Correct to general reference frame
        for i in range(len(self.full_plan)):
            pos = self.full_plan[i][0] + self.current_orbit*360 + self.current_pos
            self.full_plan[i] = (pos, self.full_plan[i][1], self.full_plan[i][2], self.full_plan[i][3])
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
        if len(self.excuted_plan) > 1: 
            for i in range(len(self.excuted_plan)):
                if plan[i][0] > pos:
                    break
            self.excuted_plan = plan[i:].copy()
        elif len(self.excuted_plan) == 1:
            if plan[0][0] < pos:    
                self.excuted_plan = []

    def update_goals(self, goals_achieved, debug=False):
        goals = self.goals.copy()
        for i, g in enumerate(goals_achieved):
            current_g = self.Initial_goals[i] - g
            goals[i] = max(0, current_g)
        self.goals = goals.copy()