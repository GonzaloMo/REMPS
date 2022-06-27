import math
from numpy import random
from SimpleSatellite.envs.simulation.GoalReferee import GoalReferee
import numpy as np

class SatelliteSim:

    MAX_ORBITS = 30

    CIRCUNFERENCE = 360
    ACTION_THRESHOLD = 1

    MEMORY_SIZE = 10

    ACTIONS = [0, 1, 2, 3]
    ACTION_TAKE_IMAGE = 0
    ACTION_DUMP = 1
    ACTION_ANALYSE = 2
    ACTION_DO_NOTHING = 2
    ACTION_NAMES = ["TP","AN","DP","DN"]

    DURATION_TAKE_IMAGE = 20
    DURATION_DUMP = 20
    DURATION_ANALYSE = 49
    DURATIONS = [DURATION_TAKE_IMAGE,DURATION_DUMP,DURATION_ANALYSE]

    TARGET_HALF_SIZE = 5.
    GS_HALF_SIZE = 15.

    def __init__(self, period=600, random=False):

        self.sim_time = 0
        self.period = period
        self.dt = period/SatelliteSim.CIRCUNFERENCE
        self.velocity = SatelliteSim.CIRCUNFERENCE/period

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = 3

        # planet position
        self.random = random
        self.n_gs = 1
        gs_c = [288]
        self.groundStations = []
        for i in range(self.n_gs):
            self.groundStations.append([gs_c[i]-SatelliteSim.GS_HALF_SIZE, gs_c[i]+SatelliteSim.GS_HALF_SIZE])

        self.n_tagets = 4
        t_c= [6., 72., 144., 216.]
        self.target_list = []
        self.targets = []
        for i in range(self.n_tagets):
            self.targets.append([t_c[i]-SatelliteSim.TARGET_HALF_SIZE,t_c[i]+SatelliteSim.TARGET_HALF_SIZE])
            self.target_list.append(i)

        # memory state
        self.memory_level = 0
        self.images = [0] * self.MEMORY_SIZE
        self.analysis = [False] * self.MEMORY_SIZE

        # satellite busy time
        self.satellite_busy_time = 0
        self.busy = 0

        # goals
        self.goalRef = GoalReferee()

    def update(self, action):
        done = False

        # update time variables
        self.sim_time += self.dt
        self.pos += self.velocity*self.dt
        self.satellite_busy_time -= self.dt

        # update orbit position
        if self.pos > SatelliteSim.CIRCUNFERENCE:
            self.pos -=  SatelliteSim.CIRCUNFERENCE
            self.orbit += 1

        # update the satellite state
        if self.satellite_busy_time > 0:
            self.busy = 1
        else:
            self.busy = 0
        # Check if simulation ends
        if self.orbit>=SatelliteSim.MAX_ORBITS:
            done = True

        # update state
        self.action = action
        self.apply_action(action)
        state = self.get_state()
        return state, done
        

    def apply_action(self, action):   
        # check if busy or the satellite does nothing 
        if self.satellite_busy_time > 0:
            return 
        if action==3 or action==None:
            
            return
        # Take picture action
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Check free location in the memory
            for ind_mem in range(len(self.images)):
                if self.images[ind_mem] == 0:
                    # Check if above which target the satellite is
                    for index in range(len(self.targets)):
                        if self.targets[index][0] < self.pos < self.targets[index][1]:
                            self.satellite_busy_time = SatelliteSim.DURATION_TAKE_IMAGE
                            self.images[ind_mem] = index+1
                            self.analysis[ind_mem] = False
                            self.memory_level = min(SatelliteSim.MEMORY_SIZE, self.memory_level+1)
                            self.last_action = action
                            self.busy = 1
                            return
        
        # Analyse picture
        if action == SatelliteSim.ACTION_ANALYSE:
            self.satellite_busy_time = SatelliteSim.DURATION_ANALYSE
            self.busy = 1
            for index in range(len(self.analysis)):
                if not self.analysis[index] and not(self.images[index]== 0):
                    if random.random() > 0.0:
                        self.analysis[index] = True
                    else:
                        self.analysis[index] = False
                        self.images[index] = 0
                    self.last_action = action
                    return
        
        # Dump picture
        if action == SatelliteSim.ACTION_DUMP:
            # check if it is above the ground station and if their is any analysed image
            if any([gs[0]-SatelliteSim.ACTION_THRESHOLD < self.pos < gs[1]+SatelliteSim.ACTION_THRESHOLD for gs in self.groundStations]) and any(self.analysis) :
                self.satellite_busy_time = SatelliteSim.DURATION_DUMP
                self.busy = 1
                # Check all the images
                for index in range(1,len(self.analysis)+1):
                    pic2dump = len(self.analysis) - index
                    if self.analysis[pic2dump]:
                        image_dumped = self.images[pic2dump]
                        self.analysis[pic2dump] = False
                        self.Goal_achived[image_dumped] += 1
                        self.images[pic2dump] = 0
                        self.memory_level = max(0,self.memory_level-1)
                        self.last_action = action
                        # score the goal value
                        self.goalRef.evaluateDump(self.orbit, image_dumped)
                        return


    def action_is_posible(self):
        
        # Check if Take picture action is possible
        for index in range(len(self.targets)):
            # Checks if memory space is available and that the satellite is above target
            if self.targets[index][0] < self.pos < self.targets[index][1] and self.memory_level<SatelliteSim.MEMORY_SIZE:
                return True
        
        # Check if Analyse picture action is possible
        for index in range(len(self.images)):
            if not self.analysis[index] and self.images[index]>0:
                return True
        
        # Check if Dump picture action is possible
        # check if it is above the ground station and if their is any analysed image
        if any([gs[0]-SatelliteSim.ACTION_THRESHOLD < self.pos < gs[1]+SatelliteSim.ACTION_THRESHOLD for gs in self.groundStations]):
            if any(self.analysis):
                return True

        # No action is possible    
        return False

    def reset(self, n_targets: int =4):
        self.sim_time = 0
        self.n_tagets = n_targets
        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = 3
        self.Goal_achived = {}
        

        # memory state
        self.memory_level = 0
        self.images = [0] * self.MEMORY_SIZE
        self.analysis = [False] * self.MEMORY_SIZE
        self.satellite_busy_time = 0
        self.busy = 0
        if self.random:
            # Generate Targets
            self.targets = self.initRandomTargets(self.n_tagets)
            self.target_list = []
            for i in range(self.n_tagets):
                self.target_list.append(i+1)
                
            # # Generate Ground Stations
            # self.initRandomStations()
        for i in self.target_list:
            self.Goal_achived[i] = 0
        return self.get_state()

    def initRandomStations(self):
        self.groundStations = []
        for i in range(self.n_gs):
            s = random.random()*(SatelliteSim.CIRCUNFERENCE-SatelliteSim.GS_HALF_SIZE)
            self.groundStations.append((s, s+SatelliteSim.GS_HALF_SIZE))

    def initRandomTargets(self, amount):
        targets = []
        for i in range(amount):
            s = random.random()*(SatelliteSim.CIRCUNFERENCE-SatelliteSim.TARGET_HALF_SIZE)
            targets.append((s, s+SatelliteSim.TARGET_HALF_SIZE))
        return targets

    def get_state(self):
        obs = {'Orbit': np.array([self.orbit], dtype=np.int8), 
                'Pos': np.array([self.pos], dtype=np.float32),
                'Busy': np.array([self.busy], dtype=np.int8),
                'Memory Level': np.array([self.memory_level], dtype=np.int8),
                'Images': np.array(self.images, dtype=np.float32),
                'Analysis': np.array(self.analysis, dtype=np.int8),
                'Targets': np.array(self.targets, dtype=np.float32),
                'Ground Stations': np.array(self.groundStations, dtype=np.float32)}
        return obs
        
    def time2angle(self, time):
        delta_t = time - math.floor(time/self.period) * self.period
        return self.velocity*delta_t
    
    def angle2time(self, angle):
        T = self.orbit*self.period
        t = T + angle / self.velocity

