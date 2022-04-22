
import os
from time import sleep
from typing import Callable
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'
from simulation.Simulation import SatelliteSim
from simulation.Reward_functions import Reward_v1 
from simulation.DrawSim import SatelliteView 
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
        
        self.observation_space = spaces.Box(low=np.array([0.0, 0.0, 0, 0, 0]), high=np.array([999999999, 360.0, 1, max_memory, max_memory]),
                                            shape=(5,), dtype=np.float)
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
        observation = np.array(self.state, dtype=object)
        # if not(observation.shape == self.observation_space.shape):
        #     print('Observation_space')
        #     print(self.observation_space.shape)
        #     print('Observation')
        #     print(observation.shape)
        return observation, reward, done, info

    def reset(self):
        self.SatSim.reset()
        self.state = self.SatSim.get_state()
        self.Total_reward = 0
        observation = np.array(self.state)
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