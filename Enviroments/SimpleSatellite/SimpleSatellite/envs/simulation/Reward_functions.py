from SimpleSatellite.envs.simulation.Simulation import SatelliteSim

def Reward_v1(env, action):
    """
    First version of the reward function. The structure is define as:
        +10 Dumps analyzed image
        -10 per big fails (takes image over non valid zone, dumps image over non valid zone)
    """ 
    R = 0
    state = env.state
    new_state = env.next_state
    if action == SatelliteSim.ACTION_DUMP:
        # Files have been correctly dumped
        if state['Memory Level'] > new_state['Memory Level']:
            R+=1
    return R