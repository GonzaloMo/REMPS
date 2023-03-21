# test environment with random actions

import gym
import SimpleSatellite
import numpy as np

import yaml
# load config file gym
with open('SimpleSatellite/envs/Test_Utils/Configurations/Gym_env/Config.yaml') as f:
    config = yaml.load(f, Loader=yaml.FullLoader)
# load sim config file
with open('SimpleSatellite/envs/Test_Utils/Configurations/Simulations/EarthObservation/LEO/RGT.yaml') as f:
    sim_config = yaml.load(f, Loader=yaml.FullLoader)
config= {**config, **sim_config}
env = gym.make('SimpleSatellite-setgoals-v0', **config)

a = "y"
while "y" in  a.lower():
    obs = env.reset()
    env.render()
    while True:
        action = env.action_space.sample()
        obs, reward, done, info = env.step(action)
        env.render()
        if done:
            break
    a = input("Continue? (y/n): ")