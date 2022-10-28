from SimpleSatellite.envs.simulation.Simulation import SatelliteSim

def Reward_v0(env: SatelliteSim, action_in: int):
    # Get action and observation
    obs = env.state
    action, img = env.Number2Tuple_action(action_in)
    reward = 0
    # Reward for dumping a picture
    if env.SatSim.check_action((action,img)):
        if action == SatelliteSim.ACTION_DUMP :
            reward += 100
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            reward += 1
        if action == SatelliteSim.ACTION_ANALYSE:
            reward += 2
    
    
    if env.SatSim.POWER_OPTION:
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 10
        # Penalize for more than 99% of power
        elif obs["Power"] > 99.:
            reward -= .1
        else:
            reward += .001

    return reward

def Reward_v1(env: SatelliteSim, action_in: int):
    # Get action and observation
    obs = env.state
    action, img = env.Number2Tuple_action(action_in)
    reward = 0
    # Reward for dumping a picture
    if env.SatSim.check_action((action,img)):
        if action == SatelliteSim.ACTION_DUMP :
            reward += 100
        elif action == SatelliteSim.ACTION_DO_NOTHING:
            reward -=.1
    
    
    
    if env.SatSim.POWER_OPTION:
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 10
        # Penalize for more than 99% of power
        elif obs["Power"] > 99.:
            reward -= .01

    return reward

def Reward_v2(env: SatelliteSim, action_in: int):
    # Get action and observation
    obs = env.state
    action, img = env.Number2Tuple_action(action_in)
    reward = 0
    action_Dump = SatelliteSim.ACTION_DUMP
    action_TakeImage = SatelliteSim.ACTION_TAKE_IMAGE
    action_Analyse = SatelliteSim.ACTION_ANALYSE
    action_IDLE = SatelliteSim.ACTION_DO_NOTHING
    # Reward for dumping a picture
    if env.SatSim.check_action((action,img)):
        if action == SatelliteSim.action_Dump :
            reward += 100
    else:
        if not env.SatSim.POWER_OPTION:
            if action == SatelliteSim.ACTION_DO_NOTHING :
                if (env.SatSim.check_action((action_Dump,None))
                    and env.SatSim.check_action((action_TakeImage,None)) 
                    and env.SatSim.check_action((action_Analyse,None))):
                        reward -= 1
    
    
    
    if env.SatSim.POWER_OPTION:
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 10
        # Penalize for more than 99% of power
        elif obs["Power"] > 99.:
            reward -= .1
        else:
            reward += .001

    return reward