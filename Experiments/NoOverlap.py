# Get arguments
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-v", "--numberVoices", type=int, dest="Nv", default=2, help="Number of voices")
parser.add_argument("-f", "--folder", type=str, dest="folder", default="./Results/arbiter_test/", help="Folder where the Results are stored")
parser.add_argument("-r", "--render", dest="render", action="store_true", help="Render(1) or not (0)")
parser.add_argument("-nt", "--n_test", type=int, dest="n_test", default=5, help="Number of tests")
parser.add_argument("-tt", "--test_type", type=str, dest="test_type", default="Overlapping", help="Type of test")
parser.add_argument("-o", "--overlap", help="Percentage of overlap", type=float, dest="overlap", default=0.)
args = parser.parse_args()
Results_folder = args.folder
number_of_Voices = int(args.Nv)
render = args.render
n_test = args.n_test
overlap = args.overlap
test_type = args.test_type
assert overlap >= 0 and overlap <= 1, "Overlap must be between 0 and 1"

Results_folder = Results_folder + f"/{test_type}/Voices_{number_of_Voices}_Overlap_{overlap}/"
# Import Arbiter Arbiter and Voice
from Architecture.Arbiter.Arbiter_SimpleSatellite import setGoalsv4


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
Voices_loc = "/home/ksb21109/Documents/PhD/REMPS/Test/Results/agents/SimpleSatellite/setgoals_v4/R7/2023-07-17-11-34-31/"

# Load the environment configuration
with open("./Configurations/FullProblem.yaml", "r") as f:
    env_config = yaml.load(f, Loader=yaml.FullLoader)

tot_targets = int(5*(1 + (number_of_Voices-1)*(1-overlap)))
print(f"Total number of targets: {tot_targets}")
tot_orbits = number_of_Voices*15
print(f"Total number of orbits: {tot_orbits}")
env_config["Number_of_targets"] = tot_targets
env_config["MEMORY_SIZE"] = tot_targets*6
env_config["MAX_ORBITS"] = tot_orbits
env_config["generatetelemetry"] = True
env = gym.make("SimpleSatellite-setgoals-v4", **env_config)

# Create the arbiter
arbiter = setGoalsv4(env)    

# Test the arbiter
results = test_episodes(arbiter, env, 
                        n_test=n_test, 
                        render=render, 
                        foldername=Results_folder, 
                        test_type=test_type, 
                        overlap=overlap, 
                        voice_loc=Voices_loc, 
                        n_voices=number_of_Voices)