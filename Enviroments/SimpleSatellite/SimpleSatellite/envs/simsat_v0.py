
import os
from time import sleep
from typing import Callable
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.simulation.Reward_functions import Reward_v1 
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
import pygame

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
class Simple_satellite_v0(gym.Env):
    def __init__(self,
            Reward: Callable[[gym.Env, int], float] = Reward_v1):
        super(Simple_satellite_v0, self).__init__()
        
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
        self.action_space = spaces.Discrete(4)

        # Observation space is composed as: 
        # state = [time(continous), theta(continous), busy(binary), memory_picture(discrete), memory_analyze_pic(discrete), locations of targets, locations of ground station]
        max_memory = self.SatSim.MEMORY_SIZE
        n_targets = self.SatSim.n_tagets
        n_gs = self.SatSim.n_gs
        self.observation_space = spaces.Dict({'Orbit': spaces.Box(low=0, high=31, shape=(1,)), 
                                                'Pos': spaces.Box(low=0, high=360., shape=(1,)),
                                                'Busy': spaces.Discrete(2),
                                                'Memory Level': spaces.Discrete(max_memory),
                                                'Images': spaces.MultiDiscrete([n_targets+1 for i in range(max_memory)]),
                                                'Analysis': spaces.MultiBinary(max_memory),
                                                'Targets': spaces.Box(low=0, high=360., shape=(n_targets,2)),
                                                'Ground Stations': spaces.Box(low=0, high=360., shape=(n_gs,2))})
        self.state = self.SatSim.get_state()
        self.Total_reward = 0
        self.Reward = Reward
        
    def step(self, action, render=False):
        # Take action 
        next_state, done = self.SatSim.update(action)
        Action_avaible = self.SatSim.action_is_posible()
        if render:
            self.render()
        # Only stop when action is needed to be taken
        while not Action_avaible and not done:
            next_state, done = self.SatSim.update(3)
            Action_avaible = self.SatSim.action_is_posible()
            if render:
                self.render()
        self.next_state = next_state
        self.done = done
        reward = self.Reward(self, action)

        self.state = next_state
        self.Total_reward += reward
        info = {}
        observation = self.state
        return observation, reward, done, info

    def reset(self):
        self.state = self.SatSim.reset()
        self.Total_reward = 0
        observation = self.state
        return observation 

    def render(self):
        if self.first_render:
            # start render enviroment
            self.view = SatelliteView(self.SatSim)
            self.first_render = False
        self.view.drawSim(self.SatSim, reward=float(self.Total_reward))
        sleep(.01)

    def close (self):
        pygame.quit()