"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
import math
from numpy import random
from typing import Dict, List, Tuple, Any
import numpy as np
import os
from copy import copy


class SatelliteSim:

    CIRCUNFERENCE = 360
    ACTION_THRESHOLD = 1

    MEMORY_SIZE = 10

    ACTIONS = [0, 1, 2, 3]
    ACTION_DO_NOTHING = 0
    ACTION_TAKE_IMAGE = 1
    ACTION_ANALYSE = 2
    ACTION_DUMP = 3
    ACTION_NAMES = ["DN","TP","AN","DP"]

    def __init__(self, 
                MAX_ORBITS: int=20, PERIOD: float=600, 
                MEMORY_SIZE: int=10,  
                Underterministic_actions: Dict[str, float]= {"TP": 0., "AN": 0., "DP": 0.}, 
                DURATION_TAKE_IMAGE: int=20, DURATION_DUMP: int=20, DURATION_ANALYSE: int=50, 
                Random_Targets: bool=True, Number_of_targets: int=4, TARGET_HALF_SIZE: float=5., 
                Random_GS: bool=False, GS_HALF_SIZE: float=20., Number_of_GS: int=2, 
                ACTION_THRESHOLD: int=1,
                CoverageFile: str="",
                Log_dir = "./Logs/Simulation/"):
        """
        Initialize the satellite simulation.

        Args:
            MAX_ORBITS: the maximum number of orbits to be simulated.
            period: the period of the orbit in seconds.

            MEMORY_SIZE: the size of the memory of the satellite.

            Underterministic_actions: the probability of not taking the action.
            DURATION_TAKE_IMAGE: the duration of the take image action in seconds.
            DURATION_DUMP: the duration of the dump action in seconds.
            DURATION_ANALYSE: the duration of the analyse action in seconds.

            Random_Targets: if the targets are generated randomly.
            Number_of_targets: the number of targets to be generated.
            TARGET_HALF_SIZE: the half size of the targets.

            Random_GS: if the ground stations are generated randomly.
            GS_HALF_SIZE: the half size of the ground stations.
            Number_of_GS: the number of ground stations to be generated.

            CoverageFile: the yaml file with the ground station coverage and targets.

            Log_dir: the directory where the logs are saved.
        """
        ############ Initialize the simulation parameters ############
        ## Satellite parameters ##
        # Postion variables
        self.pos = 0
        self.orbit = 0

        # memory state
        self.MEMORY_SIZE = MEMORY_SIZE
        self.memory_level = 0
        self.images = [0] * MEMORY_SIZE
        self.analysis = [False] * MEMORY_SIZE

        # Action variables
        self.busy = 0
        self.satellite_busy_time = 0
        self.last_action = 0
        self.DURATIONS = [0, DURATION_TAKE_IMAGE, DURATION_ANALYSE, DURATION_DUMP]
        self.DURATION_TAKE_IMAGE = DURATION_TAKE_IMAGE
        self.DURATION_DUMP = DURATION_DUMP
        self.DURATION_ANALYSE = DURATION_ANALYSE
        self.Underterministic_actions = Underterministic_actions

        ## Environment parameters ##
        self.MAX_ORBITS = MAX_ORBITS
        self.period = PERIOD
        self.sim_time = 0
        self.dt = PERIOD/SatelliteSim.CIRCUNFERENCE
        self.velocity = SatelliteSim.CIRCUNFERENCE/PERIOD

        # initialize logger
        if not os.path.exists(Log_dir):
            os.makedirs(Log_dir)
        self.log_dir = Log_dir
        
        
        # GS parameters
        self.n_gs = Number_of_GS
        self.Random_GS = Random_GS
        self.GS_HALF_SIZE = GS_HALF_SIZE
        self.groundStations = []
        
        # Targets
        self.random_targets = Random_Targets
        self.n_targets = Number_of_targets
        self.TARGET_HALF_SIZE = TARGET_HALF_SIZE
        self.targets = []
        self.CoverageFile = CoverageFile


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
        if self.orbit>=self.MAX_ORBITS:
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
                            # print(f"Image {index+1} sent by planner {img}")
                            if img == (index+1) or img == None:
                                self.satellite_busy_time = self.DURATION_TAKE_IMAGE
                                self.images[ind_mem] = index+1
                                self.analysis[ind_mem] = False
                                self.memory_level = min(self.MEMORY_SIZE, self.memory_level+1)
                                self.last_action = action
                                self.busy = 1
                                self.Taking_action = action
                                self.last_action_tuple = copy(self.action_tuple)
                                return
            
        # Analyse picture
        if action == SatelliteSim.ACTION_ANALYSE:
            self.satellite_busy_time = self.DURATION_ANALYSE
            self.busy = 1
            self.Taking_action = action
            
            for mem_slot in range(len(self.analysis)):
                if not self.analysis[mem_slot] and not(self.images[mem_slot] == 0):
                    # print(f"Analyse {self.images[mem_slot]} sent by planner {img}")
                    if img == self.images[mem_slot] or img == None:
                        self.analysis[mem_slot] = True
                        self.last_action = action
                        self.last_action_tuple = copy(self.action_tuple)
                        return
        
        # Dump picture
        if action == SatelliteSim.ACTION_DUMP:
            # check if it is above the ground station and if their is any analysed image
            if any([gs[0]-self.ACTION_THRESHOLD < self.pos < gs[1]+self.ACTION_THRESHOLD for gs in self.groundStations]) and any(self.analysis) :
                self.satellite_busy_time = self.DURATION_DUMP
                self.busy = 1
                self.Taking_action = action
                
                # Check if the image is analysed
                for mem_slot in range(self.MEMORY_SIZE-1, -1, -1):
                    if self.analysis[mem_slot]:
                        if img == None:
                            image_dumped = self.images[mem_slot]
                        elif self.images[mem_slot] == img:
                            image_dumped = img
                        else:
                            continue
                        # print(f"Dump {self.images[mem_slot]} sent by planner {img}")
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
                            if img == (index+1) or img == None:
                                return True

        if action == SatelliteSim.ACTION_ANALYSE:
            for index in range(len(self.analysis)):
                if not self.analysis[index] and not(self.images[index]== 0):
                    if img == self.images[index] or img == None:
                        return True

        if action == SatelliteSim.ACTION_DUMP:
            # check if it is above the ground station and if their is any analysed image
            if any([gs[0]-self.ACTION_THRESHOLD < self.pos < gs[1]+self.ACTION_THRESHOLD for gs in self.groundStations]):
                for mem_slot in range(self.MEMORY_SIZE-1, -1, -1):
                    if self.analysis[mem_slot]:
                        if img == None or self.images[mem_slot] == img:
                            return True
        return False

    def reset(self, n_targets: int =4, seed: int =None) -> np.ndarray:
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

        # Generate Targets
        self.targets = self.CoverageGenerator("Target_Coverage")
        self.target_list = []
        for i in range(self.n_targets):
            self.target_list.append(i+1)
                
        # Generate Ground Stations
        self.groundStations = self.CoverageGenerator("GroundStation_Coverage")

        return self.get_state()

    def CoverageGenerator(self, Type_Selection: str) -> List[Tuple[float, float]]:
        """
        Generate position brackets of sites.
            
        Returns:
            The list of min and max position for each site.
        """
        CoverageList = []
        if Type_Selection == "Target_Coverage":
            amount = self.n_targets
            random = self.random_targets
            half = self.TARGET_HALF_SIZE
        elif Type_Selection == "GroundStation_Coverage":
            amount = self.n_gs
            random = self.Random_GS
            half = self.GS_HALF_SIZE
        else:
            raise ValueError("Type_Selection must be either Target_Coverage or GroundStation_Coverage")
        # Generate the center of the sites
        if self.CoverageFile == "":
            centers = np.array([])
            if random:
                Centers_po = np.random.rand(amount)*SatelliteSim.CIRCUNFERENCE
            else: # Equidistant
                Centers_po = np.linspace(0, SatelliteSim.CIRCUNFERENCE, amount+2)[1:-1]
            # print("Centers_po", Centers_po)
            # for orb in range(0, self.MAX_ORBITS+1):
            #     centers = np.concatenate([centers, Centers_po + orb*SatelliteSim.CIRCUNFERENCE])
            centers = Centers_po
        else:
            import yaml
            with open(self.CoverageFile, 'r') as f:
                data = yaml.load(f, Loader=yaml.FullLoader)
                centers = np.array(data[Type_Selection])
        # Generate the brackets
        for Center in centers:
            min_pos = Center-half
            max_pos = Center+half
            CoverageList.append([min_pos, max_pos])
        return CoverageList

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
            with open(self.log_dir+"/Seed.yaml", "a") as f:
                f.write(f"    Simulation_Seed: {self.seed}\n")