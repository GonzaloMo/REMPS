# test environment with random actions

import gym
import SimpleSatellite
import numpy as np

import yaml
# load config file gym
with open('SimpleSatellite/envs/Test_Utils/Configurations/Gym_env/Config.yaml') as f:
    config = yaml.load(f, Loader=yaml.FullLoader)
# load sim config file
with open('SimpleSatellite/envs/Test_Utils/Configurations/Simulations/EarthObservation/LEO/SSO.yaml') as f:
    sim_config = yaml.load(f, Loader=yaml.FullLoader)
config= {**config, **sim_config}
env = gym.make('SimpleSatellite-setgoals-v0', **config)

a = "y"
while "y" in  a.lower():
    env.reset()
    while True:
        env.render()
        action = env.action_space.sample()
        observation, reward, done, info = env.step(action)
        if done:
            break
    a = input("Continue? (y/n): ")