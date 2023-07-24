""" 
The env.start_grid_map is 
[   
[1 0 0 0 0 0 0 0 0 3 0 3 0 0 0 0]
[0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0]
[0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 3 3 3 0 3 0 0 0 0 0 0 0]
[0 0 0 0 3 0 0 0 3 0 0 0 0 0 0 0]
[0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0]
[3 0 0 0 3 0 0 0 0 0 0 0 0 0 0 3]
[0 0 0 0 3 3 3 3 3 0 0 0 0 0 0 0]
[3 0 0 0 0 0 0 0 3 0 0 0 0 0 0 3]
[3 3 3 3 3 3 3 3 3 3 3 3 0 3 3 3]
[0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0]
[0 0 0 0 3 0 0 0 3 0 0 0 0 0 0 3]
[3 3 3 3 0 3 3 3 3 3 3 3 3 3 0 0]
[0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 3]
[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0]
]

where:

- 0 are spaces
- 1 is the robot
- 2 is the goal
- 3 are  obstacles 
"""
import numpy as np
def create_Problem(obs, problem_filename):
	ObsMap = obs["Map"]
	GoalMap = obs["Goal"]
	max_mineral = np.sum(GoalMap)
	print(max_mineral)
	shape = ObsMap.shape
	with open(problem_filename,'w') as f:
		f.write("(define (problem GridWorld)\n")
		f.write("	(:domain SimpleWorld)\n")
		objects = "	(:objects \n"+"			RB - Robot\n"+"			"
		initC = f"			(= (Total_Minerals) 0)\n"
		initC += f"			(= (Total_steps) 0)\n"
		connections = ""
		Mineral_loc = ""
		goals = "		(:goal (and\n"
		for i in range(shape[0]):
			for j in range(shape[1]):
				objects += "g_{}_{} ".format(int(i),int(j))
				val = ObsMap[i][j]
				if val < 3: 
					i_n, i_s, j_w, j_e = i-1, i+1, j-1, j+1 
					if 0<=i_n<shape[0]:
						if ObsMap[i_n][j] != 3:
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i_n),int(j))
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i_n),int(j),int(i),int(j))
					if 0<=i_s<shape[0]:
						if ObsMap[i_s][j] != 3:
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i_s),int(j))
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i_s),int(j),int(i),int(j))
					if 0<=j_w<shape[1]:
						if ObsMap[i][j_w] != 3:
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i),int(j_w))
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j_w),int(i),int(j))
					if 0<=j_e<shape[1]:
						if ObsMap[i][j_e] != 3:
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j),int(i),int(j_e))
							connections += "			(connected g_{}_{} g_{}_{})\n".format(int(i),int(j_e),int(i),int(j))
				if GoalMap[i][j]>0:
					Mineral_loc += "			(in g_{}_{})\n".format(int(i),int(j))
				if val == 1:
					start_pos = "			(at RB g_{}_{})\n".format(int(i),int(j))
				elif val == 2:
					goals += "		    (at RB g_{}_{})\n".format(int(i),int(j))
		# goals += "		    (> (Total_Minerals) 1)\n"
		goals += "           (= (Total_Minerals) {})\n)\n)\n)".format(int(max_mineral))
		# metrics = "  (:metric minimize (Total_steps))\n"

		objects += "- Location\n"
		f.write("	(:requirements :strips :typing)\n")
		f.write(objects)
		f.write("	)\n")
		f.write("	(:init\n")
		f.write("			;; Initial Location\n")
		f.write(start_pos)
		f.write("           ;; Empty metric\n")
		f.write(initC)
		f.write("			;; Connections\n")
		f.write(connections)
		f.write("			;; Mineral Locations\n")
		f.write(Mineral_loc)
		f.write("	)\n")
		# f.write(metrics)
		f.write(goals)
		

