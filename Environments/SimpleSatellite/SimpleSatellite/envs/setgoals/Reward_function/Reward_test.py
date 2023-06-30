from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
from typing import Dict, List, Tuple, Union
from copy import deepcopy
import gym
import numpy as np

def Reward_test(env: gym.Env, action_in: Tuple[int,int]):
    action, img = action_in
    check_action, _ = env.SatSim.check_action(action,img)
    reward = 0
    init_goals = env.initial_goals
    goals_after_action = deepcopy(env.goals)
    # All goals achieved terminate episode
    if check_action:
        if action == SatelliteSim.ACTION_DUMP:
            # check if all goals are achieved
            goals_after_action[img-1] -=1
            if np.sum(goals_after_action) == 0:
                done = True
    # Max orbits reached terminate episode
    pos = env.SatSim.orbit_pos + env.SatSim.velocity*env.SatSim.dt
    if pos > env.SatSim.CIRCUNFERENCE:   
        if env.SatSim.orbit + 1 >= env.SatSim.MAX_ORBITS:
            done = True

    # Check Power level
    if env.SatSim.POWER_OPTION:
        sim = deepcopy(env.SatSim)
        Power = deepcopy(sim.Power)
        compMode = sim.ACTION_NAMES[sim.Taking_action]
        if compMode == "DN" :
            if (sim.check_light() > 0):
                compMode = "PowerGenerationRate"
            else:
                compMode = "NoGenRate"
        Power += sim.POWER_CONSUMPTION[compMode]*sim.dt
        if Power < 0:
            return -10

    if done:
        reward += np.sum(goals_after_action)/np.sum(init_goals)
    return reward