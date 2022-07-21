from SimpleSatellite.envs.simulation.Utils import BaseVoice
from ArbiterVoices.utils import Action

class Full_memory(BaseVoice):
    def __init__(self, SatSim, name="Full_memory"):
        super().__init__(name=name)
        self.SatSim = SatSim
        self.Action_doNothing = Action(SatSim.ACTION_DO_NOTHING, name, -100)
    
    def getAction(self, obs, epsilon=1):
        if obs["Memory Level"] <= self.SatSim.MEMORY_SIZE or obs["Busy"] == 1:
            return self.Action_doNothing
        else:
            pos = obs["Pos"]
            above_gs = False
            # Check if the satellite is above the ground station
            for gs in obs["Ground Stations"]:
                if gs[0] < pos < gs[1]:
                    above_gs = True
            
            # If the satellite is above the ground station, try to dump analyzed images
            if above_gs:
                for i, img in reversed(list(enumerate(obs["Images"]))):
                    if obs["Analysis"][i]:
                        a = Action(self.SatSim.ACTION_DUMP, self.name, pos)
                        a.set_action_tuple(self.SatSim.ACTION_DUMP, img)
                        return a
            # If the satellite is not above the ground station, try to analyze images
            for i, img in reversed(list(enumerate(obs["Images"]))):
                if not obs["Analysis"][i]:
                    a = Action(self.SatSim.ACTION_ANALYSE, self.name, pos)
                    a.set_action_tuple(self.SatSim.ACTION_ANALYSE, img)
                    return a
            return self.Action_doNothing