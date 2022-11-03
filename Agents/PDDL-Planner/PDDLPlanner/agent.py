import gym
from copy import copy
import numpy as np
import os
from typing import Dict, List, Tuple, Union, Any
import importlib


class Planner:
    import PDDLPlanner
    PDDLPlanner_path = os.path.dirname(PDDLPlanner.__file__)
    def __init__(self, 
                env: gym.Env, 
                name: str="PDDL-Planner", 
                log_dir: str = "./Logs/", 
                optic_sh: str = None,
                planner_setup: Dict[str, Any] ={"time_limit": 60, "memory_limit": 1000000},
                plan_setup: Dict[str, Any] = None,
                wait_time: int = 1,):
        # Variables
        self.env = env
        self.env_name = env.unwrapped.spec.id
        self.name = name
        self.log_dir = log_dir + name + "/"
        if optic_sh is None:
            optic_sh = self.PDDLPlanner_path + "/Utils/generateplan_optic.sh"
        self.optic_sh = optic_sh
        self.plan = []
        self.planner_setup = planner_setup
        self.plan_setup = plan_setup
        self.wait_time = wait_time
        self.waiting = 0

        # import Environment Specific Libraries
        path = f"PDDLPlanner.Environment_Specific.{self.env_name.replace('-','_')}."
        manager_lib = importlib.import_module(path + "Manager")
        action_lib  = importlib.import_module(path + "Action") 
        
        # PDDL Functions
        # Domain
        self.Domain_file = self.log_dir + "domain.pddl"
        self.Write_Domain = getattr(manager_lib, "writePDDLDomain")
        self.Write_Domain(env, self.Domain_file, Conservative_add=2)
        
        # Problem
        self.Problem_file = self.log_dir + "problem.pddl"
        self.Write_Problem = getattr(manager_lib, "writePDDLProblem")
        
        # Plan
        self.Plan_file = self.log_dir + "plan.txt"
        self.Read_Plan = getattr(manager_lib, "readPDDLPlan")
        self.Generate_Plan = getattr(manager_lib, "generatePlan")

        # Action
        self.Action_obj = getattr(action_lib, "Action")
        self.idle_action = self.Action_obj(env, "idle")
         

        
    def take_action(self, obs: Dict[str, Any]) -> int:
        if self.waiting > 0:
            self.waiting -= 1
            return self.idle_action.get_action_gym()
        if self.plan == []:
            self.plan = self.get_plan(obs)
            if self.plan == []:
                self.waiting = self.wait_time
                return self.idle_action.get_action_gym()
        action = self.plan[0]
        if action.check_preconditions(obs):
            self.plan.pop(0)
            return action.get_action_gym()
        else:
            return self.idle_action.get_action_gym()
    
    def get_plan(self, obs:Dict[str, Any]) -> List[Any]:
        self.Write_Problem(obs, self.Problem_file)
        planner_setup = self.planner_setup
        print(f"{self.name}: Generating Plan")
        self.Generate_Plan(self.optic_sh, self.Domain_file, self.Problem_file, self.Plan_file, **planner_setup)
        print(f"{self.name}: Reading Plan")
        plan_setup = self.plan_setup
        plan = self.Read_Plan(self.Plan_file, self.env, **plan_setup)
        if plan == []:
            print(f"{self.name}: Plan is empty")
        return plan