import SimpleSatellite.envs
from gym.envs.registration import register 
# uses old version of gym API
register(id='SimpleSatellite-v0',entry_point='SimpleSatellite.envs:Simple_satellite_v0',)

# uses new version of gym API
register(id='SimpleSatellite-v1',entry_point='SimpleSatellite.envs:Simple_satellite_v1',)
register(id='SimpleSatelliteArb-v0',entry_point='SimpleSatellite.envs:Simple_satellite_Arb_v0',) 
register(id='SimpleSatelliteArb-v1',entry_point='SimpleSatellite.envs:Simple_satellite_Arb_v1',) 
register(id='SimpleSatellitePlanner-v0',entry_point='SimpleSatellite.envs:Simple_satellite_Plan_v0',) 
