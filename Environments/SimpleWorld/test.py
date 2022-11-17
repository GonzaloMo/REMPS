#### Arguments
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('-n', '--n_test', type=int, default=10)
n_test = parser.parse_args().n_test

import gym 
import SimpleWorld

env = gym.make('SimpleWorld-MA-v0')
for i in range(n_test):
    obs = env.reset()
    while True:
        action = env.action_space.sample()
        obs, _, done, _ = env.step()
