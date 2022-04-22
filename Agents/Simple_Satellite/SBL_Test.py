import gym
import SimpleSatellite
from time import sleep
# import agent
from stable_baselines3 import PPO
if __name__ == '__main__':
    save_dir = "SBL_Logs/"
    # Create the vectorized environment
    env = gym.make("SimpleSatellite-v0")
    # Create model
    model = PPO.load(save_dir+'ppo_SimpleSatellite_v0_1')
    obs = env.reset()
    print(obs)
    done = False
    t_r = 0
    while not done:
        action, _states = model.predict(obs)
        obs, rewards, done, info = env.step(action, render=True)
        t_r += rewards
        print(t_r)
