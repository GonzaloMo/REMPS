######################################
## Simple Simulation of a Satellite ##
######################################
from SimpleSatellite.envs.simsat_v0 import Simple_satellite as Simple_satellite_v0

###########################################################
## Simple Simulation of a Satellite for an arbiter agent ##
###########################################################
# Version 0 only accepts the action with no image specification
from SimpleSatellite.envs.simsatArb_v0 import Simple_satellite_Arb_v0
# Version 1 accepts the action with the image specification
from SimpleSatellite.envs.simsatArb_v1 import Simple_satellite_Arb_v1

#########################################################
# Simple Simulation of a Satellite for a Planner agent ##
#########################################################
from SimpleSatellite.envs.simsatplan_v0 import Simple_satellite_Plan_v0
