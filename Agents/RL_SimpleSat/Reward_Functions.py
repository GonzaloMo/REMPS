from SimpleSatellite.envs.simulation.Simulation import SatelliteSim

def Reward_v0(env: SatelliteSim, action_in: int):
    # Get action and observation
    obs = env.state
    action, img = env.Number2Tuple_action(action_in)
    reward = 0
    # Reward for dumping a picture
    if env.SatSim.check_action((action, img)):
        if action == SatelliteSim.ACTION_DUMP :
            reward += 10
    else:
        reward -= 1
    
    if "Power" in obs.keys():
        # Penalize for having less tahn 10% of power
        if obs["Power"] < 10.:
            reward -= 1
        # Penalize for more than 99% of power
        elif obs["Power"] > 99.:
            reward -= .01
        else:
            reward += .0001

    return reward
