import gym
from copy import copy
import numpy as np
import os
from typing import Dict, List, Tuple, Union, Any
from copy import deepcopy
from PDDLPlanner.Utils.planner_utils import generatePlan
import importlib


class Planner:
    import PDDLPlanner
    PDDLPlanner_path = os.path.dirname(PDDLPlanner.__file__)
    def __init__(self, 
                env: gym.Env, 
                env_name: str = None,
                name: str="Planner_0", 
                plan_dir: str = "./Logs/PDDL/", 
                optic_sh: str = "",
                planner_setup: Dict[str, Any] ={"time_limit": 60, "memory_limit": 1000000},
                plan_setup: Dict[str, Any] = None,
                wait_time: int = 1,
                verbose: bool = True):
        # Variables
        assert isinstance(env, gym.Env), f"env must be a gym environment, it is currently a {type(env)}"
        self.env = env

        self.name = name
        self.verbose = verbose
        if env_name is None:
            self.env_name = env.unwrapped.spec.id
        else:
            self.env_name = env_name
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
        self.create_folders()
        # Domain
        self.Domain_file = self.planner_dir + f"/Domains/{name}.pddl"
        self.Write_Domain = getattr(manager_lib, "create_Domain")
        
        # Problem
        self.Problem_file = self.planner_dir + f"/Problems/{name}.pddl"
        self.Write_Problem  = getattr(manager_lib, "create_Problem")
        
        # Plan
        self.Plan_file = self.planner_dir + f"/Plans/{name}.txt"
        self.Read_Plan = getattr(manager_lib, "read_Plan")
    
    def generateDomain(self, setup: Dict[str, Any] = None):
        self.Write_Domain(setup, self.Domain_file)
    
    def generateProblem(self, obs: Dict[str, Any]):
        self.Write_Problem(obs, self.Problem_file)

    def get_action(self, obs: Dict[str, Any]) -> int:
        obs = self.observation_handler(obs)
        # Check if plan is available
        if self.plan == []:
            self.plan = self.get_plan(obs)
            if self.plan == []:
                return self.env.action_space.sample()
            
        action = self.plan[0]
        check = action.checkPreconditions(obs)
        info = {}
        # pos = np.reshape(np.array(np.where(obs["Map"]==1)), (2,))
        # info = {"Plan": [str(a) for a in self.plan], "Pos": pos, "precondition": action.getPreconditions(), "Check": np.array([check])}
        if check:
            self.plan.pop(0)
            
            return action.getAction(), info
        else:
            return self.env.action_space.sample(), info
    
    def observation_handler(self, obs: Dict[str, Any]) -> Dict[str, Any]:
        new_obs = deepcopy(obs)
        if "Map" in obs:
            grid_size = int(len(obs["Map"])**.5)
            new_obs = {"Map": np.reshape(obs["Map"], (grid_size, grid_size))}
            if "Goal" in obs:
                new_obs["Goal"] = np.reshape(obs["Goal"], (grid_size, grid_size))
        return new_obs
    
    def get_plan(self, Map) -> List[Any]:
        self.Write_Problem(Map, self.Problem_file)
        planner_setup = self.planner_setup
        if self.verbose:
            print(f"{self.name}: Generating Plan")
        generatePlan(self.optic_sh, self.Domain_file, self.Problem_file, self.Plan_file, **planner_setup)
        if self.verbose:
            print(f"{self.name}: Reading Plan")
        plan_setup = self.plan_setup
        plan = self.Read_Plan(self.Plan_file, **plan_setup)
        if self.verbose and plan == []:
            print(f"{self.name}: Plan is {plan}")
        return plan
    

    def create_folders(self):
        if not os.path.exists(self.planner_dir):
            os.makedirs(self.planner_dir)
        if not os.path.exists(self.planner_dir + "/Domains"):
            os.makedirs(self.planner_dir + "/Domains")
        if not os.path.exists(self.planner_dir + "/Problems"):
            os.makedirs(self.planner_dir + "/Problems")
        if not os.path.exists(self.planner_dir + "/Plans"):
            os.makedirs(self.planner_dir + "/Plans")
            
    def set_name(self, name: str):
        self.name = name
        self.Domain_file = self.planner_dir + f"/Domains/{name}.pddl"
        self.Problem_file = self.planner_dir + f"/Problems/{name}.pddl"
        self.Plan_file = self.planner_dir + f"/Plans/{name}.txt"

    def reset_episode(self):
        self.plan = []