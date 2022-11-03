import SimpleSatellite.envs
from gym.envs.registration import register 
# uses old version of gym API
register(id='SimpleSatellite-v0',entry_point='SimpleSatellite.envs:Simple_satellite_v0',)
register(id='SimpleSatellite-v1',entry_point='SimpleSatellite.envs:Simple_satellite_v1',) # Uses the new version of the gym API
register(id='SimpleSatellite-setgoals-v0',entry_point='SimpleSatellite.envs:Simple_satellite_setgoals_v0',)
register(id='SimpleSatellite-planner-v0',entry_point='SimpleSatellite.envs:Simple_satellite_planner_v0',)
register(id='SimpleSatellite-Arb-v0',entry_point='SimpleSatellite.envs:Simple_satellite_Arb_v0',)
register(id='SimpleSatellite-Arb-v1',entry_point='SimpleSatellite.envs:Simple_satellite_Arb_v1',)
register(id='SimpleSatellite-Plan-v0',entry_point='SimpleSatellite.envs:Simple_satellite_Plan_v0',)