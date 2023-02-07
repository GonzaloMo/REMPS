"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
import numpy as np
from SimpleSatellite.envs.simulation.Base import SatelliteSim_Base
class SatelliteSim(SatelliteSim_Base):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
    def update(self, action):
        return self.Base_update(action)

    def reset(self, **kwargs) -> np.ndarray:
        return self.Base_reset(**kwargs)
    
