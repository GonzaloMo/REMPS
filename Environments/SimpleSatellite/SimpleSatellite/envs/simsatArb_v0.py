import os
from time import sleep
from typing import Callable
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.simulation.Reward_functions import Reward_example_SSv0 as Reward
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
import pygame

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
class Simple_satellite_Arb_v0(gym.Env):
    def __init__(self,
            Reward: Callable[[gym.Env, int], float] = Reward,
            random: bool = False,
            n_targets: int = 4):
        super(Simple_satellite_Arb_v0, self).__init__()
        
        # set true so initialization is only done once
        self.first_render = True

        # save the satelite enviroment
        self.SatSim = SatelliteSim(random_tg=random, n_targets=n_targets)
        

        # The actions available are:
        self.action_dict = {"Nothing": 0,
                            "Take":1 ,
                            "Analyze":2,
                            "Dump": 3
                            }
        self.action_list_names = ["Nothing","Analyze","Dump","Take"]
        self.action_space = spaces.Discrete(4)

        # Observation space is composed as: 
        # state = [time(continous), theta(continous), busy(binary), memory_picture(discrete), memory_analyze_pic(discrete), locations of targets, locations of ground station]
        max_memory = self.SatSim.MEMORY_SIZE
        n_targets = self.SatSim.n_tagets
        n_gs = self.SatSim.n_gs
        # TODO: Multidiscrete is changed into a box until RLlib fixes the issues with handeling multi discrete and discrete only use boxes
        self.observation_space = spaces.Dict({'Orbit': spaces.Box(low=0, high=31., shape=(1,), dtype=np.int8), #spaces.Discrete(31), 
                                                'Pos': spaces.Box(low=0, high=360., shape=(1,)),
                                                'Busy': spaces.Box(low=0, high=1, shape=(1,), dtype=np.int8),#spaces.Discrete(2),
                                                'Memory Level': spaces.Box(low=0, high=max_memory+1, shape=(1,), dtype=np.int8), #spaces.Discrete(max_memory+1),
                                                'Images': spaces.Box(low=0, high=n_targets, shape=(max_memory,), dtype=np.int8),#spaces.MultiDiscrete([n_targets+1 for i in range(max_memory)]),
                                                'Analysis': spaces.Box(low=0, high=1, shape=(max_memory,), dtype=np.int8), #spaces.MultiBinary(max_memory),
                                                'Targets': spaces.Box(low=0, high=360., shape=(n_targets,2)),
                                                'Ground Stations': spaces.Box(low=0, high=360., shape=(n_gs,2))})
        self.state = self.SatSim.get_state()
        self.Total_reward = 0
        self.Reward = Reward_v1
        
    def step(self, action):
        self.action = action
        # Take action 
        next_state, done = self.SatSim.update(action)
        self.next_state = next_state
        
        self.done = done
        reward = self.Reward(self, action)
        self.state = next_state
        self.Total_reward += reward
        info = {}
        observation = self.state
        return observation, reward, done, info

    def reset(self, n_targ: int = 4, seed=None):
        self.state = self.SatSim.reset(n_targets=n_targ, seed=seed)
        self.Total_reward = 0
        observation = self.state
        return observation 

    def render(self, Voices):
        self.view = SatelliteView(self.SatSim)
        self.view.drawSim(self.SatSim)
        self.view.draw_arbiter(Voices, self.state)
        self.view.draw_pos(self.state)
        pygame.display.flip()
        if self.action == SatelliteSim.ACTION_DO_NOTHING:
            sleep(.01)
        else:
            sleep(.01)

    def close (self):
        pygame.quit()

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