def create_Domain(setup, problem_filename):
	file_str = ""
	file_str += f"(define (domain SimpleWorld)\n"
	file_str += f"    (:requirements\n"
	file_str += f"        :strips :typing :numeric-fluents\n"
	file_str += f"    )\n\n"
	file_str += f"    (:types\n"
	file_str += f"        Location\n"
	file_str += f"        Robot\n"
	file_str += f"    )\n\n"
	file_str += f"    (:predicates\n"
	file_str += f"        (at ?r - Robot ?l - Location)\n"
	file_str += f"        (connected ?l1 ?l2 - Location)\n"
	file_str += f"        (in ?l - Location)\n"
	file_str += f"    )\n"
	file_str += f"    (:functions\n"
	file_str += f"        (Total_steps)\n"
	file_str += f"        (Total_Minerals)\n"
	file_str += f"    )\n\n"
	file_str += f"    (:action move\n"
	file_str += f"        :parameters (?r - Robot ?l1 ?l2 - Location)\n"
	file_str += f"        :precondition (and \n"
	file_str += f"            (at ?r ?l1)\n"
	file_str += f"			  (connected ?l1 ?l2)\n"
	file_str += f"            )\n"
	file_str += f"        :effect (and\n"
	file_str += f"            (not (at ?r ?l1))\n"
	file_str += f"            (at ?r ?l2)\n"
	file_str += f"            (increase (Total_steps) 1)\n"
	file_str += f"            )\n"
	file_str += f"    )\n"
	file_str += f"    (:action pickup\n"
	file_str += f"        :parameters (?r - Robot ?l - Location)\n"
	file_str += f"        :precondition (and \n"
	file_str += f"            (at ?r ?l)\n"
	file_str += f"			 (in ?l)\n"
	file_str += f"            )\n"
	file_str += f"        :effect (and\n"
	file_str += f"            (increase (Total_Minerals) 1)\n"
	file_str += f"            (not (in ?l))\n"
	file_str += f"            )\n"
	file_str += f"    )\n"
	file_str += f")\n"
	with open(problem_filename,'w') as f:
		f.write(file_str)
	
def read_Plan(file, **kwargs):
	plan = []
	f = open(file, "r")
	line = f.readline().strip()
	start_reading = False
	end = True
	while end:
		if start_reading and line:
			tokens = line.replace(")", "").replace("(", "").split()
			if len(tokens)> 1:
				if "move" in tokens[1]:
					from_pos = np.array(tokens[3].split("_")[1:3], dtype=np.int32)
					to_pos = np.array(tokens[4].split("_")[1:3], dtype=np.int32)
					action = Action("move", from_pos, to_pos)
					plan.append(action)
		if 'Time' in line:
			start_reading = True
			plan = []
		line = f.readline().strip()
		if 'END' in line:
			end = False
	f.close()
	return plan

class Action:
	def __init__(self, name, preconditions, effects):
		self.preconditions = preconditions
		self.effects = effects
		if "move" in name:
			self.action_movement = effects - preconditions
			dx, dy = self.action_movement
			if dy == 1:
				self.action = 1
				self.name = "down"
			elif dy == -1:
				self.action = 0
				self.name = "up"
			elif dx == 1:
				self.action = 3
				self.name = "right"
			elif dx == -1:
				self.action = 2
				self.name = "left"
			else:
				self.action = -1
				self.name = "idle"
				
		elif "pickup" in name:
			self.action = -1
			self.name = "pickup"

	def getAction(self):
		return self.action

	def getAtionMovement(self):
		return self.action_movement

	def getPreconditions(self):
		return self.preconditions

	def getEffects(self):
		return self.effects

	def checkPreconditions(self, obs):
		x, y = np.reshape(np.array(np.where(obs["Map"]==1)), (2,))
		return x == self.preconditions[0] and y == self.preconditions[1]

	def checkEffects(self, obs):
		x, y = np.reshape(np.array(np.where(obs["Map"]==1)), (2,))
		return x == self.effects[0] and y == self.effects[1]
	

	def __str__(self):
		return self.name
	
