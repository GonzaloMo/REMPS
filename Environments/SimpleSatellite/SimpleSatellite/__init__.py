import SimpleSatellite.envs
from gym.envs.registration import register 

# standard Simulation
register(id='SimpleSatellite-v0',entry_point='SimpleSatellite.envs:Simple_satellite_v0',)
register(id='SimpleSatellite-v1',entry_point='SimpleSatellite.envs:Simple_satellite_v1',) # Uses the new version of the gym API

# Set a list of golas
register(id='SimpleSatellite-setgoals-v0',entry_point='SimpleSatellite.envs:Simple_satellite_setgoals_v0',)
register(id='SimpleSatellite-setgoals-v1',entry_point='SimpleSatellite.envs:Simple_satellite_setgoals_v1',) # Adds eclipse to the observation space
register(id='SimpleSatellite-setgoals-v2',entry_point='SimpleSatellite.envs:Simple_satellite_setgoals_v2',) # sin and cos observation space
register(id='SimpleSatellite-setgoals_CV-v2',entry_point='SimpleSatellite.envs:Simple_satellite_setgoals_v2_cv',) 

# includes a planner agent
register(id='SimpleSatellite-planner-v0',entry_point='SimpleSatellite.envs:Simple_satellite_planner_v0',)
register(id='SimpleSatellite-planner-v1',entry_point='SimpleSatellite.envs:Simple_satellite_planner_v1',)

# randomly creates an opportunity just below the satellite
register(id='SimpleSatellite-opportunity-v1',entry_point='SimpleSatellite.envs:Simple_satellite_opportunity_v1',)
register(id='SimpleSatellite-opportunity-v2',entry_point='SimpleSatellite.envs:Simple_satellite_opportunity_v2',) # simplified observation space