
from Arbiter import Arbiter
# Load Environment with random target positions
import gym
import SimpleSatellite
env = gym.make("SimpleSatellite-v0", random=True)

# Initialize arbiter
n_targets_per_planner = 2
n_planners = 4
total_targets = n_targets_per_planner*n_planners

agent = Arbiter(env, n_targets_per_planner=n_targets_per_planner, n_planners=n_planners)

# Start Simulation
episode_reward = 0
done = False
obs = env.reset(total_targets)
agent.reset_voices(obs)
while not done:
    action = agent.take_action(obs)
    obs, reward, done, info = env.step(action)
    env.render()
    episode_reward += reward
print(episode_reward)