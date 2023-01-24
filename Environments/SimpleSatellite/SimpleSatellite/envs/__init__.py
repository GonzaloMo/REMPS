######################################
## Simple Simulation of a Satellite ##
######################################
from SimpleSatellite.envs.simsat_v0 import Simple_satellite as Simple_satellite_v0
from SimpleSatellite.envs.simsat_v1 import Simple_satellite as Simple_satellite_v1



################################
## Simple Satellite Set Goals ##
################################
from SimpleSatellite.envs.setgoals.v0 import Simple_satellite as Simple_satellite_setgoals_v0
from SimpleSatellite.envs.setgoals.v1 import Simple_satellite as Simple_satellite_setgoals_v1
from SimpleSatellite.envs.setgoals.v2 import Simple_satellite as Simple_satellite_setgoals_v2

#####################################################
## Simple Simulation of a Satellite with a Planner ##
#####################################################
from SimpleSatellite.envs.planner.v1 import Simple_satellite as Simple_satellite_planner_v1

###########################################################
## Simple Simulation of a Satellite for an arbiter agent ##
###########################################################
# Version 0 only accepts the action with no image specification
from SimpleSatellite.envs.Arbiter.v0 import Simple_satellite_Arb_v0
# Version 1 accepts the action with the image specification
from SimpleSatellite.envs.Arbiter.v1 import Simple_satellite_Arb_v1


###############################################
## Simple Satellite with Opportunity Creation ##
###############################################
from SimpleSatellite.envs.opportunity.v1 import Simple_satellite as Simple_satellite_opportunity_v1
from SimpleSatellite.envs.opportunity.v2 import Simple_satellite as Simple_satellite_opportunity_v2
