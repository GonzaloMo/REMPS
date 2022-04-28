import os
from time import sleep
from typing import Callable
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.simulation.Reward_functions import Reward_v1 
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
from SimpleSatellite.envs.Planner.AgentPDDL import PDDLAgent
import pygame

# import the gym class and spaces
import gym
from gym import spaces
from typing import Dict,List
from simulation.Utils import BaseVoice

import numpy as np
class Simple_satellite_v0(gym.Env):
    def __init__(self,
            Voices: List[BaseVoice],
            Reward: Callable[[gym.Env, int], float] = Reward_v1,
            ):
        super(Simple_satellite_v0, self).__init__()

        # Voices
        self.n_voices = len(Voices)
        self.Voices = {}
        for agent in Voices:
            self.Voices[agent.name] = agent

        # set true so initialization is only done once
        self.first_render = True

        # save the satelite enviroment
        self.SatSim = SatelliteSim()

        # The actions available are:
        self.action_dict = {"Take":0 ,
                            "Analyze":1,
                            "Dump": 2,
                            "Nothing": 3}
        self.action_list_names = ["Take","Analyze","Dump","Nothing"]
        self.n_action = len(self.action_list_names)
        self.action_space = spaces.Discrete(self.n_action)

        ### Observation space: 
        # Voice Action observation space
        obs_act_space = [len(self.n_action)for i in range(self.n_voices)]
        obs_dict = {'Actions': spaces.MultiDiscrete(obs_act_space)}
        # Voices Added observation Space
        for v, k in self.Voices.items():
            if hasattr(v, 'added_observation_space'):
                obs_dict[k] = v.added_observation_space
        # State Observation Space
        max_memory = self.SatSim.MEMORY_SIZE
        n_targets = self.SatSim.n_tagets
        n_gs = self.SatSim.n_gs
        obs_dict['State'] = spaces.Dict({'Orbit': spaces.Box(low=0, high=31., shape=(1,), dtype=np.int8), 
                                                'Pos': spaces.Box(low=0, high=360., shape=(1,)),
                                                'Busy': spaces.Box(low=0, high=1, shape=(1,), dtype=np.int8),
                                                'Memory Level': spaces.Box(low=0, high=max_memory+1, shape=(1,), dtype=np.int8), 
                                                'Images': spaces.Box(low=0, high=n_targets, shape=(max_memory,), dtype=np.int8),
                                                'Analysis': spaces.Box(low=0, high=1, shape=(max_memory,), dtype=np.int8), 
                                                'Targets': spaces.Box(low=0, high=360., shape=(n_targets,2)),
                                                'Ground Stations': spaces.Box(low=0, high=360., shape=(n_gs,2))})
        self.observation_space = spaces.Dict(obs_dict)

        # Reward Initialization
        self.Total_reward = 0
        self.Reward = Reward
        
    def step(self, action):
        # Take action 
        self.action = action
        state = self.SatSim(action)

        # Build Full observation
        observation = self.getFullObs(state)
        self.obs = observation 
        
        # Check if state is terminal
        if self.isterminal():
            done = True
        else: 
            done = False
        self.done = done

        # Calculate reward
        reward = self.Reward(self, action)
        self.Total_reward += reward

        info = {}
        return observation, reward, done, info

    def reset(self):
        state = self.SatSim.reset()
        observation = self.getFullObs(state)
        self.Total_reward = 0
        observation = self.state
        return observation 

    def render(self):
        # if self.first_render:
        #     # start render enviroment
        #     self.view = SatelliteView(self.SatSim)
        #     self.first_render = False
        from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
        self.view = SatelliteView(self.SatSim)
        self.view.drawSim(self.SatSim, reward=float(self.Total_reward))
        # self.print_obs(self.next_state)
        if self.action == 3:
            sleep(.01)
        else:
            sleep(.1)

    def close (self):
        pygame.quit()

    def isterminal(self):
        # TODO: set terminal conditions
        return True

    def print_obs(self, obs):
        print('----------State-----------')
        for k, v in obs.items():
            print(k+': ',v)
        print('---------------------')
    def print_obs_shape(self,obs):
        print('----------State-----------')
        for k, v in obs.items():
            if isinstance(v, np.ndarray):
                print(k+': ',np.shape(v))
            else:
                print(k+': ',type(v))
        print('---------------------')
    
    def getFullObs(self, state):
        # Obtain Voices action and added observation
        actions = []
        added_state = {} 
        for v, k in self.Voices.items(): 
            actions.append(v.getAction(self.SatSim))
            added_state[k] = v.added_observation
        obs = {'Actions': np.array(actions, dtype=np.int8),
                'State': state,
                **added_state}
        return obs