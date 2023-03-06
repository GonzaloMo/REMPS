"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
import numpy as np
from SimpleSatellite.envs.simulation.Base import SatelliteSim_Base
class SatelliteSim(SatelliteSim_Base):

    def __init__(self, n_repeating_orbit: int=1, **kwargs):
        super().__init__(**kwargs)
        self.n_repeating_orbit = n_repeating_orbit
        
    def update(self, action):
        return self.Base_update(action)

    def reset(self, **kwargs) -> np.ndarray:
        return self.Base_reset(**kwargs)
    
    def setProblem(self):
        