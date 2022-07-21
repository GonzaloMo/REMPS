import math
from numpy import random
from SimpleSatellite.envs.simulation.GoalReferee import GoalReferee
import numpy as np
import datetime
import os
from copy import copy


class SatelliteSim:

    MAX_ORBITS = 20

    CIRCUNFERENCE = 360
    ACTION_THRESHOLD = 1

    MEMORY_SIZE = 10

    ACTIONS = [0, 1, 2, 3]
    ACTION_DO_NOTHING = 0
    ACTION_TAKE_IMAGE = 1
    ACTION_ANALYSE = 2
    ACTION_DUMP = 3
    
    
    ACTION_NAMES = ["DN","TP","AN","DP"]

    DURATION_TAKE_IMAGE = 20
    DURATION_DUMP = 20
    DURATION_ANALYSE = 50
    DURATIONS = [DURATION_TAKE_IMAGE,DURATION_DUMP,DURATION_ANALYSE]

    TARGET_HALF_SIZE = 5.
    GS_HALF_SIZE = 20.

    def __init__(self, period=600, random_tg=False, n_gs=2, n_targets=4, log_dir = "./Logs/Simulation/"):
        """
        Initialize the satellite simulation.

        Args:
            period: the period of the satellite orbit.
            seed: the seed for the random number generator.
            random_tg: if True, the targets are randomly placed.
            n_gs: the number of ground stations.
            n_targets: the number of targets.
        """
        # initialize logger
        self.log_dir = log_dir
        # initialize simulation time
        self.sim_time = 0
        self.period = period
        self.dt = period/SatelliteSim.CIRCUNFERENCE
        self.velocity = SatelliteSim.CIRCUNFERENCE/period

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = 3

        # planet position
        self.n_gs = n_gs
        gs_c = [90, 270]
        self.groundStations = []
        for i in range(self.n_gs):
            min_pos = gs_c[i]-SatelliteSim.GS_HALF_SIZE
            max_pos = gs_c[i]+SatelliteSim.GS_HALF_SIZE
            if min_pos < 0:
                min_pos = 0
                self.groundStations.append([0, max_pos])
                self.groundStations.append([SatelliteSim.CIRCUNFERENCE + min_pos, SatelliteSim.CIRCUNFERENCE])
            elif max_pos > SatelliteSim.CIRCUNFERENCE:
                max_pos = SatelliteSim.CIRCUNFERENCE
                self.groundStations.append([0, max_pos - SatelliteSim.CIRCUNFERENCE])
                self.groundStations.append([min_pos, SatelliteSim.CIRCUNFERENCE])
            else: 
                self.groundStations.append([gs_c[i]-SatelliteSim.GS_HALF_SIZE, gs_c[i]+SatelliteSim.GS_HALF_SIZE])
            

        # targets
        self.random_targets = random_tg
        self.n_tagets = n_targets
        self.targets = []
        self.target_list = []
        if random_tg:
            self.n_tagets = 4
            t_c= [6., 72., 144., 216.]
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

    def update(self, action):
        """
        Update the satellite simulation.

        Args:
            action: the action to be taken. 

        Returns:
            state: the state of the satellite.
            done: if the simulation is has been terminated.
        """
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
            self.Taking_action = 0
        # Check if simulation ends
        if self.orbit>=SatelliteSim.MAX_ORBITS:
            done = True

        # update state
        self.apply_action_int(action)
        state = self.get_state()
        return state, done
        

    def apply_action_int(self, action_in): 
        """
        Apply the action to the satellite.

        Args:
            action: the action to be taken. 
        """
        if type(action_in) is not int:
            action, img = action_in
            
        else:
            action = action_in
            img = None
        self.action = action
        self.action_tuple = (action, img)
        # check if busy or the satellite does nothing 
        if self.satellite_busy_time > 0:
            return 
        if action==SatelliteSim.ACTION_DO_NOTHING or action==None:
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
                            print(f"Image taken by satellite img{index+1}")
                            self.analysis[ind_mem] = False
                            self.memory_level = min(SatelliteSim.MEMORY_SIZE, self.memory_level+1)
                            self.last_action = action
                            self.busy = 1
                            self.Taking_action = action
                            self.last_action_tuple = copy(self.action_tuple)
                            return
        
        # Analyse picture
        if action == SatelliteSim.ACTION_ANALYSE:
            self.satellite_busy_time = SatelliteSim.DURATION_ANALYSE
            self.busy = 1
            self.Taking_action = action
            for mem_slot in range(len(self.analysis)):
                if not self.analysis[mem_slot] and not(self.images[mem_slot] == 0):
                    print(f"Analyse {self.images[mem_slot]} sent by planner {img}")
                    # import IPython
                    # IPython.embed()
                    if img == self.images[mem_slot] or img == None:
                        self.analysis[mem_slot] = True
                        self.last_action = action
                        self.last_action_tuple = copy(self.action_tuple)
                        return
        
        # Dump picture
        if action == SatelliteSim.ACTION_DUMP:
            # check if it is above the ground station and if their is any analysed image
            if any([gs[0]-SatelliteSim.ACTION_THRESHOLD < self.pos < gs[1]+SatelliteSim.ACTION_THRESHOLD for gs in self.groundStations]) and any(self.analysis) :
                self.satellite_busy_time = SatelliteSim.DURATION_DUMP
                self.busy = 1
                self.Taking_action = action
                # Check if the image is analysed
                for mem_slot in range(SatelliteSim.MEMORY_SIZE-1, -1, -1):
                    if self.analysis[mem_slot]:
                        if img == None:
                            image_dumped = self.images[mem_slot]
                        elif self.images[mem_slot] == img:
                            image_dumped = img
                        else:
                            continue
                        # print(f"Dump {self.images[mem_slot]} sent by planner {img}")
                        # import IPython
                        # from time import sleep
                        # IPython.embed()
                        # sleep(0.5)
                        self.images[mem_slot] = 0
                        self.analysis[mem_slot] = False
                        self.Goals_achieved[image_dumped-1] += 1
                        self.memory_level = max(0,self.memory_level-1)
                        self.last_action = action
                        self.last_action_tuple = copy(self.action_tuple)
                        return


    def check_action(self, action_in):
        """
        Check if the action is posible.

        Args:
            action: the action to be taken.

        Returns:
            True if the action is posible.
        """
        if self.satellite_busy_time > 0:
            return False
        if type(action_in) is not int:
            action, img = action_in
        else:
            action, img = action_in, None
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Check free location in the memory
            for ind_mem in range(len(self.images)):
                if self.images[ind_mem] == 0:
                    # Check if above which target the satellite is
                    for index in range(len(self.targets)):
                        if self.targets[index][0] < self.pos < self.targets[index][1]:
                            return True

        if action == SatelliteSim.ACTION_ANALYSE:
            for index in range(len(self.analysis)):
                if not self.analysis[index] and not(self.images[index]== 0):
                    if img == self.images[index] or img == None:
                        return True

        if action == SatelliteSim.ACTION_DUMP:
            # check if it is above the ground station and if their is any analysed image
            if any([gs[0]-SatelliteSim.ACTION_THRESHOLD < self.pos < gs[1]+SatelliteSim.ACTION_THRESHOLD for gs in self.groundStations]):
                for mem_slot in range(SatelliteSim.MEMORY_SIZE-1, -1, -1):
                    if self.analysis[mem_slot]:
                        if img == None or self.images[mem_slot] == img:
                            return True
        return False

    def reset(self, n_targets: int =4, seed: int =None):
        """
        Reset the satellite simulation.

        Args:
            n_targets: the number of targets to be used in the simulation.

        Returns:
            The initial state of the satellite.
        """
        
        # Reset the random seed
        self.set_seed(seed=seed)

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = 3
        self.Goals_achieved = np.zeros(n_targets, dtype=np.int8)
        

        # memory state
        self.memory_level = 0
        self.images = [0] * self.MEMORY_SIZE
        self.analysis = [False] * self.MEMORY_SIZE
        self.satellite_busy_time = 0
        self.busy = 0
        if not self.random_targets:
            # Generate Targets
            self.targets = self.initRandomTargets(self.n_tagets)
            self.target_list = []
            for i in range(self.n_tagets):
                self.target_list.append(i+1)
                
            # # Generate Ground Stations
            # self.initRandomStations()
        return self.get_state()

    def initRandomStations(self):
        """
        Generate random ground stations.
            
        Returns:
            The list of ground stations.
        """
        self.groundStations = []
        for i in range(self.n_gs):
            s = random.random()*(SatelliteSim.CIRCUNFERENCE-SatelliteSim.GS_HALF_SIZE)
            self.groundStations.append((s, s+SatelliteSim.GS_HALF_SIZE))

    def initRandomTargets(self, amount):
        """
        Generate random targets.

        Args:
            amount: the number of targets to be generated.

        Returns:
            The list of targets.
        """
        targets = []
        for i in range(amount):
            s = random.randint(0+SatelliteSim.TARGET_HALF_SIZE, SatelliteSim.CIRCUNFERENCE-SatelliteSim.TARGET_HALF_SIZE)
            targets.append((s-SatelliteSim.TARGET_HALF_SIZE, s+SatelliteSim.TARGET_HALF_SIZE))
        return targets

    def get_state(self):
        """
        Get the current state of the satellite.
            
        Returns:
            The current state of the satellite.
        """
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
        """
        Convert time to angle.
            
        Args:
            time: the time to be converted.

        Returns:
            The angle corresponding to the time.
        """
        delta_t = time - math.floor(time/self.period) * self.period
        return self.velocity*delta_t
    
    def angle2time(self, angle):
        """
        Convert angle to time.
                
        Args:
            angle: the angle to be converted.

        Returns:
            The time corresponding to the angle.
        """
        T = self.orbit*self.period
        t = T + angle / self.velocity
        return t

    def set_seed(self, seed):
        """
        Set the seed of the random number generator.
            
        Args:
            seed: the seed to be set.
        """
        NewCase = True
        if seed is None:
            seed = np.random.randint(0, 2**32)
        else:
            seed = int(seed)
            NewCase = False
        seed = seed if seed is not None else np.random.randint(0, 2**32)
        np.random.seed(seed)
        random.seed(seed)
        self.seed = seed
        print("Sim Seed: ", self.seed)
        if NewCase:
            # Create Log folder
            if not os.path.exists(self.log_dir):
                os.makedirs(self.log_dir)
            with open(self.log_dir+"Seed.txt", "a") as f:
                f.write(f"Simulation_Seed: {self.seed}\n")