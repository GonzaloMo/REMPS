"""
copyright © 2023
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
import numpy as np
from SimpleSatellite.envs.simulation.Base import SatelliteSim_Base


class SatelliteSim(SatelliteSim_Base):

    def __init__(self, MAX_ORBITS: int=20, **kwargs):
        super().__init__(**kwargs)
        self.MAX_ORBITS = MAX_ORBITS
        
    def update(self, action):
        state, done = self.Base_update(action)
        if self.orbit >= self.MAX_ORBITS:
            done = True
        return state, done

    def reset(self, seed: int =None) -> np.ndarray:
        return self.Base_reset(seed=seed)