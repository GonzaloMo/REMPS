from SimpleSatellite.envs.simulation.Utils import BaseVoice

class RandomChoice(BaseVoice):
    def __init__(self):
        super(RandomChoice).__init__(name="RandomChoice")
    
    def getAction(self, obs) -> int:
        return super().getAction(obs)
    
    def get_obs(self, obs):
        return super().get_obs(obs)