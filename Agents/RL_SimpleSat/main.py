###### Import Libraries ######
import yaml
import numpy as np

###### Make Environment ######
import SimpleSatellite
import gym

from ray.tune.registry import register_env
env_name = "SimpleSatellite-v0"
def env_creator(env_config):
    from Reward_Functions import Reward_v1 as reward_function
    with open("Environment_Config/Trainning_1.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    config["Reward"] = reward_function
    MyEnv = gym.make("SimpleSatellite-v0", **config)
    return MyEnv  # return an env instance
register_env(env_name, env_creator)

###### Make Agent ######
from agent import RAY_agent
with open("Agent_Config/PPO_Config.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
config["env"] = env_name
agent = RAY_agent(run = 'PPO', config = config)


###### Train Agent ######
import ray
ray.init(num_cpus=4, ignore_reinit_error=True)
if __name__ == "__main__":
    stop_criteria = {"timesteps_total": 1000000}
    analysis = agent.train(stop_criteria)

###### Test Agent ######

# env = env_creator({})
# obs = env.reset()
# done = False
# episode_reward = 0
# while not done:
#     obs, reward, done, info = env.step(env.action_space.sample())
#     env.render()
#     episode_reward += reward
# print("Episode reward", episode_reward)

###### Save Agent ######

