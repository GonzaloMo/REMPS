
from Arbiter import Arbiter
# Load Environment with random target positions
import gym
import SimpleSatellite
from ArbiterVoices.Planner import Planner_Voice
env = gym.make("SimpleSatellitePlanner-v0", random=True)

# Initialize arbiter
n_targets_per_planner = 2
n_planners = 1
total_targets = n_targets_per_planner*n_planners

# agent = Arbiter(env, n_targets_per_planner=n_targets_per_planner, n_planners=n_planners)

# Initialize Planner
First_target = 0
Last_target = First_target + n_targets_per_planner
planner = Planner_Voice(env.SatSim, First_target, Last_target, name="Planner_0")
# Start Simulation
episode_reward = 0
done = False
obs = env.reset(total_targets)
# agent.reset_voices(obs)
planner.get_plan(obs, amount=5)
while not done:
    # action = agent.take_action(obs)
    action = planner.getAction(obs)
    obs, reward, done, info = env.step(action)
    env.render(planner.full_plan)
    episode_reward += reward
print(episode_reward)



