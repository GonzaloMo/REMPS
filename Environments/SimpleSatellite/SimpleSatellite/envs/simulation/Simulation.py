"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
import math
from numpy import random
from typing import Dict, List, Tuple, Any
from datetime import datetime
import numpy as np
import os
from copy import copy


class SatelliteSim:

    CIRCUNFERENCE = 360

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
                POWER_OPTION: bool=False,
                POWER_CONSUMPTION: Dict[str, float]={"TP": 0.1, "AN": 0.1, "DP": 0.1, "PowerGenerationRate": 1.},
                ACTION_THRESHOLD: float=1,
                CoverageFile: str="",
                Log_dir = "./Logs/Simulation/"):
        """
        Initialize the satellite simulation.

        Args:
            MAX_ORBITS: Maximum number of orbits to be simulated.
            PERIOD: Period of the orbit.
            MEMORY_SIZE: Size of the memory.
            Underterministic_actions: Dictionary with the probability of each action to be underterministic.
            DURATION_TAKE_IMAGE: Duration of the take image action.
            DURATION_DUMP: Duration of the dump action.
            DURATION_ANALYSE: Duration of the analyse action.
            Random_Targets: If True, the targets will be randomly generated.
            Number_of_targets: Number of targets to be generated.
            TARGET_HALF_SIZE: Half size of the targets.
            Random_GS: If True, the ground stations will be randomly generated.
            GS_HALF_SIZE: Half size of the ground stations.
            Number_of_GS: Number of ground stations to be generated.
            POWER_OPTION: If True, the power of the satellite will be taken into account.
            POWER_CONSUMPTION: Dictionary with the power consumption of each action.
            ACTION_THRESHOLD: Threshold to consider an action as taken.
            CoverageFile: File with the coverage of the targets and ground stations.
            Log_dir: Directory to save the logs.
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
        self.ACTION_THRESHOLD = ACTION_THRESHOLD
        self.DURATIONS = [0, DURATION_TAKE_IMAGE, DURATION_ANALYSE, DURATION_DUMP]
        self.DURATION_TAKE_IMAGE = DURATION_TAKE_IMAGE
        self.DURATION_DUMP = DURATION_DUMP
        self.DURATION_ANALYSE = DURATION_ANALYSE
        self.Underterministic_actions = Underterministic_actions

        # Power variables
        self.POWER_OPTION = POWER_OPTION
        self.POWER_CONSUMPTION = POWER_CONSUMPTION
        self.Power = 50.

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

        # take action
        self.apply_action_int(action)

        # Power update
        if self.POWER_OPTION:
            compMode = SatelliteSim.ACTION_NAMES[self.Taking_action]
            if compMode == "DN":
                compMode = "PowerGenerationRate"
            self.Power += self.POWER_CONSUMPTION[compMode]*self.dt
            if self.Power > 100.:
                self.Power = 100.
            elif self.Power < 0.:
                self.Power = 0.
                done = True
        state = self.get_state()
        return state, done
        

    def apply_action_int(self, action_in): 
        """
        Apply the action to the satellite.

        Args:
            action: the action to be taken. 
        """
        if len(action_in) == 1:
            action = action_in
            img = None
        else:
            action, img = action_in

        self.action = action
        self.action_tuple = (action, img)
        # check if busy or the satellite does nothing 
        if self.satellite_busy_time > 0:
            return 
        if action==SatelliteSim.ACTION_DO_NOTHING or action==None:
            return
        # Take picture action
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["TP"]*self.DURATION_TAKE_IMAGE):
                return
            # Check free location in the memory
            for ind_mem in range(len(self.images)):
                if self.images[ind_mem] == 0:
                    # Check which target the satellite is above 
                    for index in range(len(self.targets)):
                        if self.targets[index][0] < self.pos < self.targets[index][1]:
                            # print(f"Image {index+1} sent by planner {img}")
                            if img == (index+1) or img == None:

                                if self.Underterministic_actions["TP"] < np.random.rand():
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
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["AN"]*self.DURATION_ANALYSE):
                return
            self.satellite_busy_time = self.DURATION_ANALYSE
            self.busy = 1
            self.Taking_action = action
            if self.Underterministic_actions["AN"] < np.random.rand():
                for mem_slot in range(len(self.analysis)):
                    if not self.analysis[mem_slot] and not(self.images[mem_slot] == 0):
                        if img == self.images[mem_slot] or img == None:
                            self.analysis[mem_slot] = True
                            self.last_action = action
                            self.last_action_tuple = copy(self.action_tuple)
                            if self.POWER_OPTION:
                                self.Power -= self.POWER_CONSUMPTION["AN"]
                            return
        
        # Dump picture
        if action == SatelliteSim.ACTION_DUMP:
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["DP"]*self.DURATION_DUMP):
                return
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
                        self.memory_level = max(0,self.memory_level-1)
                        self.last_action = action
                        self.last_action_tuple = copy(self.action_tuple)
                        if self.POWER_OPTION:
                            self.Power -= self.POWER_CONSUMPTION["DP"]
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
        if len(action_in) == 1:
            action = action_in
            img = None
        else:
            action, img = action_in

        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["TP"]*self.DURATION_TAKE_IMAGE):
                return
            # Check free location in the memory
            for ind_mem in range(len(self.images)):
                if self.images[ind_mem] == 0:
                    # Check which target the satellite is above 
                    for index in range(len(self.targets)):
                        if self.targets[index][0] < self.pos < self.targets[index][1]:
                            # print(f"Image {index+1} sent by planner {img}")
                            if img == (index+1) or img == None:
                                return True
            
        # Analyse picture
        if action == SatelliteSim.ACTION_ANALYSE:
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["AN"]*self.DURATION_ANALYSE):
                return
            for mem_slot in range(len(self.analysis)):
                if not self.analysis[mem_slot] and not(self.images[mem_slot] == 0):
                    if img == self.images[mem_slot] or img == None:
                        return True
        
        # Dump picture
        if action == SatelliteSim.ACTION_DUMP:
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["DP"]*self.DURATION_DUMP):
                return
            # check if it is above the ground station and if their is any analysed image
            if any([gs[0]-self.ACTION_THRESHOLD < self.pos < gs[1]+self.ACTION_THRESHOLD for gs in self.groundStations]) and any(self.analysis) :
                # Check if the image is analysed
                for mem_slot in range(self.MEMORY_SIZE-1, -1, -1):
                    if self.analysis[mem_slot]:
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
        date = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
        self.Sim_name = f"Sim_{date}"
        self.set_seed(seed=seed)

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = 3
        

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
        if self.POWER_OPTION:
            self.Power = 100.

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
            min_pos = max(Center-half, 0)
            max_pos = min(Center+half, 360)
            CoverageList.append([min_pos, max_pos])
        return CoverageList

    def get_state(self):
        """
        Get the current state of the satellite.
            
        Returns:
            The current state of the satellite.
        """
        obs = {'Orbit': self.orbit, 
                'Pos': self.pos,
                'Busy': self.busy,
                'Memory Level': self.memory_level,
                'Images': self.images,
                'Analysis': self.analysis,
                'Targets': self.targets,
                'Ground Stations': self.groundStations}
        if self.POWER_OPTION:
            obs['Power'] = self.Power
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
        if NewCase:
            # Create Log folder
            if not os.path.exists(self.log_dir):
                os.makedirs(self.log_dir)
            with open(self.log_dir+f"/Seed.yaml", "a") as f:
                f.write(f"    {self.Sim_name}: {self.seed}\n")