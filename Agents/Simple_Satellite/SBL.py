# import and create environments 
import gym
import SimpleSatellite

env =  gym.make("SimpleSatellite-v0")

# import agent
from stable_baselines3.ppo import PPO

model = PPO("MlpPolicy", env, verbose=1)
model.learn(total_timesteps=25000)
model.save("ppo_SimpleSatellite_v0")