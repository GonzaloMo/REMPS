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
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.Utils.Reward_function.Standard import Reward as default_reward
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
import pygame
import random
from datetime import datetime

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
class Simple_satellite(gym.Env):
    def __init__(self,
            Reward: Callable[[gym.Env, int], float] = default_reward,
            action_space_type: str = "Simple",
            Log_dir: str = "./Logs/Simulation/",
            Max_image_goals_per_target: int = 10,
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
        self.SatSim = SatelliteSim(ECLIPSE_OPTION=True,**kwargs)
        

        # The actions available are:
        self.action_dict = {"take_picture":SatelliteSim.ACTION_TAKE_IMAGE,
                            "analyze":SatelliteSim.ACTION_ANALYSE,
                            "dump": SatelliteSim.ACTION_DUMP,
                            "idle": SatelliteSim.ACTION_DO_NOTHING}
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
        max_inf = 9999999999
        # TODO: Multidiscrete is changed into a box until RLlib fixes the issues with handeling multi discrete and discrete only use boxes
        obs_space = {'Orbit':           spaces.Box(low=0, high=max_inf, shape=(1,), dtype=np.int32), # current orbit
                                              'Pos':             spaces.Box(low=0, high=370., shape=(1,), dtype=np.float32), # current angular position
                                              'Busy':            spaces.Box(low=0, high=1, shape=(1,), dtype=np.int8),# busy or not
                                              'Memory Level':    spaces.Box(low=0, high=1., shape=(1,), dtype=np.float32), # memory used %/100
                                              'Images':          spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32),# n images per target taken
                                              'Analysis':        spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32), # n images per target analyzed
                                              'Targets':         spaces.Box(low=0, high=370., shape=(n_targets*2,), dtype=np.float32), # target initial and final position
                                              'Ground Stations': spaces.Box(low=0, high=370., shape=(n_gs*2,), dtype=np.float32), # ground station initial and final position
                                              'Goals':           spaces.Box(low=0, high=max_inf, shape=(n_targets,), dtype=np.int32),
                                              'Eclipse':         spaces.Box(low=0, high=max_inf, shape=(4,), dtype=np.float32),} # goals to be achieved
        if self.SatSim.POWER_OPTION:
            obs_space['Power'] = spaces.Box(low=-1., high=101., shape=(1,), dtype=np.float32)
        self.observation_space = spaces.Dict(obs_space)
        self.state = self.SatSim.get_state()
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
        self.done = done
        observation = self.get_obs()
        # self.print_obs_shape(observation)
        return observation, reward, done, info

    def reset(self, seed: int =None, options: Dict = {"n_targ": 4}) -> Dict[str, Any]:
        """
        Reset the enviroment to the start state
        Input:
            n_targ: int
        Output:
            observation: Dict[str, Any]
        """
        n_targ = options["n_targ"]
        self.SatSim.reset(n_targ)
        self.Total_reward = 0
        self.goals = self.generate_goals()
        self.initial_goals = self.goals.copy()
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
        goals = self.goals.copy()
        self.render_goals(goals)
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
        observation = {}
        observation["Orbit"] = np.array([state["Orbit"]], dtype=np.int32)
        observation["Pos"] = np.array([state["Pos"]], dtype=np.float32)
        observation["Busy"] = np.array([state["Busy"]], dtype=np.int8)
        observation["Memory Level"] = np.array([state["Memory Level"]/self.SatSim.MEMORY_SIZE], dtype=np.float32)
        observation["Analysis"] = np.zeros((self.SatSim.n_targets,), dtype=np.int32)
        observation["Images"] = np.zeros((self.SatSim.n_targets,), dtype=np.int32)
        for i in range(self.SatSim.MEMORY_SIZE):
            img = state["Images"][i]
            if img > 0:
                observation["Images"][img-1] += 1
                if state["Analysis"][i]:
                    observation["Analysis"][img-1] += 1
        observation["Targets"] = np.array(state["Targets"], dtype=np.float32).flatten()
        observation["Ground Stations"] = np.array(state["Ground Stations"], dtype=np.float32).flatten()
        observation["Goals"] = np.array(self.goals, dtype=np.int32)
        observation["Eclipse"] = np.array(state["Eclipse"], dtype=np.float32)
        if self.SatSim.POWER_OPTION:
            observation["Power"] = np.array([state["Power"]], dtype=np.float32)
        return observation

    def print_obs(self, obs: Dict[str, Any]):
        """
        Print the observation
        Input:
            obs: Dict[str, Any]
        """
        print('----------State-----------')
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
            action_tuple = (SatelliteSim.ACTION_TAKE_IMAGE, img)
        elif "analyze" in action_name:
            if self.action_space_type == "Simple":
                img = None
            else:
                img = int(action_name[11:])
            action_tuple = (SatelliteSim.ACTION_ANALYSE, img)
        elif "dump" in action_name:
            if self.action_space_type == "Simple":
                img = None
            else:
                img = int(action_name[8:])
            action_tuple = (SatelliteSim.ACTION_DUMP, img)
        else:
            action_tuple = (SatelliteSim.ACTION_DO_NOTHING, None)
        return action_tuple

    def generate_goals(self, Seed: int = None) -> List[int]:
        """
        Generate the goals
        """
        if Seed is None:
            Seed = np.random.randint(0, 2**32)
        goals = []
        Max_goals = self.Max_goals
        for i in range(self.SatSim.n_targets):
            random.seed(Seed+i)
            n = random.randint(0, Max_goals)
            goals.append(n)
        
        # Create Log folder
        if not os.path.exists(self.Log_dir):
            os.makedirs(self.Log_dir)
        with open(self.Log_dir+f"/Seed.yaml", "a") as f:
            f.write(f"    Goals_{self.SatSim.Sim_name}: {Seed}\n")
        return goals
    
    def render_goals(self, goals: List[int]) -> None:
        """
        Render the goals
        """
        screen = self.view.screen
        OFFSET_x = self.view.WIDTH*0.1
        hudwidth = self.view.WIDTH*0.8
        hudheight = self.view.IMAGE_SIZE*4
        Height = self.view.HEIGHT
        OFFSET_y = Height - self.view.IMAGE_SIZE
        # Percentage lines
        for i in range(0, 101, 25):
            y_a = OFFSET_y - hudheight * (i/100)
            pygame.draw.line(screen, SatelliteView.WHITE, (OFFSET_x, y_a), (OFFSET_x + hudwidth, y_a))
            name = self.view.font.render(str(i), True, SatelliteView.WHITE)
            screen.blit(name, (OFFSET_x-30, y_a-5))
        
        # Goals
        bar_width = hudwidth / (self.SatSim.n_targets+1)
        separation = bar_width/self.SatSim.n_targets
        for i in range(self.SatSim.n_targets):
            x_a = OFFSET_x + (bar_width+separation) * i
            init_goals = self.initial_goals[i]
            if init_goals > 0:
                g_per = 1 - (goals[i]/init_goals)
                y_a = OFFSET_y - hudheight * g_per
                pygame.draw.rect(screen, SatelliteView.GREEN, (x_a, y_a, bar_width, hudheight * g_per))
                if g_per < 0.01:
                    pygame.draw.line(screen, SatelliteView.GREEN, (x_a, y_a), (x_a + bar_width, y_a))
            else:
                pygame.draw.rect(screen, SatelliteView.GREY, (x_a, OFFSET_y-hudheight, bar_width, hudheight))
            name = self.view.font.render(f"T_{i+1}", True, SatelliteView.WHITE)
            screen.blit(name, (x_a+bar_width/2-10, OFFSET_y+10))

            init_goal_str = self.view.font.render(f"{init_goals}", True, SatelliteView.WHITE)
            screen.blit(init_goal_str, (x_a+bar_width/2-10, OFFSET_y-hudheight-20))
