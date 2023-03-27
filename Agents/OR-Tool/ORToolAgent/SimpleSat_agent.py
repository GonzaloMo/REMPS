from ORToolAgent.Base_agent import ORAgent_Base
import numpy as np
import math as m

class ORAgent(ORAgent_Base):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def observationHandler(self, obs):
        vectorLen = int(self.env.SatSim.period*self.env.SatSim.N_repeating_orbits/self.env.SatSim.dt)
        posIndex = self.__pos2Index(obs["Pos"])
        emptyVec = np.zeros((vectorLen,), dtype=np.int8)
        groundStation = self.__windows2Vector(obs['Ground Stations'], emptyVec, posIndex)
        targets = self.__windows2Vector(obs['Targets'], emptyVec, posIndex)
        lightCondition = self.__windows2Vector([obs['Eclipse'][0]], emptyVec, posIndex)
        obs = {
            "Ground Station Visibilty": groundStation,
            "Target Visibility": targets,
            "Light Condition": lightCondition
        }
        return obs 

    def __pos2time(self, pos):
        t = pos/self.env.SatSim.velocity
        return t
    
    def __pos2Index(self, pos, roundType="ceil"):
        t = self.__pos2time(pos)
        if roundType == "floor":
            return int(m.floor(t/self.env.SatSim.dt))
        else:
            return int(m.ceil(t/self.env.SatSim.dt))
            
    
    def __windows2Vector(self, windows, binaryVec, posIndex):
        for window in windows:
            initIndex = self.__pos2Index(window[0], roundType="ceil")
            endIndex = self.__pos2Index(window[1], roundType="floor")
            onesVec = np.ones((endIndex-initIndex,), dtype=np.int8)
            binaryVec[initIndex:endIndex] = onesVec
        correctedVec = np.concatenate([binaryVec[posIndex:],  binaryVec[:posIndex]], dtype=np.int8)
        return correctedVec

