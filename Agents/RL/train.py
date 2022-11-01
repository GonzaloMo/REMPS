###### Import Libraries ######
import yaml
import numpy as np
import os
from typing import Dict


###### Arguments #############
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--trainConfig", type=str, default=f"./TrainningConfigurations/Trainning_config.yml")
args = parser.parse_args()
trainConfig = args.trainConfig

with open(trainConfig, "r") as f:
    trainConfig = yaml.load(f, Loader=yaml.FullLoader)
env_config = trainConfig["Environment"]["env_config"]

###### Make Environment ######
register_env_in_ray(env_config)

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
    for env_config_file in configFiles:
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