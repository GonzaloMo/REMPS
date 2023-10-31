import numpy as np
from tqdm import tqdm
import random
from copy import deepcopy
from Architecture.Voices.SimpleSatellite_RL import VoiceSetGoalsV4
from utils.helpers import  save_results
def test_episodes(agent, env, n_test: int = 1, render=False, foldername="./Results", test_type="Overlapping", **kwargs):
    # Test
    for _ in tqdm(range(n_test)):
        # Single episode
        if test_type == "Overlapping":
            OverLap(env, agent, render=render, foldername=foldername, **kwargs)
        elif test_type == "Variable_Voice":
            VariableVoice(env, agent, render=render, foldername=foldername, **kwargs)
        else:
            raise ValueError(f"Test type {test_type} not recognized")
    env.close()

def OverLap(env, agent, render=True, foldername="./Results", voice_loc = None, n_voices = 1, overlap=0., **kwargs):
    target_list = list(range(1, env.SatSim.n_targets+1))
    obs = env.reset()
    Base_obs = {}
    for k, v in obs.items():
        Base_obs[k] = True

    for i in range(n_voices):
        new_voice, target_list = createVoice(agent, voice_loc, target_list, Base_obs, voice_name=f"Voice_{i}", overlap=overlap)
        agent.addVoice(new_voice)
    action_prob_epi = []
    epi_reward = 0
    agent.reset()
    goals = agent.get_goals()

    env.set_goals(goals)
    done = False
    # Get configuration of agent and environment
    agentConfig = agent.getConfig()
    envConfig = env.getEpisodeConfig()
    extra_time = 30
    while extra_time>0:
        obs["Orbit"] = [env.SatSim.orbit]
        action, action_prob =  agent.get_action(obs, add_info=True)
        obs, reward, done, _ = env.step(action)
        agent.update(env.SatSim.n_images_dumped)
        epi_reward += reward
        if render:
            env.render()
        if done:
            extra_time -= 1
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
    results = {"Reward": epi_reward, "Action_prob": action_prob_epi, **telemetry, **envConfig, **agent_telemetry, **agentConfig}
    save_results(results, foldername)


def VariableVoice(env, agent, render=True, foldername="./Results", voice_loc = None, n_voices = 1, overlap=0., **kwargs):   
    target_list = list(range(1, env.SatSim.n_targets+1))
    obs = env.reset()
    Base_obs = {}
    print2log(f"----------------------New Episode----------------------")
    for k, v in obs.items():
        Base_obs[k] = True
    
    voice_list = []
    voice_in = list(range(0, 5*n_voices, 5))
    for i in range(n_voices):
        new_voice, target_list = createVoice(agent, voice_loc, target_list, Base_obs, voice_name=f"Voice_{i}", overlap=overlap)
        new_voice.addInitDumpedImages(env.SatSim.n_images_dumped)
        voice_list.append(new_voice)    
    action_prob_epi = []
    epi_reward = 0
    agent.reset()
    goals = agent.get_goals()    
    env.set_goals(goals)
    done = False
    # Get configuration of agent and environment
    agentConfig = {}
    agentConfig["voice Init Time"] = deepcopy(voice_in)
    for voice in voice_list:
        k1 = voice.name + " " + "Targets"
        agentConfig[k1] = [list(voice.Obs_space["Targets"])]
    agentConfig
    envConfig = env.getEpisodeConfig()
    extra_time = 30
    while extra_time>0:
        if len(voice_list)>0:
            if env.SatSim.orbit == voice_in[0]:
                print2log(f"Adding voice {voice_list[0]} at orbit {voice_in[0]} line 103")
                agent.addVoice(voice_list[0])
                goals = agent.get_goals()   
                env.set_goals(goals)
                print2log(f"New goals {goals}")
                for v in agent.Voices:
                    print2log(f"{v.name} has goals {v.goals}, targets {v.target_list} line 108")
                voice_in.pop(0)
                voice_list.pop(0)
        obs["Orbit"] = [env.SatSim.orbit]
        action, action_prob =  agent.get_action(obs, add_info=True)
        obs, reward, done, _ = env.step(action)
        agent.update(env.SatSim.n_images_dumped)
        epi_reward += reward
        if render:
            env.render()
        if done:
            # print(f"Episode done at orbit {env.SatSim.orbit})")
            # for k, v in env.info.items():
            #     print(f"{k}: {v}")
            # print(f"agent.n_Voice: {agent.n_Voice} and len(voice_list): {len(voice_list)}, Voice: {len(agent.Voices)}")
            completed_all = True
            for voice in agent.Voices:
                goals_left = np.sum(voice.goals)

                if goals_left > 0:
                    completed_all = False
                    break
            if len(voice_list)<1 and np.sum(env.goals) == 0 and completed_all:
                extra_time -= 1
            elif env.SatSim.orbit >= env.SatSim.MAX_ORBITS:
                extra_time = -1
        action_prob_epi.append(action_prob)
    print2log(f"Final goals: {env.goals} line 137")
    print2log(f"Episode done at orbit {env.SatSim.orbit}, Number of voices left: {agent.n_Voice} line 138")
    for voice in agent.Voices:
        goals_left = np.sum(voice.goals)
        print2log(f"{voice.name} has goals {voice.goals}, targets {voice.target_list}")
        print2log(f"{voice.name} has {goals_left} goals left")
        
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
    print2log(f"---------------------------------------------------")
    results = {"Reward": epi_reward, "Action_prob": action_prob_epi, **telemetry, **envConfig, **agent_telemetry, **agentConfig}
    save_results(results, foldername)

def createVoice(agent, v_loc, target_list, Base_obs, voice_name="Voice_0", overlap=0.):
    t_list = random.sample(target_list, 5)
    t_list.sort()
    N_unique = int(5*(1-overlap))
    t_list_unique = random.sample(t_list, N_unique)
    new_target_list = [t for t in target_list if t not in t_list_unique]
    # print(f"Voice {voice_name} has targets {t_list} and unique targets {t_list_unique} and v loc {v_loc}")
    new_voice = VoiceSetGoalsV4(v_loc,
                            name=f"{voice_name}",
                            n_actions=agent.n_actions,
                            target_list=deepcopy(t_list),
                            obs_space=Base_obs)
    new_voice.generateGoals()
    return new_voice, new_target_list

def print2log(astring):
    with open("log.txt", "a") as f:
        assert isinstance(astring, str)
        f.write(astring + "\n")
        f.close()