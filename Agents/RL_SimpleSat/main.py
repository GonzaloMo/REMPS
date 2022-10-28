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
    config_file = "Trainning_2"
    import os
    ## Get cuurent path
    current_path = os.path.dirname(os.path.abspath(__file__))
    print(current_path)
    with open(f"Environment_Config/{config_file}.yaml", "r") as f:
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
agent = RAY_agent(run = 'PPO', config = config, save_dir="./Logs/Agent/RAY/Trainning_2")

###### Check environment with env_checker ######
from stable_baselines3.common.env_checker import check_env
check_env(env_creator({}))

###### Train Agent ######
import ray
ray.init(num_cpus=4, ignore_reinit_error=True)
if __name__ == "__main__":
    stop_criteria = {"timesteps_total": 1000000}
    analysis = agent.train(stop_criteria)

###### Test Agent ######
    # trained_agent = agent.load("Agents/RL_SimpleSat/Logs/Agent/RAY/PPO_2022-10-27_16-44-45/")
    # env = env_creator({})
    # obs = env.reset()
    # done = False
    # episode_reward = 0
    # while not done:
    #     action = trained_agent.compute_action(obs)
    #     obs, reward, done, info = env.step(action)
    #     env.render()
    #     episode_reward += reward
    # print("Episode reward", episode_reward)

###### Save Agent ######

