
from Agents.Arbiter import Arbiter
from Agents.Planner import Planner
# Load Environment with random target positions
import gym
import SimpleSatellite
import numpy as np
from ArbiterVoices.utils import read_seed, merge_goals
from ArbiterVoices.Planner_voice import Planner_Voice
from time import sleep
import datetime
import os

# newsim = False



# arbite_type = "Priority" # "Priority" or "weighted"
# # Set Seed for reproducibility
# seed_env = None
# seed_planner = None
# i = 0
# for n_planners in range(2, 6): # Number of planners (1 through 5)
#     for total_targets in range(5, 30, 5): # Total number of targets (between 5 and 30)
#         n_tpp_list = [int(.25*total_targets), int(.5*total_targets), int(.75*total_targets), total_targets] # Number of targets per planner (between 25% and total_targets)
#         for n_targets_per_planner in n_tpp_list: # Number of targets per planner (between 25% and total_targets)
#             for amount_of_goals_per_target in [10, 20, 30]: # Number of goals per target (between 10 and 30)
#                 with open(f"{log_dir}Seed.txt", "a") as f:
#                     i += 1
#                     f.write(f"Simulation {i}\n")
#                     f.write(f"----------------------------------------------------\n")
#                     f.write(f"N_targets: {total_targets}\n")
#                     f.write(f"N_targets_per_planner: {n_targets_per_planner}\n")
#                     f.write(f"Amount_of_goals_per_target: {amount_of_goals_per_target}\n")
#                 alpha = list(range(1, n_planners+1))
#                 # Initialize Environment
#                 env = gym.make("SimpleSatelliteArb-v1", random=False, n_targets = total_targets, log_dir=log_dir)

#                 # Initialize arbiter
#                 agent = Arbiter(env, total_targets, n_targets_per_planner=n_targets_per_planner,
#                                  n_planners=n_planners,seed_v=seed_planner, amount=amount_of_goals_per_target, log_dir=log_dir)

#                 # merge goals from all planners
#                 Complete_goals = merge_goals(agent)
#                 merged_planner = Planner(env.SatSim, "MP_", Complete_goals)
#                 print(f"{merged_planner.name} | Goals: {np.array(Complete_goals)} | Total: {np.sum(Complete_goals)}")

#                 # Start Simulation
#                 episode_reward = 0
#                 done = False
#                 obs = env.reset(total_targets, seed=seed_env)
#                 with open(f"{log_dir}Seed.txt", "a") as f:
#                     f.write(f"END\n")
#                     f.write(f"----------------------------------------------------\n\n")
#                 # merged_planner.get_plan(obs)
#                 agent.reset_voices(obs)
#                 while not done:
#                     action = agent.take_action(obs, alpha, type_selec_method=arbite_type)
#                     obs, reward, done, info = env.step(action)
#                     if "Dump" in env.action_list_names[action]:
#                         agent.upadte_voices_goals()
#                     # env.render(agent.Voices)
#                     episode_reward += reward
#                 print(episode_reward)
#                 env.close()
#                 goals_achieved = env.SatSim.Goals_achieved
#                 with open(f"{log_dir}Results.txt", "a") as f:
#                     f.write(f"\nSimulation {i}\n")
#                     f.write(f"----------------------------------------------------\n")
#                     for voice in agent.Voices:
#                         goals_left = voice.Goal_ref.goals
#                         init_goals = voice.Goal_ref.Initial_goals
#                         f.write(f"\n{voice.name}\n")
#                         f.write(f"Initial Goals: {init_goals}\n")
#                         f.write(f"Goals Left:    {goals_left}\n")
#                     f.write(f"\n{merged_planner.name}")
#                     f.write(f"Initial Goals:     {np.array(Complete_goals)}\n")
#                     f.write(f"Goals Achieved:    {np.array(goals_achieved)}\n")
#                     f.write(f"----------------------------------------------------\n")
#                 print(f"n_planners: {n_planners} \ntotal_targets: {total_targets} \nn_targets_per_planner: {n_targets_per_planner} \namount_of_goals_per_target: {amount_of_goals_per_target}")
#                 print(f"Finished Simulation {i}")



