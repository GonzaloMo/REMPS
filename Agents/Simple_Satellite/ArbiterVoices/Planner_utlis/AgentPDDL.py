import math
import threading
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from ArbiterVoices.Planner_utlis import PDDLManager 
from ArbiterVoices.Planner_utlis.GoalReferee import GoalReferee
import IPython

class PDDLAgent:

    def __init__(self, sim: SatelliteSim, name:str):
        self.plan_requested = False
        self.plan_received = False
        self.plan_start = -1
        self.plan = []
        self.current_action = None
        self.name = name
        self.save_dir = "ArbiterVoices/Planner_utlis/"
        self.GoalRef = GoalReferee()
        PDDLManager.writePDDLDomain(sim, self.save_dir+"Domain.pddl")

    def generatePlan(self, obs, amount=4):
        print(f"{self.name} | Generating plan")
        goals = self.GoalRef.generateSingleGoals(len(obs['Targets']), amount=amount)       
        print(f"{self.name} | Goals: {goals}")
        PDDLManager.writePDDLProblem(obs, self.save_dir+"Problems/pr_"+self.name+".pddl", goals,orbits=8)
        MadePlan = PDDLManager.generatePlan(self.save_dir, "Domain.pddl", "Problems/pr_"+self.name+".pddl", "Plans/pl_"+self.name+".pddl")
        print(f"{self.name} | Plan generated")
        if MadePlan:
            plan = PDDLManager.readPDDLPlan(self.save_dir+"Plans/pl_"+self.name+".pddl")
            return plan
        else:
            print(f"({self.name}) planning failed")
            return []
        
