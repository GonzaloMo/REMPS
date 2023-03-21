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

import numpy as np
from SimpleSatellite.envs.simulation.Base import SatelliteSim_Base


class SatelliteSim(SatelliteSim_Base):

    def __init__(self, MAX_ORBITS: int=20, **kwargs):
        super().__init__(**kwargs)
        self.MAX_ORBITS = MAX_ORBITS

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
                if (self.check_light() > 0) and action_sent == "DN":
                    compMode = "PowerGenerationRate"
                else:
                    compMode = "NoGenRate"
            self.Power += self.POWER_CONSUMPTION[compMode]*self.dt
            if self.Power > 100.:
                self.Power = 100.
            elif self.Power < 0.:
                self.Power = 0.
                done = True

        # Check if simulation ends
        if self.orbit>=self.MAX_ORBITS:
            done = True
        state = self.get_state()
        return state, done

    def reset(self, seed: int =None) -> np.ndarray:
        return self.Base_reset(seed=seed)