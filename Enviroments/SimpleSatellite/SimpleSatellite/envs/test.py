from simsat_v0 import Simple_satellite
import numpy as np
from Test_Utils.Planner import Planner
env = Simple_satellite(action_space_type="Advance")
goals = np.random.randint(0, high=4, size=(env.SatSim.n_targets), dtype=int)
print("Goals: ", goals)
agent = Planner(env.SatSim, "Planner", goals)
env.reset()
action = env.action_space.sample()
while True:
    observation, reward, done, info = env.step(action)
    env.render()
    action = agent.take_action(observation)
    agent.prune_plan(observation)
    agent.update_goals(env.SatSim.Goals_achieved)
    if done:
        break
env.close()