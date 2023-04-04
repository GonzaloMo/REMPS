"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
from time import sleep
from typing import List, Callable, Dict, Optional, Tuple, Any
import os
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'

from SimpleSatellite.envs.Utils.Reward_function.Standard import Reward as default_reward
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
from SimpleSatellite.envs.setgoals.Base import Base_Simple_satellite
import pygame
import random
from datetime import datetime

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
from numpy.random import default_rng
rng = default_rng()

class Simple_satellite(Base_Simple_satellite):
    def __init__(self,
            Reward: Callable[[gym.Env, int], float] = default_reward,
            action_space_type: str = "Simple",
            Log_dir: str = "./Logs/Simulation/",
            Max_image_goals_per_target: int = 10,
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
        import importlib
        module_name = "SimpleSatellite.envs.simulation." + simulation_version
        simsat_pack = importlib.import_module(module_name, package=None)
        simsat_class = getattr(simsat_pack, "SatelliteSim")
        self.SatSim = simsat_class(ECLIPSE_OPTION=True, **kwargs)
        
        #
        self.load_config(Max_image_goals_per_target=Max_image_goals_per_target, **kwargs)

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
        n_targets = self.SatSim.n_targets
        n_gs = self.SatSim.n_gs
        max_inf = np.inf
        obs_space = {
                    'Pos':             spaces.Box(low=-1, high=1., shape=(2,), dtype=np.float32), # current angular position
                    'Busy':            spaces.Box(low=0, high=1, shape=(1,), dtype=np.int32),# spaces.Discrete(2),# busy or not 
                    'Memory Level':    spaces.Box(low=0, high=1., shape=(1,), dtype=np.float32), # memory used %/100
                    'Images':          spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32),# n images per target taken
                    'Analysis':        spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32), # n images per target analyzed
                    'Targets':         spaces.Box(low=-1, high=1., shape=(n_targets*4,), dtype=np.float32), # target initial and final position in cos,sin
                    'Ground Stations': spaces.Box(low=-1, high=1., shape=(n_gs*4,), dtype=np.float32), # ground station initial and final position in cos,sin
                    'Goals':           spaces.Box(low=0., high=max_inf, shape=(n_targets,), dtype=np.int32), # percentage of goals achieved
                    'Eclipse':         spaces.Box(low=-1, high=1, shape=(1,), dtype=np.int32), # Is it in light or not
                    } 
        if self.SatSim.POWER_OPTION:
            obs_space['Power'] = spaces.Box(low=0., high=1., shape=(1,), dtype=np.float32)
        self.observation_space = spaces.Dict(obs_space)
        # self.reset()
        # self.state = self.SatSim.get_state()
        self.Total_reward = 0
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
        # Goals achieved
        goals = self.initial_goals - np.array(self.SatSim.n_images_dumped)
        goals[goals<0] = 0
        self.goals = goals
        self.Total_reward += reward
        info = {}  
        # Check episode done
        terminated = False
        if np.all(goals==0):   
            terminated = True
        if terminated or truncated:
            done = True
        else:
            done = False
        self.step_count += 1
        self.done = done
        observation = self.get_obs()
        self.print_obs_shape_compare(observation, self.observation_space)
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
        self.goals = self.generate_goals()
        self.initial_goals = self.goals.copy()
        observation = self.get_obs()
        return observation
        

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
        observation = { "Pos": self.pos_to_sin_and_cos(pos),
                        "Busy": np.array([state["Busy"]] , dtype=np.int32),
                        "Memory Level": np.array([state["Memory Level"]/self.SatSim.MEMORY_SIZE], dtype=np.float32),
                        "Analysis": np.zeros((self.SatSim.n_targets,), dtype=np.int32),
                        "Images": np.zeros((self.SatSim.n_targets,), dtype=np.int32),
                        "Targets": self.pos_to_sin_and_cos(state["Targets"]).flatten(),
                        "Ground Stations": self.pos_to_sin_and_cos(state["Ground Stations"]).flatten(),
                        "Goals": np.array(self.goals, dtype=np.int32),
                        }
        for i in range(self.SatSim.MEMORY_SIZE):
            img = state["Images"][i]
            if img > 0:
                observation["Images"][img-1] += 1
                if state["Analysis"][i]:
                    observation["Analysis"][img-1] += 1
        

        # Check if the satellite is in light
        light_range = int(self.SatSim.check_light())
        observation["Eclipse"] = np.array([light_range], dtype=np.int32)
        if self.SatSim.POWER_OPTION:
            observation["Power"] = np.array([state["Power"]/100], dtype=np.float32)
        return observation