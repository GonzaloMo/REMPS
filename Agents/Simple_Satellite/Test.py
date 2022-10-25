
from tkinter import FALSE
from Agents.Arbiter import Arbiter
from Agents.Planner import Planner
# Load Environment with random target positions
import gym
import SimpleSatellite
import numpy as np
from ArbiterVoices.utils import read_seed, merge_goals, alpha_function
from ArbiterVoices.Planner_voice import Planner_Voice
from time import sleep
import datetime

newsim = False
log_dir = "./Logs/Simulation/"
arbite_type = "Priority" # "Priority" or "weighted"
# Set Seed for reproducibility
if newsim:
    seed_env = None
    seed_planner = None
    
    n_planners = 3 # Number of planners (1 through 5)
    total_targets = 10 # Total number of targets (between 5 and 30)
    n_targets_per_planner = 5 # Number of targets per planner (between 25% and total_targets)
    amount_of_goals_per_target = 10
    with open(f"{log_dir}Seed.txt", "a") as f:
        f.write(f"New Simulation run at {datetime.datetime.now()}\n")
        f.write(f"----------------------------------------------------\n")
        f.write(f"N_targets: {total_targets}\n")
        f.write(f"N_targets_per_planner: {n_targets_per_planner}\n")
        f.write(f"Amount_of_goals_per_target: {amount_of_goals_per_target}\n")
else:
    sim = "32"
    date = "2022-08-19_15-56-51"
    seed_dict = read_seed(f"{log_dir}{date}/Seed.yaml", sim)
    seed_planner = []
    planner_names = []
    for key in seed_dict:
        if "Simulation_Seed" == key:
            seed_env = seed_dict[key]
        elif "N_targets" == key:
            total_targets = seed_dict[key]
        elif "N_targets_per_planner" in key:
            n_targets_per_planner = seed_dict[key]
        elif "Amount_of_goals_per_target" in key:
            amount_of_goals_per_target = seed_dict[key]
        else:
            seed_planner.append(seed_dict[key])
            planner_names.append(key)
    n_planners = len(planner_names)
    print(f"Loadded Simulation: {seed_dict}")

# Initialize Environment
env = gym.make("SimpleSatelliteArb-v1", random=False, n_targets = total_targets, log_dir=log_dir)

# Initialize arbiter
agent = Arbiter(env, total_targets, n_targets_per_planner=n_targets_per_planner,
                                 n_planners=n_planners,seed_v=seed_planner, amount=amount_of_goals_per_target, log_dir=log_dir)


# Start Simulation
episode_reward = 0
done = False
obs = env.reset(total_targets, seed=seed_env)
print(obs["Targets"])



if newsim:
    with open(f"{log_dir}Seed.txt", "a") as f:
        f.write(f"END\n")
        f.write(f"----------------------------------------------------\n\n")
# merged_planner.get_plan(obs)
agent.reset_voices(obs)
while not done:
    alpha = alpha_function(obs, agent)
    action = agent.take_action(obs, alpha, type_selec_method=arbite_type)
    obs, reward, done, info = env.step(action)
    if "Dump" in env.action_list_names[action]:
        agent.upadte_voices_goals()
    env.render(agent.Voices)
    episode_reward += reward
print(episode_reward)
env.close()
goals_achieved = env.SatSim.Goals_achieved
print(f"Goals Achieved: {goals_achieved}")
for voice in agent.Voices:
    goals_left = voice.Goal_ref.goals
    init_goals = voice.Goal_ref.Initial_goals
    print(f"\n----------------------------------------------------\n")
    print(f"{voice.name}\n")
    print(f"Initial Goals: {init_goals}\n")
    print(f"Goals Left:    {goals_left}\n")
print(f"\n----------------------------------------------------\n")
print(f"{merged_planner.name}")
print(f"Initial Goals: {np.array(Complete_goals)}")
import IPython; IPython.embed()