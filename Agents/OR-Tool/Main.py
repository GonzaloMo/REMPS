"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle
"""
import SimpleSatellite
import gym
from Utils import ObservtionToState

import yaml
with open("EnvConfigFiles/Test_1.yaml", "r") as f:
    config = yaml.load(f, Loader=yaml.FullLoader)

env = gym.make("SimpleSatellite-v0", **config)
obs = env.reset()
# print("Observation: ", obs)
state = ObservtionToState(obs)
with open("Logs/Test_1/Target.txt", "w") as f:
    for i in state[0]:
        f.write(str(i) + ",")
with open("Logs/Test_1/GS.txt", "w") as f:
    for i in state[1]:
        f.write(str(i) + ",")

while True:
    obs, reward, done, info = env.step(env.action_space.sample())
    env.render()
    if done:
        break

