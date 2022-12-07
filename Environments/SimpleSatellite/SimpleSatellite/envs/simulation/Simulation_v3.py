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
                Umbra: float=0., Penumbra: float=0., Light: float=1., ECLIPSE_OPTION: bool=False,
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
        self.last_action = (0, None)
        self.ACTION_THRESHOLD = ACTION_THRESHOLD
        self.DURATIONS = [0, DURATION_TAKE_IMAGE, DURATION_ANALYSE, DURATION_DUMP]
        self.DURATION_TAKE_IMAGE = DURATION_TAKE_IMAGE
        self.DURATION_DUMP = DURATION_DUMP
        self.DURATION_ANALYSE = DURATION_ANALYSE
        self.Underterministic_actions = Underterministic_actions

        # Power variables
        self.POWER_OPTION = POWER_OPTION
        self.POWER_CONSUMPTION = POWER_CONSUMPTION
        self.POWER_CONSUMPTION["NoGenRate"] = 0.
        self.Power = 50.

        ## Environment parameters ##
        self.MAX_ORBITS = MAX_ORBITS
        self.period = PERIOD
        self.sim_time = 0
        self.dt = PERIOD/SatelliteSim.CIRCUNFERENCE
        self.velocity = SatelliteSim.CIRCUNFERENCE/PERIOD

        # Eclipse variables
        self.ECLIPSE_OPTION = ECLIPSE_OPTION
        self.Umbra_percentage = Umbra
        self.Penumbra_percentage = Penumbra
        self.light_percentage = Light
        assert self.Umbra_percentage + 2*self.Penumbra_percentage + self.light_percentage == 1., "The sum of Light + Umbra + 2xPenumbra = 1."
        Light_width = 360*self.light_percentage
        Umbra_width = 360*self.Umbra_percentage
        Penumbra_width = 360*self.Penumbra_percentage
        self.light_range = [0, Light_width]
        self.penumbre_range = [[Light_width, Light_width + Penumbra_width], [360-Penumbra_width, 360]]
        self.umbra_range = [Light_width + Penumbra_width, 360-Penumbra_width]

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

        # Failures
        self.Failures = {
                        "No Action Taken": [
                            # Take Picture
                            "Not above target",
                            "Memory full",
                            "Not in light",
                            # Analyse
                            "No image to analyse",
                            # Dump
                            "No image to dump",
                            "Not above GS",
                            # Other
                            "Satellite busy"],
                        "Action taken": ["Not enough power"]}


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
        self.action_taken_list.append(action)
        # update time variables
        self.sim_time += self.dt
        self.pos += self.velocity*self.dt
        self.satellite_busy_time -= self.dt

        # update orbit position
        if self.pos > SatelliteSim.CIRCUNFERENCE:
            self.pos -= SatelliteSim.CIRCUNFERENCE
            self.orbit += 1

        # take action
        self.apply_action(action)

        # update the satellite state
        if self.satellite_busy_time > 0:
            self.busy = 1
        else:
            if self.busy==1:
                self.apply_effect()
                self.Taking_action = SatelliteSim.ACTION_DO_NOTHING
            self.busy = 0
            
        # Power update
        if self.POWER_OPTION:
            compMode = SatelliteSim.ACTION_NAMES[self.Taking_action]
            action_sent = SatelliteSim.ACTION_NAMES[action[0]]
            if compMode == "DN":
                if (self.light_range[0] <= self.pos <= self.light_range[1]) and action_sent == "DN":
                    compMode = "PowerGenerationRate"
                else:
                    compMode = "NoGenRate"
            self.Power += self.POWER_CONSUMPTION[compMode]*self.dt
            if self.Power > 100.:
                self.Power = 100.
            elif self.Power < 0.:
                self.Power = 0.
                done = True
        state = self.get_state()
        return state, done
        

    def apply_action(self, action_in): 
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
        if action==SatelliteSim.ACTION_DO_NOTHING or action==None:
            return
        check, add_info = self.check_action(action, img)
        if not check and add_info in self.Failures["No Action Taken"]:
            return
        else:
            # take action
            self.last_action = (action, add_info)
            self.satellite_busy_time = self.DURATIONS[action]
            self.Taking_action = action
            self.busy = 1
            return
            
    def apply_effect(self):
        action, add_info = self.last_action
        if not isinstance(add_info,str): 
            # Take picture action
            if action == SatelliteSim.ACTION_TAKE_IMAGE:
                # Check free location in the memory
                if self.Underterministic_actions["TP"] < np.random.rand():
                    for i in range(len(self.images)):
                        if self.images[i] == 0:
                            self.images[i] = add_info
                            self.analysis[i] = False
                            self.memory_level = self.memory_level+1
                            return
                
            # Analyse picture
            if action == SatelliteSim.ACTION_ANALYSE:
                if self.Underterministic_actions["AN"] < np.random.rand():
                    self.analysis[add_info] = True
                    self.last_action = action
                    return
            
            # Dump picture
            if action == SatelliteSim.ACTION_DUMP:
                self.n_images_dumped[self.images[add_info]-1] += 1
                self.images[add_info] = 0
                self.analysis[add_info] = False
                self.memory_level = max(0,self.memory_level-1)
                return
            self.last_action = 0, ""


    def check_action(self, action, img):
        """
        Check if the action is posible.

        Args:
            action: the action to be taken.

        Returns:
            True if the action is posible.
        """
        if self.busy==1:
            return False, "Satellite busy"        
        # Take picture
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Check which target the satellite is above 
            above_target = None
            if img == None:
                check = False
                for index in range(len(self.targets)):
                    if self.targets[index][0] < self.pos < self.targets[index][1]:
                        check = True
                        above_target = index+1
                        break
                if not check:
                    return False, "Not above target"
            else:
                if not (self.targets[img-1][0] < self.pos < self.targets[img-1][1]):
                    return False, "Not above target"
                else:
                    above_target = img
 
            # Check Power
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["TP"]*self.DURATION_TAKE_IMAGE):
                return False, "Not enough power"

            # Check free location in the memory
            if self.memory_level+1 > self.MEMORY_SIZE:
                return False, "Memory full"

            # Check if the satellite is in light
            if not(self.light_range[0] < self.pos < self.light_range[1]) and self.ECLIPSE_OPTION:
                return False, "Not in light"
            
            # return True if all the conditions are met
            return True, above_target
                      
        # Analyse picture
        if action == SatelliteSim.ACTION_ANALYSE:
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["AN"]*self.DURATION_ANALYSE):
                return False, "Not enough power"
            if img == None:
                try:
                    mem_slot = self.analysis.index(False)
                    if self.images[mem_slot] == 0:
                        return False, "No image to analyse"
                except:
                    return False, "No image to analyse"
            else:
                mem_slot = None
                for i in range(len(self.images)):
                    if self.images[i] == img and not self.analysis[i]:
                        mem_slot = i
                        break
                if mem_slot == None:
                    return False, "No image to analyse"
            
            # return True if all the conditions are met
            return True, mem_slot
                
        # Dump picture
        if action == SatelliteSim.ACTION_DUMP:                   
            # check if it is above the ground station
            if any([gs[0]-self.ACTION_THRESHOLD < self.pos < gs[1]+self.ACTION_THRESHOLD for gs in self.groundStations]):
                pass
            else:
                return False, "Not above GS" 

            # Check if the image is analysed
            if img == None:
                try:
                    mem_slot = self.analysis.index(True)
                except:
                    return False, "No image to dump"
            else:
                mem_slot = None
                for i in range(len(self.images)):
                    if self.images[i] == img and self.analysis[i]:
                        mem_slot = i
                        break
                if mem_slot == None:
                    return False, "No image to dump"

            # Check Power 
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["DP"]*self.DURATION_DUMP):
                return False, "Not enough power"

            # return True if all the conditions are met and the image to be dumped
            return True, mem_slot
        
        return True, ""

    def reset(self, seed: int =None) -> np.ndarray:
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
        self.last_action = 0
        self.Taking_action = 0
        self.n_images_dumped = [0] * self.n_targets
        self.action_taken_list = [0]

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
            upper_lim = SatelliteSim.CIRCUNFERENCE*self.light_percentage-half
        elif Type_Selection == "GroundStation_Coverage":
            amount = self.n_gs
            random = self.Random_GS
            half = self.GS_HALF_SIZE
            upper_lim = SatelliteSim.CIRCUNFERENCE-half
        else:
            raise ValueError("Type_Selection must be either Target_Coverage or GroundStation_Coverage")
        # Generate the center of the sites
        if self.CoverageFile == "":
            centers = np.array([])
            if random:
                Centers_po = np.random.rand(amount)*upper_lim
            else: # Equidistant
                Centers_po = np.linspace(half, upper_lim, amount)
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
                'Ground Stations': self.groundStations,
                'Eclipse': self.light_range + self.umbra_range}
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
        self.seed = seed
        np.random.seed(seed)
        random.seed(seed)
        self.seed = seed
        if NewCase:
            # Create Log folder
            if not os.path.exists(self.log_dir):
                os.makedirs(self.log_dir)
            with open(self.log_dir+f"/Seed.yaml", "a") as f:
                f.write(f"    {self.Sim_name}: {self.seed}\n")