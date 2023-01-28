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


class SatelliteSim_Base:

    CIRCUNFERENCE = 360

    ACTIONS = [0, 1, 2, 3]
    ACTION_DO_NOTHING = 0
    ACTION_TAKE_IMAGE = 1
    ACTION_ANALYSE = 2
    ACTION_DUMP = 3
    ACTION_NAMES = ["DN","TP","AN","DP"]

    def __init__(self, 
                PERIOD: float=600, 
                MEMORY_SIZE: int=10,  
                Underterministic_actions: Dict[str, float]= {"TP": 0., "AN": 0., "DP": 0.}, 
                DURATION_TAKE_IMAGE: int=20, DURATION_DUMP: int=20, DURATION_ANALYSE: int=50, 
                Random_Targets: bool=True, Number_of_targets: int=4, TARGET_HALF_SIZE: float=5., 
                Opportunity_Prob: float=0., Opportunity_duration: float=10,
                Random_GS: bool=False, GS_HALF_SIZE: float=20., Number_of_GS: int=2, 
                POWER_OPTION: bool=True,
                POWER_CONSUMPTION: Dict[str, float]={"TP": 0.1, "AN": 0.1, "DP": 0.1, "PowerGenerationRate": 1.},
                ACTION_THRESHOLD: float=1,
                Umbra: float=0., Penumbra: float=0., Light: float=1., ECLIPSE_OPTION: bool=True,
                CoverageFile: str="",
                Log_dir = "./Logs/Simulation/"):
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
        self.period = PERIOD
        self.sim_time = 0
        self.dt = PERIOD/SatelliteSim_Base.CIRCUNFERENCE
        self.velocity = SatelliteSim_Base.CIRCUNFERENCE/PERIOD

        # Eclipse variables
        self.ECLIPSE_OPTION = ECLIPSE_OPTION
        self.Umbra_percentage = Umbra
        self.Penumbra_percentage = Penumbra
        self.light_percentage = Light
        assert self.Umbra_percentage + 2*self.Penumbra_percentage + self.light_percentage == 1., "The sum of Light + Umbra + 2xPenumbra = 1."
        Light_width = 360*self.light_percentage
        Umbra_width = 360*self.Umbra_percentage
        Penumbra_width = 360*self.Penumbra_percentage
        self.light_range = [[0, Light_width]]
        self.penumbre_range = [[Light_width, Light_width + Penumbra_width], [360-Penumbra_width, 360]]
        self.umbra_range = [[Light_width + Penumbra_width, 360-Penumbra_width]]

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

        # Oppurtunity
        self.opportunity = False
        self.opportunity_time = 0
        self.opportunity_duration = Opportunity_duration
        self.opportunity_probability = Opportunity_Prob


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


    def Base_update(self, action):
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
        if self.pos > SatelliteSim_Base.CIRCUNFERENCE:
            self.pos -=  SatelliteSim_Base.CIRCUNFERENCE
            self.orbit += 1

        # take action
        self.apply_action(action)

        # update the satellite state
        if self.satellite_busy_time > 0:
            self.busy = 1
        else:
            if self.busy==1:
                self.apply_effect()
                self.Taking_action = SatelliteSim_Base.ACTION_DO_NOTHING
            self.busy = 0

        # Power update
        if self.POWER_OPTION:
            compMode = SatelliteSim_Base.ACTION_NAMES[self.Taking_action]
            if compMode == "DN" :
                if (self.check_light() > 0):
                    compMode = "PowerGenerationRate"
                else:
                    compMode = "NoGenRate"
            self.Power += self.POWER_CONSUMPTION[compMode]*self.dt
            if self.Power > 100.:
                self.Power = 100.
            elif self.Power < 0.:
                self.Power = 0.
                done = True

        # Opportunity update
        if self.opportunity:
            if self.opportunity_time > 0:
                self.opportunity_time -= self.dt
            else:
                self.opportunity = False
        else:
            if np.random.rand() <= self.opportunity_probability:
                self.opportunity = True
                self.opportunity_time = self.opportunity_duration

        state = self.get_state()
        return state, done    

    def Base_reset(self, seed: int =None) -> np.ndarray:
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
            upper_lim = SatelliteSim_Base.CIRCUNFERENCE*self.light_percentage-half
            endpoint = True
        elif Type_Selection == "GroundStation_Coverage":
            amount = self.n_gs
            random = self.Random_GS
            half = self.GS_HALF_SIZE
            upper_lim = SatelliteSim_Base.CIRCUNFERENCE
            endpoint = False
        else:
            raise ValueError("Type_Selection must be either Target_Coverage or GroundStation_Coverage")
        # Generate the center of the sites
        if self.CoverageFile == "":
            centers = np.array([])
            if random:
                Centers_po = np.random.rand(amount)*upper_lim
            else: # Equidistant
                Centers_po = np.linspace(half, upper_lim, amount, endpoint=endpoint)
            centers = Centers_po
        else:
            import yaml
            with open(self.CoverageFile, 'r') as f:
                data = yaml.load(f, Loader=yaml.FullLoader)
                centers = np.array(data[Type_Selection])
        # Generate the brackets
        for Center in centers:
            add_to_max, add_to_min = 0, 0
            min_pos = Center-half
            max_pos = Center+half
            if min_pos < 0:
                min_pos = 0
                add_to_max = abs(Center-half)
            if Center+half > SatelliteSim_Base.CIRCUNFERENCE:
                max_pos = SatelliteSim_Base.CIRCUNFERENCE
                add_to_min = Center+half-SatelliteSim_Base.CIRCUNFERENCE
            min_pos -= add_to_min
            max_pos += add_to_max
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
                'Eclipse': self.light_range + self.umbra_range,
                'Opportunity': self.opportunity,}
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
        if action==SatelliteSim_Base.ACTION_DO_NOTHING or action==None:
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
            if action == SatelliteSim_Base.ACTION_TAKE_IMAGE:
                # Check free location in the memory
                if self.Underterministic_actions["TP"] < np.random.rand():
                    for i in range(len(self.images)):
                        if self.images[i] == 0:
                            self.images[i] = add_info
                            self.analysis[i] = False
                            self.memory_level = self.memory_level+1
                            return
                
            # Analyse picture
            if action == SatelliteSim_Base.ACTION_ANALYSE:
                if self.Underterministic_actions["AN"] < np.random.rand():
                    self.analysis[add_info] = True
                    self.last_action = action
                    return
            
            # Dump picture
            if action == SatelliteSim_Base.ACTION_DUMP:
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
        if action == SatelliteSim_Base.ACTION_TAKE_IMAGE:
            # Check which target the satellite is above 
            above_target = None
            
            if img == None:
                check = False
                for index in range(len(self.targets)):
                    if self.targets[index][0] < self.pos < self.targets[index][1]:
                        check = True
                        above_target = index+1
                        break
                if not check and self.opportunity:
                    above_target = "O"
                    check = True
                if not check:
                    return False, "Not above target"
            else:
                if not (self.targets[img-1][0] < self.pos < self.targets[img-1][1]):
                    return False, "Not above target"
                else:
                    above_target = img

            if self.opportunity:
                above_target = "O"
 
            # Check Power
            if self.POWER_OPTION and self.Power < abs(self.POWER_CONSUMPTION["TP"]*self.DURATION_TAKE_IMAGE):
                return False, "Not enough power"

            # Check free location in the memory
            if self.memory_level+1 > self.MEMORY_SIZE:
                return False, "Memory full"

            # Check if the satellite is in light
            if self.check_light() < 1 and self.ECLIPSE_OPTION:
                return False, "Not in light"
            
            # return True if all the conditions are met
            return True, above_target
                      
        # Analyse picture
        if action == SatelliteSim_Base.ACTION_ANALYSE:
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
        if action == SatelliteSim_Base.ACTION_DUMP:                   
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

    
    def check_light(self):
        """
        Check if the satellite is in light

        Returns:
            int: 1 if the satellite is in light, 0 if the satellite is in penumbra and, -1 if the satellite is in eclipse.
        """
        for index in range(len(self.light_range)):
            if self.light_range[index][0] < self.pos < self.light_range[index][1]:
                return 1
        for index in range(len(self.penumbre_range)):
            if self.penumbre_range[index][0] < self.pos < self.penumbre_range[index][1]:
                return 0
        return -1

    def check_availablility(self):
        """
        Check if the satellite is above a target or ground station

        Returns:
            Tuple[List[bool], List[bool]]: Tuple of two lists, the first one is a list of bools that indicates if the satellite is above a target, the second one is a list of bools that indicates if the satellite is above a ground station.
        """
        above_target = [False] * self.n_targets
        above_gs = [False] * len(self.groundStations)
        for index in range(len(self.targets)):
            if self.targets[index][0] < self.pos < self.targets[index][1]:
                above_target[index] = True
        for index in range(len(self.groundStations)):
            if self.groundStations[index][0] < self.pos < self.groundStations[index][1]:
                above_gs[index] = True
        return above_target, above_gs
    
    def check_time_to_availability(self):
        """
        Check the time to the next availability of the satellite

        Returns:
            Tuple[float, float]: Tuple of two floats, the first one is the time to the next target, the second one is the time to the next ground station.
        """
        time_to_target = [0] * self.n_targets
        time_to_gs = [0] * len(self.groundStations)
        for index in range(len(self.targets)):
            if self.pos < self.targets[index][0]:
                time_to_target[index] = (self.targets[index][0] - self.pos)/self.velocity
            else:
                time_to_target[index] = (self.orbit - self.pos + self.targets[index][0])/self.velocity
                
        for index in range(len(self.groundStations)):
            if self.pos < self.groundStations[index][0]:
                time_to_gs[index] = (self.groundStations[index][0] - self.pos)/self.velocity
            else:
                time_to_gs[index] = (self.orbit - self.pos + self.groundStations[index][0])/self.velocity

        return time_to_target, time_to_gs