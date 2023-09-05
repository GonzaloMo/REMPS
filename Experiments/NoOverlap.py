# Get arguments
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-v", "--numberVoices", type=int, dest="Nv", default=2, help="Number of voices")
parser.add_argument("-f", "--folder", type=str, dest="folder", default="./Results/arbiter_test/", help="Folder where the Results are stored")
parser.add_argument("-r", "--render", dest="render", action="store_true", help="Render(1) or not (0)")
parser.add_argument("-nt", "--n_test", type=int, dest="n_test", default=5, help="Number of tests")
args = parser.parse_args()
Results_folder = args.folder
number_of_Voices = int(args.Nv)
render = args.render
n_test = args.n_test

# Import Arbiter Arbiter and Voice
from Architecture.Arbiter.Arbiter_SimpleSatellite import setGoalsv4
from Architecture.Voices.SimpleSatellite_RL import VoiceSetGoalsV4

# Import the environment
import gym
import SimpleSatellite

# import other libraries
import random
import yaml
import logging
import ray
ray.init(logging_level=logging.ERROR)
import logging
from copy import deepcopy

# Import the test function
from utils.testEnvironment import test_episodes

# Load Voice RL Agent 
Voices_loc = ["/home/ksb21109/Documents/PhD/REMPS/Test/Results/agents/SimpleSatellite/setgoals_v4/R7/2023-07-17-11-34-31/"]*number_of_Voices

# Load the environment configuration
with open("./Configurations/FullProblem.yaml", "r") as f:
    env_config = yaml.load(f, Loader=yaml.FullLoader)

tot_targets = 5*number_of_Voices
tot_orbits = 15*number_of_Voices
env_config["Number_of_targets"] = tot_targets
env_config["MAX_ORBITS"] = tot_orbits
env_config["generatetelemetry"] = True
env = gym.make("SimpleSatellite-setgoals-v4", **env_config)

# Create the arbiter
arbiter = setGoalsv4(env)

# Add the voices
total_targets_list = list(range(1, env_config["Number_of_targets"]+1))
obs = env.reset()
Base_obs = {}
for k, v in obs.items():
    Base_obs[k] = True
for i, v_loc in enumerate(Voices_loc):
    t_list = random.sample(total_targets_list, 5)
    t_list.sort()
    total_targets_list = [t for t in total_targets_list if t not in t_list]
    arbiter.addVoice(VoiceSetGoalsV4(v_loc,
                            name=f"Voice_{i}",
                            n_actions=arbiter.n_actions,
                            target_list=deepcopy(t_list),
                            obs_space=Base_obs))
    

# Test the arbiter
results = test_episodes(arbiter, env, n_test=n_test, render=render, foldername=Results_folder)