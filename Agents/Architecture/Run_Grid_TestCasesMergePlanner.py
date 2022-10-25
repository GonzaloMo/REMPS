from pickle import FALSE
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
from copy import copy

############################## MultiProcess #####################################
def sim_run(input_tuple):
    log_dir, seed_dict, render = input_tuple
    for k, v in seed_dict.items():
        sim_name = k
        total_targets = v["N_targets"]
        n_targets_per_planner = v["N_targets_per_planner"] 
        amount_of_goals_per_target = v["Amount_of_goals_per_target"]
        sim_seed = v["Simulation_Seed"]
        n_planners = 3
        seed_v = []
        for i in range(n_planners):
            name = f"V_{i}"
            seed_v.append(v[name])

    alpha = list(range(1, n_planners+1))
    # Initialize Environment
    env = gym.make("SimpleSatelliteArb-v1", random=False, n_targets = total_targets, log_dir=log_dir)

    # Initialize arbiter
    agent = Arbiter(env, total_targets, n_targets_per_planner=n_targets_per_planner,
                        n_planners=n_planners, seed_v=seed_v, amount=amount_of_goals_per_target, log_dir=log_dir, sim_name=sim_name)

    # merge goals from all planners
    Complete_goals = merge_goals(agent)
    mp_ref_name = copy(sim_name)
    vec_name = mp_ref_name.split()
    mp_ref_name = vec_name[0]+"_"+vec_name[1]
    merged_planner = Planner(env.SatSim, f"MP_{mp_ref_name}", Complete_goals)

    # Start Simulation
    done = False
    obs = env.reset(total_targets, seed=sim_seed)
    # merged_planner.get_plan(obs)
    merged_planner.get_plan(obs)
    while not done:
        action = merged_planner.take_action(obs)
        obs, reward, done, info = agent.env.step(action)
        if "Dump" in env.action_list_names[action]:
            agent.upadte_voices_goals(env.SatSim.Goals_achieved)
            merged_planner.update_goals(env.SatSim.Goals_achieved)
        merged_planner.prune_plan(obs)
        if render:
            env.render([merged_planner], single=True)
    env.close()
    goals_achieved = env.SatSim.Goals_achieved
    if not render:
        lock.acquire()
        with open(f"{log_dir}/Results_MP.yaml", "a") as f:
            f.write("---\n")
            tot_f = f"{sim_name}: \n"
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
            tot_f += f"        Goals Left mp: {list(merged_planner.goals)}\n"
            tot_f += f"        Total Initial Goals: {np.sum(np.array(Complete_goals))}\n"
            tot_f += f"        Total Goals Achieved: {np.sum(np.array(goals_achieved))}\n"
            tot_f += f"        Total Goals Left: {np.sum(np.array(merged_planner.goals))}\n"
            f.write(tot_f)
        lock.release()
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
    i = 0
    iter_Variable = []
    date_dir = "2022-08-20_06-40-57"
    log_dir = "./Logs/Simulation/"+date_dir
    import yaml
    with open(f"{log_dir}/Seed.yaml", "r") as f:
        docs = yaml.load_all(f, Loader=yaml.FullLoader)
        inp_lst = [] 
        for doc in docs:
            iter_Variable.append((log_dir, doc, False))
    # print("Run pool")
    # Create Pool of Processes
    pool = Pool(initializer=init_pool_processes, initargs=(l,), processes=20)
    # Run Simulation
    print("Run map")
    pool.map(sim_run, iter_Variable)
    # n = 2
    # inp = (iter_Variable[n][0] , iter_Variable[n][1], True)
    # sim_run(inp)