import gym

def Reward_example_SSv0(env: gym.Env, action_tuple: int):
    # Get action and observation
    obs = env.get_obs()
    action, img = action_tuple
    reward = 0
    # Reward for dumping a picture
    if env.SatSim.check_action((action,img)):
        if action == env.SatSim.ACTION_DUMP :
            reward += 100

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

def Reward_example_SS_setGolas_v0(env: gym.Env, action_tuple: int):
    # Get action and observation
    obs = env.get_obs()
    action, img = action_tuple
    reward = 0
    # Reward for dumping a picture
    check, _ = env.SatSim.check_action(action,img)
    if check:
        if action == env.SatSim.ACTION_DUMP :
            reward += 100

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

def Reward_example_SS_planner_v0(env: gym.Env, action_tuple: int):
    # Get action and observation
    obs = env.get_obs()
    action, img = action_tuple
    reward = 0
    # Reward for dumping a picture
    if env.SatSim.check_action((action,img)):
        if action == env.SatSim.ACTION_DUMP :
            reward += 100

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
