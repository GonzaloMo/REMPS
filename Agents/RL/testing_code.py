import importlib
module_name = "Reward_functions.SimpleSat"
Rewards = importlib.import_module(module_name, package=None)
reward_function = getattr(Rewards, "Reward_v1")
import gym
import SimpleSatellite
env = gym.make("SimpleSatellite-v0")
obs = env.reset()
env.step(0)
print(reward_function(env, 2))