############################## MultiProcess #####################################
def sim_run(input_tuple):
    arbite_type = "Priority" # "Priority" or "weighted"
    n_planners, total_targets, n_targets_per_planner, amount_of_goals_per_target, i, log_dir = input_tuple
    lock.acquire()
    with open(f"{log_dir}Seed.txt", "a") as f:
        i += 1
        f.write(f"Simulation {i}\n")
        f.write(f"----------------------------------------------------\n")
        f.write(f"N_targets: {total_targets}\n")
        f.write(f"N_targets_per_planner: {n_targets_per_planner}\n")
        f.write(f"Amount_of_goals_per_target: {amount_of_goals_per_target}\n")
    alpha = list(range(1, n_planners+1))
    # Initialize Environment
    env = gym.make("SimpleSatelliteArb-v1", random=False, n_targets = total_targets, log_dir=log_dir)

    # Initialize arbiter
    agent = Arbiter(env, total_targets, n_targets_per_planner=n_targets_per_planner,
                        n_planners=n_planners,seed_v=None, amount=amount_of_goals_per_target, log_dir=log_dir, sim_name=f"Simulation_{i}")

    # merge goals from all planners
    Complete_goals = merge_goals(agent)
    merged_planner = Planner(env.SatSim, "MP_", Complete_goals)
    print(f"{merged_planner.name} | Goals: {np.array(Complete_goals)} | Total: {np.sum(Complete_goals)}")

    # Start Simulation
    episode_reward = 0
    done = False
    obs = env.reset(total_targets, seed=None)
    with open(f"{log_dir}Seed.txt", "a") as f:
        f.write(f"END\n")
        f.write(f"----------------------------------------------------\n\n")
    lock.release()
    # merged_planner.get_plan(obs)
    agent.reset_voices(obs)
    while not done:
        action = agent.take_action(obs, alpha, type_selec_method=arbite_type)
        obs, reward, done, info = env.step(action)
        if "Dump" in env.action_list_names[action]:
            agent.upadte_voices_goals()
        # env.render(agent.Voices)
        episode_reward += reward
    print(episode_reward)
    env.close()
    goals_achieved = env.SatSim.Goals_achieved
    lock.acquire()
    with open(f"{log_dir}Results.txt", "a") as f:
        f.write(f"\nSimulation {i}\n")
        f.write(f"----------------------------------------------------\n")
        for voice in agent.Voices:
            goals_left = voice.Goal_ref.goals
            init_goals = voice.Goal_ref.Initial_goals
            f.write(f"\n{voice.name}\n")
            f.write(f"Initial Goals: {init_goals}\n")
            f.write(f"Goals Left:    {goals_left}\n")
        f.write(f"\n{merged_planner.name}")
        f.write(f"Initial Goals:     {np.array(Complete_goals)}\n")
        f.write(f"Goals Achieved:    {np.array(goals_achieved)}\n")
        f.write(f"----------------------------------------------------\n")
    lock.release()
    print(f"n_planners: {n_planners} \ntotal_targets: {total_targets} \nn_targets_per_planner: {n_targets_per_planner} \namount_of_goals_per_target: {amount_of_goals_per_target}")
    print(f"Finished Simulation {i}")

def init_pool_processes(the_lock):
    '''Initialize each process with a global variable lock.
    '''
    global lock
    lock = the_lock
from multiprocessing import Pool, Lock
if __name__ == "__main__":
    global lock
    l = Lock()
    # Create log directory
    log_dir = "./Logs/Simulation/" + datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")+"/"
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    i = 0
    iter_Variable = []
    for n_planners in range(2, 6): # Number of planners (1 through 5)
        for total_targets in range(5, 30, 5): # Total number of targets (between 5 and 30)
            n_tpp_list = [int(.25*total_targets), int(.5*total_targets), int(.75*total_targets), total_targets] # Number of targets per planner (between 25% and total_targets)
            for n_targets_per_planner in n_tpp_list: # Number of targets per planner (between 25% and total_targets)
                for amount_of_goals_per_target in [10, 20, 30]: # Number of goals per target (between 10 and 30)
                    i += 1
                    iter_Variable.append((n_planners, total_targets, n_targets_per_planner, amount_of_goals_per_target, i, log_dir))


    # Create Pool of Processes
    pool = Pool(initializer=init_pool_processes, initargs=(l,))
    # Run Simulation
    pool.map(sim_run, iter_Variable)
