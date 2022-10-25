from SimpleSatellite.envs.Test_Utils.Action import Action
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from copy import copy
class Planner:
    def __init__(self, SatSim: SatelliteSim, name: str, goals: list, Save_path: str = "./SimpleSatellite/envs/Utils/"):
        self.planner = PDDLAgent(SatSim, name, savedir=Save_path)
        self.name = name
        self.full_plan = []
        self.excuted_plan = []
        self.goals = goals
        self.Initial_goals = goals
        self.n_targets = len(goals)
        self.SatSim = SatSim
        self.Action_doNothing_ac = Action(SatSim.ACTION_DO_NOTHING, name, -100, SatSim)
        self.Action_doNothing = self.Action_doNothing_ac.get_action_from_tuple(self.n_targets)
        self.replan = True
        self.write_plan_log = True
        
    def take_action(self, obs, epsilon=2) -> int:
        if np.sum(self.goals) == 0:
            print(f"{self.name} | all goals achieved")
            return self.Action_doNothing
        if self.excuted_plan == [] and self.replan:
            print("Replanning")
            self.get_plan(obs)
            return self.take_action(obs, epsilon=epsilon)
        elif not self.replan:
            print(f"waiting to replan {self.count_to_replan}")
            self.count_to_replan += 1
            if self.count_to_replan > 10:
                self.replan = True
                self.count_to_replan = 0
                self.get_plan(obs)
        elif self.excuted_plan == [] and not self.replan:
            if self.write_plan_log:
                print(f"{self.name} | Not replanning")
                self.write_plan_log = False
            return self.Action_doNothing
        if self.excuted_plan == []:
            print(f"{self.name} | Empty plan")
            self.get_plan(obs)
            return self.Action_doNothing
        pos, next_action, image, memory = self.excuted_plan[0]
        obs = self.get_obs(obs)
        if obs["Full_Pos"] < pos < obs["Full_Pos"]+epsilon:
            action  = Action(next_action, self.name, pos, self.SatSim)
            action.set_action_tuple(next_action, image)
            return action.get_action_from_tuple(self.n_targets)
        else:
            print(f"plan to excute\n {self.excuted_plan}")
            return self.Action_doNothing
    
    def get_plan(self, obs, timelimit=120):
        self.current_orbit = obs["Orbit"][0]
        self.current_pos = obs["Pos"][0]
        processed_obs = self.get_obs(obs)
        processed_obs["Orbit"] = obs["Orbit"] - self.current_orbit
        orbits_to_plan = self.SatSim.MAX_ORBITS - self.current_orbit
        goals = self.goals.copy()
        self.full_plan, self.replan = self.planner.generatePlan(processed_obs, goals, 1, orbits = orbits_to_plan, time_limit=timelimit)
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

    def update_goals(self, Goals_achieved, debug=False):
        goals = self.goals.copy()
        for i, g in enumerate(Goals_achieved):
            current_g = self.Initial_goals[i] - g
            goals[i] = max(0, current_g)
        self.goals = goals.copy()
    
    def update(self, obs):
        self.prune_plan(obs)
        self.update_goals()



"----------------------------------------------------------------------------------------------------------------------------"
" PDDL Agent"
"----------------------------------------------------------------------------------------------------------------------------"
from logging import raiseExceptions
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.Utils import PDDLManager 
import numpy as np
import os
import SimpleSatellite
path = os.path.dirname(SimpleSatellite.__file__)
class PDDLAgent:

    def __init__(self, sim: SatelliteSim, name:str, savedir:str = "SimpleSatellite/envs/Utils/", optic_dir:str = path+"/envs/Utils/"):
        self.plan_requested = False
        self.plan_received = False
        self.plan_start = -1
        self.plan = []
        self.current_action = None
        self.name = name
        self.save_dir = savedir+"PDDL/"
        self.domain_file = self.save_dir+"Domains/"+"Domain_"+self.name+".pddl"
        self.problem_file = self.save_dir+"Problems/"+"Problem_"+self.name+".pddl"
        self.plan_file = self.save_dir+"Plans/"+"Plan_"+self.name+".txt"
        self.optic_dir = optic_dir
        if not os.path.exists(self.save_dir):
            os.makedirs(self.save_dir)
            if not os.path.exists(self.save_dir+"Domains/"):
                os.makedirs(self.save_dir+"Domains/")
            if not os.path.exists(self.save_dir+"Problems/"):
                os.makedirs(self.save_dir+"Problems/")
            if not os.path.exists(self.save_dir+"Plans/"):
                os.makedirs(self.save_dir+"Plans/")
        PDDLManager.writePDDLDomain(sim, self.domain_file)


    def generatePlan(self, obs, goals, n_tries, orbits:int = SatelliteSim.MAX_ORBITS, time_limit=10, n_goals=None):
        # print(f"{self.name} | Generating plan")      
        set_goals = np.where(goals > 0)[0]
        set_goals.reshape((np.size(set_goals),))
        if n_goals is None:
            goals_problem = goals
        else:
            print("number of goals ",n_goals)
            if set_goals is  not np.ndarray:
                set_goals = np.array(set_goals)
            
            print((f"---------------\n {self.name}\ngoals: {goals}\nSet_goals: {set_goals}\nSize Set_goals: {np.size(set_goals)}\n"
            f"n_goals: {n_goals}\n"
            f"length set goals: {len(set_goals)}\n"
            f"-----------------------------------"))
            problem_goals_selected = np.random.choice(set_goals, size=min(n_goals, len(set_goals)))
            goals_problem = np.zeros(len(goals))
            
            for i in problem_goals_selected:
                goals_problem[i] = goals[i]
            print(f"{self.name} |  {goals} ")
            print(f"{self.name} |  {goals_problem}")
        PDDLManager.writePDDLProblem(obs, self.problem_file, goals_problem, orbits=orbits)
        MadePlan = PDDLManager.generatePlan(self.optic_dir, self.domain_file, self.problem_file, self.plan_file, time_limit=time_limit)
        if MadePlan:
            plan = PDDLManager.readPDDLPlan(self.plan_file, obs)
            if plan == [] and n_tries < 10:
                # print(f"({self.name}) planning failed")
                if n_goals is None:
                    n_goals = len(set_goals)
                    print("Set Goals: ", set_goals)
                else:
                    n_goals = max(1, n_goals-1)
                n_tries +=1
                plan, rpln = self.generatePlan(obs, goals, n_tries, orbits= orbits, time_limit=time_limit, n_goals=n_goals)
                return plan, rpln
            else:
                # print(f"{self.name} | Plan generated")
                return plan, True
        else:
            # print(f"({self.name}) planning failed")
            return [], True