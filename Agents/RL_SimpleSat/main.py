###### Import Libraries ######
import yaml
import numpy as np
import os
from typing import Dict


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
###### Make Agent ######
from agent import RAY_agent
with open("Agent_Config/PPO_Config.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
config["env"] = env_name
agent = RAY_agent(run = ALGORITHM, config = config, save_dir=f"{save_dir}")

############################################################################################################
    ###### Train Agent ######
if __name__ == "__main__":
    # ["Trainning_1"] # ["Trainning_1", "Trainning_2", "Trainning_3", "Trainning_4", "Trainning_5"]
    configFiles = [f.replace(".yaml","") for f in os.listdir(Env_directory) if os.path.isfile(os.path.join(Env_directory, f))]
    configFiles.sort()
    print(configFiles)
    i = 0
    for env_config_file in configFiles[1:]:
        Save_path = f"{save_dir}{env_name}/{ALGORITHM}_{env_config_file}/"
        if i == 0:
            restore_lc = False
        else:
            restore_lc = True
        stop_criteria = {"timesteps_total": 10000000}
        env_config: Dict={"Config": env_config_file, "Reward_function": Reward_type}
        agent.train(stop_criteria, env_config, Save_path, restore_lc=restore_lc)
        i+=1

        ###### Save Agent ######
        agent.save(Save_path)
        # agent.load(Save_path, Partial_load=True)

###### Delete Agent ######
del agent

###### Load Agent ######
agent = RAY_agent()
agent.load(Save_path)
    
###### Test Agent ######
reward = 0
for i in range(100):
    reward += agent.test(env_creator(env_config))
print(f"Average reward: {reward/100}")