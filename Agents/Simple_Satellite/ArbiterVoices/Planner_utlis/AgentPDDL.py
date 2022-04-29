import math
import threading
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.Planner import PDDLManager 

class PDDLAgent:

    def __init__(self):
        super(PDDLAgent, self).__init__("PDDLAgent")
        self.plan_requested = False
        self.plan_received = False
        self.plan_start = -1
        self.plan = []
        self.current_action = None
        self.name = "Planner"
        self.save_dir = "SimpleSatellite/envs/Planner/"

    def generatePlan(self, obs):
        
        # print("({name}) generating a plan".format(name=self.name))
        PDDLManager.writePDDLProblem(obs, self.save_dir+"problem/p.pddl", orbits=8)
        if PDDLManager.generatePlan(self.save_dir+"domain.pddl", self.save_dir+"problem/p.pddl", self.save_dir+"plan/p.pddl"):
            # print("({name}) planning complete".format(name=self.name))
            self.plan = PDDLManager.readPDDLPlan(self.save_dir+"plan/p.pddl")
            if len(self.plan) > 0: self.current_action = self.plan.pop(0)
        else:
            print("({name}) planning failed".format(name=self.name))
        self.plan_received = True
        self.plan_requested = False
        self.plan_start = -1

    
    

    def getAction(self, sim: SatelliteSim):

        # no more actions 
        if not self.plan_received or not self.current_action:
            if len(sim.goalRef.single_goals) == 0: return
            if not self.plan_requested:
                # generate a new plan
                self.plan_requested = True
                self.plan_received = False
                thread = threading.Thread(target=self.generatePlan(sim), args=[sim])
                thread.start()
            return

        # the current plan is not started 
        if self.plan_start < 0:
            orbit = math.ceil(sim.sim_time / sim.PERIOD)
            self.plan_start = orbit * sim.PERIOD
            print("({name}) plan will start on orbit {o} at time {t}".format(name=self.name, o=orbit, t=self.plan_start))

        # satellite is busy
        if sim.satellite_busy_time > 0: return

        # check next action
        if sim.sim_time > self.plan_start + self.current_action[0]:

            # prepare current action
            action = (self.current_action[1], self.current_action[2], self.current_action[3])
            print(action)
            # get next action ready
            if len(self.plan) > 0:
                self.current_action = self.plan.pop(0)
            else:
                print("({name}) plan complete".format(name=self.name))
                self.current_action = None

            return action
