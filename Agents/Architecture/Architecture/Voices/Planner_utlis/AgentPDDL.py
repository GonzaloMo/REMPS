from logging import raiseExceptions
from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from ArbiterVoices.Planner_utlis import PDDLManager 
import numpy as np

class PDDLAgent:

    def __init__(self, sim: SatelliteSim, name:str):
        self.plan_requested = False
        self.plan_received = False
        self.plan_start = -1
        self.plan = []
        self.current_action = None
        self.name = name
        self.save_dir = "ArbiterVoices/Planner_utlis/"
        PDDLManager.writePDDLDomain(sim, self.save_dir+"Domain.pddl")
        
        # # check if log folder exists
        # if not os.path.exists(log_dir):
        #     os.makedirs(log_dir)
        # # Check if log file exists
        # if not os.path.exists(log_dir+"Goal_seed.txt"):
        #     with open(log_dir+"Goal_seed.txt", "a") as f:
        #         f.write("Planner | "+datetime.datetime.now().strftime("  Date and Time  ") + " | " +"Goals Sim"+"\n")

    def generatePlan(self, obs, goals, n_tries, orbits:int = SatelliteSim.MAX_ORBITS, time_limit=120, n_goals=None):
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
        PDDLManager.writePDDLProblem(obs, self.save_dir+"Problems/pr_"+self.name+".pddl", goals_problem,orbits=orbits)
        MadePlan = PDDLManager.generatePlan(self.save_dir, "Domain.pddl", "Problems/pr_"+self.name+".pddl", "Plans/pl_"+self.name+".txt",time_limit=time_limit)
        if MadePlan:
            plan = PDDLManager.readPDDLPlan(self.save_dir+"Plans/pl_"+self.name+".txt", obs)
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


    
    

        
