
from sunau import AUDIO_FILE_ENCODING_ADPCM_G723_5
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
import os

############################## MultiProcess #####################################
def sim_run(input_tuple):
    arbite_type = "Priority" # "Priority" or "weighted"
    n_planners, total_targets, n_targets_per_planner, amount_of_goals_per_target, i, log_dir = input_tuple
    lock.acquire()
    print(f"Simulation {i}:\n")
    with open(f"{log_dir}Seed_VA.yaml", "a") as f:
        f.write("---\n")
        f.write(f"Simulation {i}:\n")
        f.write(f"    N_targets: {total_targets}\n")
        f.write(f"    N_targets_per_planner: {n_targets_per_planner}\n")
        f.write(f"    Amount_of_goals_per_target: {amount_of_goals_per_target}\n")
    alpha = list(range(1, n_planners+1))
    # Initialize Environment
    env = gym.make("SimpleSatelliteArb-v1", random=False, n_targets = total_targets, log_dir=log_dir)
    # Initialize arbiter
    agent = Arbiter(env, total_targets, n_targets_per_planner=n_targets_per_planner,
                        n_planners=n_planners,seed_v=None, amount=amount_of_goals_per_target, log_dir=log_dir, sim_name=f"Simulation_{i}")
    # merge goals from all planners
    Complete_goals = merge_goals(agent)

    # Start Simulation
    episode_reward = 0
    done = False
    obs = env.reset(total_targets, seed=None)
    lock.release()
    # merged_planner.get_plan(obs)
    agent.reset_voices(obs)
    while not done:
        if obs["Orbit"]%5 == 0 and obs["Orbit"]>0:
            alpha = alpha_function(obs, agent)
        action = agent.take_action(obs, alpha, type_selec_method=arbite_type)
        obs, reward, done, info = env.step(action)
        if "Dump" in env.action_list_names[action]:
            agent.upadte_voices_goals(env.SatSim.Goals_achieved)
        # env.render(agent.Voices)
        episode_reward += reward
    print(episode_reward)
    env.close()
    goals_achieved = env.SatSim.Goals_achieved
    lock.acquire()
    with open(f"{log_dir}Results_VA.yaml", "a") as f:
        f.write("---\n")
        tot_f = f"Simulation {i}: \n"
        for voice in agent.Voices:
            tot_f += f"    {voice.name}:\n"
            goals_left = voice.Goal_ref.goals
            init_goals = voice.Goal_ref.Initial_goals
            tot_f += f"        Initial Goals: {list(init_goals)}\n"
            tot_f += f"        Goals Left: {list(goals_left)}\n"
            tot_f += f"        Total Initial Goals: {np.sum(init_goals)}\n"
            tot_f += f"        Total Goals Left: {np.sum(goals_left)}\n"
        tot_f += f"    MP:\n"
        tot_f += f"        Initial Goals: {list(Complete_goals)}\n"
        tot_f += f"        Goals Achieved: {list(goals_achieved)}\n"
        tot_f += f"        Total Initial Goals: {np.sum(np.array(Complete_goals))}\n"
        tot_f += f"        Total Goals Achieved: {np.sum(np.array(goals_achieved))}\n"
        f.write(tot_f)
    lock.release()
    print(f"n_planners: {n_planners} \ntotal_targets: {total_targets} \nn_targets_per_planner: {n_targets_per_planner} \namount_of_goals_per_target: {amount_of_goals_per_target}")
    print(f"Finished Simulation {i}")

def init_pool_processes(the_lock):
    '''Initialize each process with a global variable lock.
    '''
    global lock
    lock = the_lock

# Main Multiprocessing
from multiprocessing import Pool, Lock
if __name__ == "__main__":
    l = Lock()
    # Create log directory
    log_dir = "./Logs/Simulation/" + "2022-08-20_06-40-57"+"/"
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    i = 0
    iter_Variable = []
    n_planners = 3
    for total_targets in range(5, 10, 5): # Total number of targets (between 5 and 10)
        n_tpp_list = [3, 5, 8] # Number of targets per planner (between 25% and total_targets)
        for n_targets_per_planner in n_tpp_list: # Number of targets per planner (between 25% and total_targets)
            for amount_of_goals_per_target in [5,10]: # Number of goals per target (between 10 and 30)
                i += 1
                iter_Variable.append((n_planners, total_targets, n_targets_per_planner, amount_of_goals_per_target, i, log_dir))
    print("Run pool")
    # Create Pool of Processes
    pool = Pool(initializer=init_pool_processes, initargs=(l,), processes=20)
    # Run Simulation
    print("Run map")
    pool.map(sim_run, iter_Variable)
