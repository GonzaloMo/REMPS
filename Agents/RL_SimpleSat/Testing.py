import os
from typing import Dict
import yaml


###### Arguments #############
env_name = "SimpleSatellite-v0"

current_path = os.path.dirname(os.path.abspath(__file__))
save_dir = f"{current_path}/Logs/Agent/"
ALGORITHM = "PPO"
Env_directory = f"Environment_Config/"
Reward_type = "Reward_v1"
###### Make Environment ######
import SimpleSatellite
import gym
from ray.tune.registry import register_env
Env_CONfiguration = "Trainning_4"
env_config: Dict={"Config": Env_CONfiguration, "Reward_function": "Reward_v1"}
def env_creator(env_config: Dict={"Config": "Trainning_1", "Reward_function": "Reward_v1"}):
    # Import Reward function
    import importlib
    module_name = "Reward_functions.SimpleSat"
    Rewards = importlib.import_module(module_name, package=None)
    name = env_config["Config"]
    with open(f"{current_path}/Environment_Config/{name}.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    config["Reward"] = getattr(Rewards, env_config["Reward_function"])
    MyEnv = gym.make("SimpleSatellite-v0", **config)
    return MyEnv  # return an env instance
register_env(env_name, env_creator)

###### Load Agent ######
from agent import RAY_agent
agent = RAY_agent()
Save_path = f"Logs/Agent/{env_name}/{ALGORITHM}_{Env_CONfiguration}"
agent.load(Save_path)
    
###### Test Agent ######
reward = 0
for i in range(10):
    reward += agent.test(env_creator(env_config))
print(f"Average reward: {reward/10}")