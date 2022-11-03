from abc import ABC
import subprocess
import os

class PDDLAgent(ABC):
    def __init__(self, plan_name: str):
        self.plan_received = False
        self.plan_start = -1
        self.plan = []
        if type(plan_name) == str:
            self.plan_name = plan_name
        else:
            raise ('plan number/name is not a string')
        self.current_action = None

    def generatePlan(self, env, obs):
        self.env = env
        self.create_Problem(obs)
        # Run popf
        with open('PDDL/generateplan.sh', 'rb') as file:
            script = file.read()
        script = script % (str(self.plan_name).encode('UTF-8'),str(self.plan_name).encode('UTF-8'),)
        exit_code = subprocess.call(script, shell=True)
        if exit_code:
            print("WARN: Plan was not found!")
            return False
        else:
            self.plan_received = True
            self.read_plan()
            return True

    def read_plan(self):
        with open('PDDL/Plans/'+self.plan_name+'.txt', 'r') as f:
            check = True
            read_from = False
            self.plan = []
            self.plan_start = -1
            while check:
                line = f.readline()
                if line:
                    if read_from:
                        self.plan.append(line[8:-11].split())
                    elif line[0:6] == '; Time':
                        read_from = True
                else:
                    check = False
        os.remove('PDDL/Plans/'+self.plan_name+'.txt') 

    def create_Problem(self, obs):
        problem_filename = "PDDL/Problems/"+self.plan_name+".pddl"
        grid = obs
        shape = grid.shape
        with open(problem_filename,'w') as f:
            f.write("(define (problem GridWorld)\n")
            f.write("	(:domain SimpleGridWorld)\n")
            objects = "	(:objects \n"+"			RB - Robot\n"+"			"
            goal_pos = "		(:goal (and \n"
            connections = ""
            start_pos_ex = False
            for i in range(shape[0]):
                for j in range(shape[1]):
                    objects += "g_{}_{} ".format(int(i),int(j))
                    val = grid[i][j]
                    # finds Starting and end position
                    if val == 1:
                        start_pos = "			(at RB g_{}_{})\n".format(int(i),int(j))
                        start_pos_ex = True
                    elif val == 2:
                        goal_pos += "					(collected g_{}_{})\n".format(int(i),int(j))

                    # Sets connected waypoints
                    if val < 3:
                        North = 1
                        South = 1
                        west = 1
                        East = 1
                        if i>0:
                            North = grid[i-1][j]
                        if i<shape[0]-1:
                            South = grid[i+1][j]
                        if j>0:
                            west = grid[i][j-1]
                        if j<shape[1]-1:
                            East = grid[i][j+1]

                        if North < 3:
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i-1),int(j))
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i-1),int(j),int(i),int(j))
                        if South < 3:
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i+1),int(j))
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i+1),int(j),int(i),int(j))
                        if west < 3:
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i),int(j-1))
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j-1),int(i),int(j))
                        if East < 3:
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i),int(j+1))
                            connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j+1),int(i),int(j))
            f.write("	(:requirements :strips :typing)\n")
            f.write(objects)
            f.write("- Location\n	)\n")
            f.write("	(:init\n")
            f.write("			;; Initial Location\n")
            f.write(start_pos)
            f.write("			;; Connections\n")
            f.write(connections)
            f.write("	)\n")
            goal_pos += "					(at RB g_{}_{}))\n)\n)".format(self.env.goal_pos[0],self.env.goal_pos[1])
            f.write(goal_pos)
   
    
    def getAction(self, get_states=False):
        self.plan_start += 1
        if self.plan_start >= len(self.plan) or self.plan[self.plan_start]==[]:
            #print(self.plan)
            if get_states:
                return -1, [], []
            else:
                return -1
        action = self.plan[self.plan_start] 
        action_dict = self.env.action_dict
        if action[0] == 'move':
            from_pos = [int(s) for s in action[2].split('_') if s.isdigit()]
            to_pos = [int(s) for s in action[3].split('_') if s.isdigit()]
            if from_pos[1]-to_pos[1] == 0:
                if from_pos[0]-to_pos[0] == 1:
                    a = action_dict['West']
                elif from_pos[0]-to_pos[0] == -1:
                    a = action_dict['East']
            elif from_pos[0]-to_pos[0] == 0:
                if from_pos[1]-to_pos[1] == 1:
                    a = action_dict['North']
                elif from_pos[1]-to_pos[1] == -1:
                    a = action_dict['South']
            if self.write_output:
                print('no action')
                return -1
            else:
                if get_states:
                    return a, from_pos, to_pos
                else:
                    print('Single output')
                    return a 


   
    def getNextStep(self):
        a, s, n_s = self.getAction(get_states=True)
        return (a, s, n_s)