from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from ArbiterVoices.Planner_utlis import PDDLManager 

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


    def generatePlan(self, obs, goals, orbits:int = SatelliteSim.MAX_ORBITS):
        print(f"{self.name} | Generating plan")      
        PDDLManager.writePDDLProblem(obs, self.save_dir+"Problems/pr_"+self.name+".pddl", goals,orbits=orbits)
        MadePlan = PDDLManager.generatePlan(self.save_dir, "Domain.pddl", "Problems/pr_"+self.name+".pddl", "Plans/pl_"+self.name+".pddl")
        
        if MadePlan:
            print(f"{self.name} | Plan generated")
            plan = PDDLManager.readPDDLPlan(self.save_dir+"Plans/pl_"+self.name+".pddl")
            return plan
        else:
            print(f"({self.name}) planning failed")
            return []

    
    

        
