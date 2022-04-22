from SimpleSatellite.envs.simulation.Simulation import SatelliteSim

def Reward_v1(env, action):
    """
    First version of the reward function. The structure is define as:
        +10 Dumps analyzed image
        -10 per big fails (takes image over non valid zone, dumps image over non valid zone)
    
    Input: 
        - new_state = [t, theta, busy, used_memory, images_vec, memory_analyzed, target_loc, groundstation]
        - state = [t, theta, busy, images_vector, binary_analysed_picture] 
        - action = integer representing each action
        - sim = curreent satellite simulation
    """ 
    R = 0
    state = env.state
    new_state = env.next_state
    if action!=3 and state[2]==0:
        R -= 50
    else:
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            # Picture were correctly taken
            if state[3]<new_state[3]:
                R+=0.1
            else:
                R-=10

        if action == SatelliteSim.ACTION_DUMP:
            # Files have been correctly dumped
            print(state[3])
            print(new_state[3])
            print(state[3] > new_state[3])
            if state[3] > new_state[3]:
                R+=10
            else:
                R-=10
    return R