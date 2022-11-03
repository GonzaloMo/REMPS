###### Arguments #############
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-e", "--env", type=str, default="./Configurations/PDDLPlanner/Environment.yml", help="Environment configuration file to run")
parser.add_argument("-a", "--agent", type=str, default="./Configurations/PDDLPlanner/Planner.yml", help="Agent configuration file to use")
parser.add_argument("-n", "--num_episodes", type=int, default=100, help="Number of episodes to run", required=True)
parser.add_argument("-r", "--render", type=bool, default=False, help="Render the environment")
parser.add_argument("-s", "--save", type=bool, default=True, help="Save the Results")
args = parser.parse_args()

Env_config = args.env
Agent_config = args.agent
num_episodes = args.num_episodes
render = args.render
save = args.save
###### Import Libraries ######
print("Importing Libraries")
import yaml
import numpy as np
import os
from typing import Dict, List, Tuple, Union, Any
import gym
import SimpleSatellite
from PDDLPlanner import Planner
import csv
from datetime import datetime
from PDDLPlanner.Environment_Specific.SimpleSatellite_setgoals_v0 import Action
###### Load Configuration ######
print("Loading Configuration")
# Environment
with open(Env_config, "r") as f:
    Env_config = yaml.load(f, Loader=yaml.FullLoader)
# Agent
with open(Agent_config, "r") as f:
    Agent_config = yaml.load(f, Loader=yaml.FullLoader)

Env_config["Log_dir"] = Agent_config["log_dir"] + Agent_config["name"] + "/Simulation/"
###### Make Environment ######
print("Making Environment")
env = gym.make("SimpleSatellite-setgoals-v0", **Env_config)

###### Make Agent ######
print("Making Agent")
agent = Planner(env, **Agent_config)

###### Main #############
print("Starting Main")
if __name__=="__main__":
    Rewards = []
    Steps = []
    Episodes = range(num_episodes)
    for i in Episodes:
        done = False
        obs = env.reset()
        Ep_Reward = 0
        Ep_Steps = 0
        while not done:
            action = agent.take_action(obs)
            obs, reward, done, info = env.step(action)
            Ep_Reward += reward
            Ep_Steps += 1
            if render:
                env.render()
            if done:
                print(f"Episode {i} finished after {Ep_Steps} steps with reward {Ep_Reward}")
                break
        Rewards.append(Ep_Reward)
        Steps.append(Ep_Steps)
    print(f"Average Reward: {np.mean(Rewards)}")
    print(f"Average Steps: {np.mean(Steps)}")
    if save:
        print("Saving Results")
        now = datetime.now()
        dt_string = now.strftime("%d_%m_%Y_%H_%M_%S")
        if not os.path.exists("./Results"):
            os.mkdir("./Results")
        with open(f"./Results/Run_{dt_string}.csv", "w") as f:
            writer = csv.writer(f)
            writer.writerow(["Episode", "Reward", "Steps"])
            for i in Episodes:
                writer.writerow([i, Rewards[i], Steps[i]])

        
        

    