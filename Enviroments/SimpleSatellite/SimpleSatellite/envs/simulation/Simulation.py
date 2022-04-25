import math
from numpy import random
from SimpleSatellite.envs.simulation.GoalReferee import GoalReferee
import numpy as np

class SatelliteSim:

    MAX_ORBITS = 30

    CIRCUNFERENCE = 360
    ACTION_THRESHOLD = 1

    MEMORY_SIZE = 10

    ACTION_TAKE_IMAGE = 0
    ACTION_DUMP = 1
    ACTION_ANALYSE = 2

    DURATION_TAKE_IMAGE = 2
    DURATION_DUMP = 19
    DURATION_ANALYSE = 49

    TARGET_HALF_SIZE = 5.
    GS_HALF_SIZE = 15.

    def __init__(self, period=600):

        self.sim_time = 0
        self.PERIOD = period
        self.dt = period/SatelliteSim.CIRCUNFERENCE
        self.velocity = SatelliteSim.CIRCUNFERENCE/period

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = None

        # planet position
        self.random = False
        self.n_gs = 1
        gs_c = [288]
        self.groundStations = []
        for i in range(self.n_gs):
            self.groundStations.append([gs_c[i]-SatelliteSim.GS_HALF_SIZE, gs_c[i]+SatelliteSim.GS_HALF_SIZE])

        self.n_tagets = 4
        t_c= [6., 72., 144., 216.]
        self.targets = []
        for i in range(self.n_tagets):
            self.targets.append([t_c[i]-SatelliteSim.TARGET_HALF_SIZE,t_c[i]+SatelliteSim.TARGET_HALF_SIZE])

        # memory state
        self.memory_level = 0
        self.images = [0] * self.MEMORY_SIZE
        self.analysis = [False] * self.MEMORY_SIZE
        self.satellite_busy_time = 0
        self.busy=0

        # goals
        self.goalRef = GoalReferee()

    def update(self, action):
        done = False

        # update time variables
        self.sim_time += self.dt
        self.pos += self.velocity*self.dt

        # update orbit position
        if self.pos > SatelliteSim.CIRCUNFERENCE:
            self.pos -=  SatelliteSim.CIRCUNFERENCE
            self.orbit += 1

        if self.satellite_busy_time > 0:
            self.satellite_busy_time = self.satellite_busy_time - self.dt

        # Check if simulation ends
        if self.orbit>=SatelliteSim.MAX_ORBITS:
            done = True

        # update state
        self.apply_action(action)
        state = self.get_state()
        return state, done
        

    def apply_action(self, action):   

        # check if busy or the satellite does nothing 
        if self.satellite_busy_time > 0 or action==3 or action==None:
            self.busy=1
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
                            return
        
        # Analyse picture
        if action == SatelliteSim.ACTION_ANALYSE:
            self.satellite_busy_time = SatelliteSim.DURATION_ANALYSE
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
                # Check all the images
                for index in range(1,len(self.analysis)+1):
                    pic2dump = len(self.analysis) - index
                    if self.analysis[pic2dump]:
                        self.analysis[pic2dump] = False
                        self.images[pic2dump] = 0
                        self.memory_level = max(0,self.memory_level-1)
                        self.last_action = action
                        # score the goal value
                        self.goalRef.evaluateDump(self.orbit, self.images[pic2dump])
                        return


    def action_is_posible(self):
        # check if busy or the satellite does nothing 
        if self.satellite_busy_time > 0:
            self.busy=1
            return False
        
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

    def reset(self):
        self.sim_time = 0

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = None

        # memory state
        self.memory_level = 0
        self.images = [0] * self.MEMORY_SIZE
        self.analysis = [False] * self.MEMORY_SIZE
        self.satellite_busy_time = 0
        if self.random:
            # Generate Targets
            self.initRandomTargets()

            # Generate Ground Stations
            self.initRandomStations()
        return self.get_state()

    def initRandomStations(self):
        self.groundStations = []
        for i in range(self.n_gs):
            s = random.random()*(SatelliteSim.CIRCUNFERENCE-SatelliteSim.GS_HALF_SIZE)
            self.groundStations.append((s, s+SatelliteSim.GS_HALF_SIZE))

    def initRandomTargets(self, amount):
        self.targets = []
        for i in range(self.n_tagets):
            s = random.random()*(SatelliteSim.CIRCUNFERENCE-SatelliteSim.TARGET_HALF_SIZE)
            self.targets.append((s, s+SatelliteSim.TARGET_HALF_SIZE))

    def get_state(self):
        # obs = {'Orbit': self.orbit, 
        #         'Pos': np.array([self.pos], dtype=np.float32),
        #         'Busy': self.busy,
        #         'Memory Level': self.memory_level,
        #         'Images': np.array(self.images, dtype=np.float32),
        #         'Analysis': np.array(self.analysis, dtype=np.int8),
        #         'Targets': np.array(self.targets, dtype=np.float32),
        #         'Ground Stations': np.array(self.groundStations, dtype=np.float32)}
        obs = {'Orbit': np.array([self.orbit], dtype=np.int8), 
                'Pos': np.array([self.pos], dtype=np.float32),
                'Busy': np.array([self.busy], dtype=np.int8),
                'Memory Level': np.array([self.memory_level], dtype=np.int8),
                'Images': np.array(self.images, dtype=np.float32),
                'Analysis': np.array(self.analysis, dtype=np.int8),
                'Targets': np.array(self.targets, dtype=np.float32),
                'Ground Stations': np.array(self.groundStations, dtype=np.float32)}
        return obs
    # def get_state(self):
    #     state = [self.sim_time, self.pos, self.busy, self.memory_level, 
    #             *self.images, *self.analysis, *self.targets, *self.groundStations]
    #     return state
        
    def time2angle(self, time):
        delta_t = time - math.floor(time/self.PERIOD) * self.PERIOD
        return self.velocity*delta_t
    
    def angle2time(self, angle):
        T = self.orbit*self.PERIOD
        t = T + angle / self.velocity

