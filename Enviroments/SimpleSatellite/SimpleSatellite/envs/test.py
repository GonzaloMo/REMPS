def test():
    import numpy as np
    import yaml
    from SimpleSatellite.envs.simsat_v0 import Simple_satellite
    from SimpleSatellite.envs.Test_Utils.Planner import Planner
    from SimpleSatellite.envs.simulation.Reward_functions import Reward_v1 
    import SimpleSatellite
    path = SimpleSatellite.__path__[0]
    with open(path+"/envs/Test_Utils/Config_example.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
        config["Reward"] = Reward_v1

    env = Simple_satellite(**config)
    goals = np.random.randint(0, high=4, size=(env.SatSim.n_targets), dtype=int)
    print("Goals: ", goals)
    agent = Planner(env.SatSim, "Planner", goals)
    observation = env.reset()
    agent.get_plan(observation, timelimit=10)
    while True:
        action = agent.take_action(observation)
        observation, reward, done, info = env.step(action)
        env.render()
        agent.prune_plan(observation)
        agent.update_goals(env.SatSim.Goals_achieved)
        if done:
            break
    env.close()

test()