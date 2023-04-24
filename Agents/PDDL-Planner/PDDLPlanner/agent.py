import gym
from copy import copy
import numpy as np
import os
from typing import Dict, List, Tuple, Union, Any
from PDDLPlanner.Utils.planner_utils import generatePlan
import importlib


class Planner:
    import PDDLPlanner
    PDDLPlanner_path = os.path.dirname(PDDLPlanner.__file__)
    def __init__(self, 
                env: gym.Env, 
                env_name: str = None,
                name: str="PDDL-Planner", 
                plan_dir: str = "./Logs/PDDL/", 
                optic_sh: str = "",
                planner_setup: Dict[str, Any] ={"time_limit": 60, "memory_limit": 1000000},
                plan_setup: Dict[str, Any] = None,
                wait_time: int = 1,):
        # Variables
        assert isinstance(env, gym.Env), f"env must be a gym environment, it is currently a {type(env)}"
        self.env = env
        if env_name is None:
            self.env_name = env.unwrapped.spec.id
        else:
            self.env_name = env_name
        self.name = name
        if optic_sh is "":
            optic_sh = self.PDDLPlanner_path + "/Utils/generateplan_optic.sh"
        self.optic_sh = optic_sh
        self.plan = []
        self.planner_setup = planner_setup
        self.plan_setup = plan_setup
        self.wait_time = wait_time
        self.waiting = 0
        self.planner_dir = f"{plan_dir}/{self.env_name.replace('-','_')}/"
        if not os.path.exists(self.planner_dir):
            os.makedirs(self.planner_dir)

        # import Environment Specific Libraries
        manager_lib = importlib.import_module(f"PDDLPlanner.Environment_Specific.{self.env_name.replace('-','_')}.Manager")

        # PDDL Functions
        # Domain
        self.Domain_file = self.planner_dir + "Domain.pddl"
        self.Write_Domain = getattr(manager_lib, "create_Domain")
        
        # Problem
        self.Problem_file = self.planner_dir + "Problem.pddl"
        self.Write_Problem  = getattr(manager_lib, "create_Problem")
        
        # Plan
        self.Plan_file = self.planner_dir + "Plan.txt"
        self.Read_Plan = getattr(manager_lib, "read_Plan")
    
    def generateDomain(self, setup: Dict[str, Any] = None):
        self.Write_Domain(setup, self.Domain_file)
    
    def generateProblem(self, obs: Dict[str, Any]):
        self.Write_Problem(obs, self.Problem_file)

    def get_action(self, obs: Dict[str, Any]) -> int:
        Map = self.observation_handler(obs)
        # Check if plan is available
        if self.plan == []:
            self.plan = self.get_plan(Map)
            if self.plan == []:
                return self.env.action_space.sample()
            
        action = self.plan[0]
        check = action.checkPreconditions(Map)
        pos = np.reshape(np.array(np.where(Map==1)), (2,))
        info = {"Plan": [str(a) for a in self.plan], "Pos": pos, "precondition": action.getPreconditions(), "Check": np.array([check])}
        if check:
            self.plan.pop(0)
            
            return action.getAction(), info
        else:
            return self.env.action_space.sample(), info
    
    def observation_handler(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        grid_size = int(len(obs["Map"])**.5)
        new_obs = np.reshape(obs["Map"], (grid_size, grid_size))
        return new_obs
    
    def get_plan(self, obs:Dict[str, Any]) -> List[Any]:
        self.Write_Problem(obs, self.Problem_file)
        planner_setup = self.planner_setup
        print(f"{self.name}: Generating Plan")
        generatePlan(self.optic_sh, self.Domain_file, self.Problem_file, self.Plan_file, **planner_setup)
        print(f"{self.name}: Reading Plan")
        plan_setup = self.plan_setup
        plan = self.Read_Plan(self.Plan_file, **plan_setup)
        if plan == []:
            print(f"{self.name}: Plan is empty")
        return plan