"""
copyright © 2022
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
    # Remove done if run out of power
    def update(self, action):
        done = False
        self.Valid_action = False
        self.action_taken_list.append(action)
        self.check_visibility()
        # update time variables
        self.sim_time += self.dt
        self.pos += self.velocity*self.dt
        self.orbit_pos += self.velocity*self.dt
        self.satellite_busy_time -= self.dt

        # update orbit position
        if self.orbit_pos > SatelliteSim_Base.CIRCUNFERENCE:
            self.orbit_pos = self.orbit_pos - SatelliteSim_Base.CIRCUNFERENCE
            self.orbit += 1
            self.n_orbit_repeat = self.orbit%self.N_repeating_orbits
            self.update_ecplise()


        if self.pos > SatelliteSim_Base.CIRCUNFERENCE*self.N_repeating_orbits:
            self.pos -=  SatelliteSim_Base.CIRCUNFERENCE*self.N_repeating_orbits
            
        # update the satellite state
        if self.satellite_busy_time > 0:
            self.busy = 1
        else:
            if self.busy==1 or (self.satellite_busy_time + self.dt > 0 and self.satellite_busy_time <= 0):
                self.apply_effect()
                self.Taking_action = SatelliteSim_Base.ACTION_DO_NOTHING
                self.last_action = (0, None)
                self.Taking_action_tuple = (0, None)
            # take action
            self.busy = 0
            self.apply_action(action)
            

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
                
        self.update_coverage_list()   
        state = self.get_state()
        if self.orbit >= self.MAX_ORBITS:
            done = True
        
        return state, done

    def reset(self, seed: int =None) -> np.ndarray:
        return self.Base_reset(seed=seed)