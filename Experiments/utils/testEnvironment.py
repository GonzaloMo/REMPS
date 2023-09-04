import pandas as pd

import numpy as np
import os
import ray
from tqdm import tqdm
from RLAgent import RAY_agent
from RLAgent.Utils.tune import env_creator
from ray.tune.registry import register_env
def test_episodes(agent, env, n_test: int = 1, render=False, console=None, add_info=True, foldername="./Results"):
    # Test
    for _ in tqdm(range(n_test)):
        # Single episode
        Single_episode(env, agent, render=render, console=console, add_info=add_info, foldername=foldername)
    env.close()

def Single_episode(env, agent, render=True, console=None, add_info=True, foldername="./Results"):
    action_prob_epi = []
    epi_reward = 0
    obs = env.reset()
    done = False
    try:
        envConfig = env.getEpisodeConfig()
    except:
        print(f"No telemetry available for {env}")
        envConfig = {}
    while not done:
        res =  agent.get_action(obs, add_info=add_info)
        if add_info:
            action, action_prob = res
        else:
            action = res

        obs, reward, done, info_env = env.step(action)
        epi_reward += reward
        info_env["Reward"] = reward
        info_env["Done"] = done
        info_env["Total Reward"] = epi_reward
        action_name = env.Number2name_action(action)
        info = [{"Action: ": action_name, 
                "Action Weights: ": np.around(action_prob, 3)}, 
                {**obs, **info_env}]
        if render:
            env.render()
        action_prob_epi.append(action_prob)
        
    try: 
        agent_telemetry = agent.get_telemetry()
        agent.reset_telemetry()
    except:
        agent_telemetry = {}
    try:
        telemetry = env.get_telemetry()
    except:
        print(f"No telemetry available for {env}")
        telemetry = {}
    results = {"Reward": epi_reward, "Action_prob": action_prob_epi, **telemetry, **envConfig, **agent_telemetry}

    save_results(results, foldername)


def to_valid_type(vari):
    if type(vari) == np.float64:
        return float(vari)
    elif type(vari) == np.int64:
        return int(vari)
    elif type(vari) == np.ndarray:
        return vari.tolist()
    elif type(vari) == dict:
        for k, v in vari.items():
            vari[k] = to_valid_type(v)
    elif type(vari) == list:
        for i in range(len(vari)):
            vari[i] = to_valid_type(vari[i])
    return vari


def to_file_type_debug(value, file=None, dp=0):
        if type(value) == dict:
            for k, v in value.items():
                file.write(" "*dp+f"{k}: {type(value)}\n")
                to_file_type_debug(v, file=file, dp=dp+1)
        elif type(value) == list:
            file.write(" -"*dp+f"{len(value)} \n")
            for i in value:
                to_file_type_debug(i, file=file, dp=dp+1)
        else:
            if type(value) != str and type(value) != int and type(value) != float and type(value) != bool:
                file.write(" -"*dp+f"{type(value)}: {value}\n")
                file.write("\n")

def save_results(results, foldername, filename="results.feather"):
    if not os.path.isdir(foldername):
        os.makedirs(foldername)
    
    if filename in os.listdir(foldername):
        for k, v in results.items():
            if type(v) == list:
                results[k] = [v] 
        try:
            results_df = pd.read_feather(f"{foldername}/{filename}")
            results_df = pd.concat([results_df, pd.DataFrame(results)], ignore_index=True)
        except:
            print("Error reading results file, creating new one")
            
            results_df = pd.DataFrame(results)
    else:
        for k, v in results.items():
            if type(v) == list:
                results[k] = [v] 
        results_df = pd.DataFrame(results)
    results_df.reset_index()
    results_df.to_feather(f"{foldername}/{filename}")

def load_env(env_config):
    register_env(env_config["env"], env_creator)
    env = env_creator(env_config)
    return env

def load_agent(fileloc, env_config, specific_checkpoint = None):
    # Start Ray
    ray.init(ignore_reinit_error=True, resources={"cpu": 1, "gpu": 0})
    agent = RAY_agent()
    root_folder, checkpoints = get_checkpoints(fileloc)
    if specific_checkpoint is None:
        specific_checkpoint = checkpoints[-1]
    assert specific_checkpoint in checkpoints, f"Checkpoint {specific_checkpoint} not found in {fileloc} available checkpoints are {checkpoints}"
    specific_checkpoint = root_folder +"/" + specific_checkpoint
    _, _, _ = agent.load(fileloc, mode="test", specific_checkpoint=specific_checkpoint, env=env_config)
    return agent

def get_checkpoints(root_dir):
    checkpoints = []
    root_folder = []
    for folder, subfolders, _ in os.walk(root_dir):
        if any("checkpoint" in subfolder for subfolder in subfolders):
                for subfolder in subfolders:
                        if "checkpoint" in subfolder:
                                checkpoints.append(subfolder)
                                root_folder.append(folder+"/")
                if len(checkpoints) > 0:
                    root_folder = [x for _, x in sorted(zip(checkpoints, root_folder), key=lambda pair: pair[0])]
                    checkpoints = sorted(checkpoints)
    return root_folder, checkpoints