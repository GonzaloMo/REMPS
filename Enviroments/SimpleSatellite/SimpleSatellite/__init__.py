import SimpleSatellite.envs
from gym.envs.registration import register 
register(id='SimpleSatellite-v0',entry_point='SimpleSatellite.envs:Simple_satellite_v0',) 