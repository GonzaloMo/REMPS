"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
from time import sleep
from typing import List, Callable, Dict, Optional, Tuple, Any, Union
import os
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'

from SimpleSatellite.envs.Utils.Reward_function.Standard import Reward as default_reward
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
import pygame
import random
from datetime import datetime
import importlib

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
class Simple_satellite(gym.Env):
    def __init__(self,
            Reward: Union[str, Callable[[gym.Env, int], float]] = default_reward,
            action_space_type: str = "Simple",
            Log_dir: str = "./Logs/Simulation/",
            simulation_version: str = "v1",
            **kwargs
            ) -> None:
        """
        Initialize the environment

        Input:
            Reward: Callable[[gym.Env, int], float]
            random: bool
            action_space_type: str
            **kwargs
        """
        super(Simple_satellite, self).__init__()
        
        # set true so initialization is only done once
        self.first_render = True
        self.Log_dir = Log_dir

        # save the satelite enviroment
        kwargs["Log_dir"] = Log_dir
        self.simulation_version = "Sim_" + simulation_version
        if simulation_version == "v1":
            from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
            self.SatSim = SatelliteSim(ECLIPSE_OPTION=True,**kwargs)
        elif simulation_version == "v2":
            from SimpleSatellite.envs.simulation.Simulation_v2 import SatelliteSim
            self.SatSim = SatelliteSim(ECLIPSE_OPTION=True,**kwargs)

        # The actions available are:
        self.action_dict = {"take_picture":self.SatSim.ACTION_TAKE_IMAGE,
                            "analyze":self.SatSim.ACTION_ANALYSE,
                            "dump": self.SatSim.ACTION_DUMP,
                            "idle": self.SatSim.ACTION_DO_NOTHING}
        self.action_list_names = ["idle"]

        # Create action name list
        self.action_space_type = action_space_type
        if action_space_type=="Simple":
            self.action_list_names += ["take_picture", "analyze", "dump"]
        elif action_space_type=="Advance":
            temp_list = []
            temp_list_a = []
            for i in range(self.SatSim.n_targets):
                self.action_list_names.append("take_picture img"+str(i+1))
                temp_list_a.append("analyze img"+str(i+1))
                temp_list.append("dump img"+str(i+1))
            self.action_list_names.extend(temp_list_a)
            self.action_list_names.extend(temp_list)
        else:
            raise ValueError("action_space_type must be Simple or Advance")

        # Define Discrete action space
        n_actions = len(self.action_list_names) 
        self.action_space = spaces.Discrete(n_actions)

        # Observation space is composed as: 
        n_gs = self.SatSim.n_gs
        max_inf = np.inf
        obs_space = {
                    'Busy':            spaces.Box(low=0, high=1, shape=(1,), dtype=np.int8),# busy or not
                    'Memory Level':    spaces.Box(low=0, high=1., shape=(1,), dtype=np.float32), # memory used %/100
                    'Images':          spaces.Box(low=0, high=max_inf, shape=(1,), dtype=np.int32),# n images per target taken
                    'Analysis':        spaces.Box(low=0, high=max_inf, shape=(1,), dtype=np.int32), # n images per target analyzed
                    'Opportunity':     spaces.Box(low=0, high=1., shape=(1,), dtype=np.int8), # target initial and final position
                    'Ground Stations': spaces.Box(low=0, high=1., shape=(1,), dtype=np.int8), # ground station initial and final position
                    'Eclipse':         spaces.Box(low=0, high=1., shape=(1,), dtype=np.int8),} # goals to be achieved
        if self.SatSim.POWER_OPTION:
            obs_space['Power'] = spaces.Box(low=-1., high=101., shape=(1,), dtype=np.float32)
        self.observation_space = spaces.Dict(obs_space)
        self.state = self.SatSim.get_state()
        self.Total_reward = 0
        if type(Reward)==str:
            if Reward == "default":
                self.Reward = default_reward
            else:            
                reward_lib = importlib.import_module(Reward, package=None)
                self.Reward = getattr(reward_lib, )
        else:
            self.Reward = Reward
        
       
    def step(self, action: int) -> Tuple[Dict[str, Any], float, bool, Dict]:
        """
        The step function is the main function of the enviroment. It takes an action and returns the next state, reward, done and info.
        Input:
            action: int
        Output:
            observation: Dict[str, Any] 
            reward: float
            done: bool
            info: Dict
        """
        action_tuple = self.Number2Tuple_action(action)
        # Get Reward
        reward = self.Reward(self, action_tuple)
        # Take action 
        next_state, truncated = self.SatSim.update(action_tuple)
        self.Total_reward += reward
        info = {}  
        # Check episode done
        terminated = False
        if terminated or truncated:
            done = True
        else:
            done = False
        self.step_count += 1
        self.done = done
        observation = self.get_obs()
        return observation, reward, done, info

    def reset(self) -> Dict[str, Any]:
        """
        Reset the enviroment to the start state
        Input:
            n_targ: int
        Output:
            observation: Dict[str, Any]
        """
        self.SatSim.reset()
        self.Total_reward = 0
        self.step_count = 0
        self.done = False
        observation = self.get_obs()
        return observation
        

    def render(self) -> None:
        """
        Render the enviroment
        """
        if self.first_render:
            # start render enviroment
            self.view = SatelliteView(self.SatSim)
            self.first_render = False
        self.view.drawSim(self.SatSim, self.Total_reward)
        self.view.draw_reward(self.Total_reward)
        pygame.display.flip()
        sleep(.01)

    def close (self) -> None:
        """
        Close the enviroment
        """
        pygame.quit()

    def get_obs(self) -> Dict[str, Any]:
        """
        Get the observation from the state
        Input:
            state: Dict[str, Any]
        Output:
            observation: Dict[str, Any]
        """
        state = self.SatSim.get_state()
        pos = state["Pos"]
        observation ={  
                        'Busy':            np.array([state["Busy"]], dtype=np.int8),# busy or not
                        'Memory Level':    np.array([state["Memory Level"]/self.SatSim.MEMORY_SIZE], dtype=np.float32), # memory used %/100
                        'Images':          np.zeros((1,), dtype=np.int32),# n images per target taken
                        'Analysis':        np.zeros((1,), dtype=np.int32), # n images per target analyzed
                        'Opportunity':     np.array([state["Opportunity"]], dtype = np.int8), # target initial and final position
                        }

        for i in range(self.SatSim.MEMORY_SIZE):
            img = state["Images"][i]
            if img == "O":
                observation["Images"][0] += 1
                if state["Analysis"][i]:
                    observation["Analysis"][0] += 1
        groundStations = state["Ground Stations"]
        if  any([gs[0] < pos < gs[1] for gs in groundStations]):
            observation["Ground Stations"] = np.array([1], dtype=np.int8)
        else:
            observation["Ground Stations"] = np.array([0], dtype=np.int8)

        # Check if the satellite is in light
        light_range = state["Eclipse"][0:2]
        if light_range[0] < pos < light_range[1]:
            observation["Eclipse"] = np.array([1], dtype=np.int32)
        else:
            observation["Eclipse"] = np.array([0], dtype=np.int32)
            
        if self.SatSim.POWER_OPTION:
            observation["Power"] = np.array([state["Power"]], dtype=np.float32)
        
        return observation

    def print_obs(self, obs: Dict[str, Any], add: str = ""):
        """
        Print the observation
        Input:
            obs: Dict[str, Any]
        """
        print(f'----------State{add}-----------')
        for k, v in obs.items():
            print(k+': ',v)
        print('---------------------')

    def print_obs_shape(self, obs: Dict[str, Any]):
        """
        Print the shape of the observation
        Input:
            obs: Dict[str, Any]
        """
        print('----------State-----------')
        for k, v in obs.items():
            if isinstance(v, np.ndarray):
                print(k+': ',np.shape(v))
            else:
                print(k+': ',type(v))
        print('---------------------')
    
    def Name2number_action(self, action_name: str) -> int:
        """
        Convert action name to action number
        Input:
            action_name: str
        Output:
            action_number: int
        """
        return self.action_list_names.index(action_name)

    def Number2name_action(self, action_number: int) -> str:
        """
        Convert action number to action name
        Input:
            action_number: int
        Output:
            action_name: str
        """
        return self.action_list_names[action_number]

    def Number2Tuple_action(self, action: int) -> Tuple[int, int]:
        """
        Convert action number to action tuple
        Input:
            action: int
        Output:
            action_tuple: Tuple[int, int]
        """
        if self.action_space_type == "Simple":
            return (action, None)
        action_name = self.Number2name_action(action)
        action_tuple = self.Name2Tuple_action(action_name)
        return action_tuple

    def Name2Tuple_action(self, action_name: str) -> Tuple[int, int]:
        """
        Convert action name to action tuple
        Input:
            action_name: str
        Output:
            action_tuple: Tuple[int, int]
        """
        if "take_picture" in action_name:
            if self.action_space_type == "Simple":
                img = None
            else:
                img = int(action_name[16:])
            action_tuple = (self.SatSim.ACTION_TAKE_IMAGE, img)
        elif "analyze" in action_name:
            if self.action_space_type == "Simple":
                img = None
            else:
                img = int(action_name[11:])
            action_tuple = (self.SatSim.ACTION_ANALYSE, img)
        elif "dump" in action_name:
            if self.action_space_type == "Simple":
                img = None
            else:
                img = int(action_name[8:])
            action_tuple = (self.SatSim.ACTION_DUMP, img)
        else:
            action_tuple = (self.SatSim.ACTION_DO_NOTHING, None)
        return action_tuple