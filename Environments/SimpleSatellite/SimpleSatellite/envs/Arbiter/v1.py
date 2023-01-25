"""
copyright © 2023
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
import pygame
import random
from datetime import datetime
from Agents.Architecture.ArbiterVoices.Wrapper import Voice

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
class Simple_satellite(gym.Env):
    def __init__(self,
            Reward: Callable[[gym.Env, int], float] = default_reward,
            action_space_type: str = "Simple",
            Voices: List[Voice] = 0,  
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
        self.Max_goals = Max_image_goals_per_target

        # save the satelite enviroment
        kwargs["Log_dir"] = Log_dir
        self.simulation_version = "Sim_" + simulation_version
        if simulation_version == "v1":
            from SimpleSatellite.envs.simulation.v1_old import SatelliteSim
            self.SatSim = SatelliteSim(ECLIPSE_OPTION=True,**kwargs)
        elif simulation_version == "v2":
            from SimpleSatellite.envs.simulation.v2 import SatelliteSim
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
        action_space = spaces.Discrete(n_actions)
        self.action_space = action_space

        # Observation space is composed as: 
        n_targets = self.SatSim.n_targets
        n_gs = self.SatSim.n_gs
        max_inf = 9999999999
        # State Observation
        state_space = { 'Orbit':           spaces.Box(low=0, high=max_inf, shape=(1,), dtype=np.int32), # current orbit
                        'Pos':             spaces.Box(low=0, high=370., shape=(1,), dtype=np.float32), # current angular position
                        'Busy':            spaces.Box(low=0, high=1, shape=(1,), dtype=np.int8),# busy or not
                        'Memory Level':    spaces.Box(low=0, high=1., shape=(1,), dtype=np.float32), # memory used %/100
                        'Images':          spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32),# n images per target taken
                        'Analysis':        spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32), # n images per target analyzed
                        'Targets':         spaces.Box(low=0, high=370., shape=(n_targets*2,), dtype=np.float32), # target initial and final position
                        'Ground Stations': spaces.Box(low=0, high=370., shape=(n_gs*2,), dtype=np.float32), # ground station initial and final position
                        'Eclipse':         spaces.Box(low=0, high=max_inf, shape=(4,), dtype=np.float32),
                        'Image Dumped':    spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32),} # Images dumped
        if self.SatSim.POWER_OPTION:
            state_space['Power'] = spaces.Box(low=-1., high=101., shape=(1,), dtype=np.float32)

        # Voice Observation
        voices_space = {}
        self.Voices = Voices
        for voice in Voices:
            voice_space = {'Action': action_space}
            if voice.extra_observation_space() is not None:
                    voice_space['Extra_Observation']: voice.extra_observation_space()
            voices_space[voice.name] = spaces.Dict(voice_space)
        
        # Define observation space
        self.observation_space = spaces.Dict({'State': spaces.Dict(state_space), **voices_space})
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
        self.image_dumped = np.array(self.SatSim.n_images_dumped, dtype=np.int32)
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
        self.image_dumped =  np.zeros((self.SatSim.n_targets,), dtype=np.int32)
        for voice in self.Voices:
            voice.reset()
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
        state_obs = {"Orbit":np.array([state["Orbit"]], dtype=np.int32),
                     "Pos": np.array([state["Pos"]], dtype=np.float32),
                     "Busy": np.array([state["Busy"]], dtype=np.int8),
                     "Memory Level": np.array([state["Memory Level"]/self.SatSim.MEMORY_SIZE], dtype=np.float32),
                     "Analysis": np.zeros((self.SatSim.n_targets,), dtype=np.int32),
                     "Images": np.zeros((self.SatSim.n_targets,), dtype=np.int32),
                     "Targets": np.array(state["Targets"], dtype=np.float32).flatten(),
                     "Ground Stations": np.array(state["Ground Stations"], dtype=np.float32).flatten(),
                     "Eclipse": np.array(state["Eclipse"], dtype=np.float32),
                     "Image Dumped": np.array(self.image_dumped, dtype=np.int32)}
        for i in range(self.SatSim.MEMORY_SIZE):
            img = state["Images"][i]
            if img > 0:
                state_obs["Images"][img-1] += 1
                if state["Analysis"][i]:
                    state_obs["Analysis"][img-1] += 1
        if self.SatSim.POWER_OPTION:
            state_obs["Power"] = np.array([state["Power"]], dtype=np.float32)
        observation = {'State': state_obs}

        for voice in self.Voices:
            observation[voice.name] = voice.get_voice_output(state_obs)

        return observation

    def write_obs(self, obs: Dict[str, Any]):
        """
        Print the observation
        Input:
            obs: Dict[str, Any]
        """
        obs_str = '\n----------State-----------\n'
        for k, v in obs.items():
            obs_str += f"{k}: {v}\n"
        obs_str += '---------------------\n'
        return obs_str

    def write_obs_shape(self, obs: Dict[str, Any]):
        """
        Print the shape of the observation
        Input:
            obs: Dict[str, Any]
        """
        obs_str = '\n----------State Shape-----------\n'
        for k, v in obs.items():
            if isinstance(v, np.ndarray) or isinstance(v, gym.spaces.box.Box):
                obs_str += f"{k}: {np.shape(v)}\n"
            else:
                obs_str += f"{k}: {type(v)}\n"
        obs_str += '---------------------\n'
        return obs_str
    
    
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
    
