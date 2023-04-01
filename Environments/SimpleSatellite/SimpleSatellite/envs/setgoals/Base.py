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
import pygame
import random
from datetime import datetime

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
from numpy.random import default_rng
rng = default_rng()

class Base_Simple_satellite(gym.Env):
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
        super(Base_Simple_satellite, self).__init__()
        
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
        

    def render(self) -> None:
        """
        Render the enviroment
        """
        if self.first_render:
            # start render enviroment
            self.view = SatelliteView(self.SatSim)
            self.first_render = False
        action_taken = self.Tuple2Name_action(self.SatSim.Taking_action_tuple).upper().replace("_", " ")
        self.view.drawSim(self.SatSim, action_name=action_taken)
        self.view.drawReward(self.Total_reward)
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
        pos = state["Pos"]
        observation = { "Pos": self.pos_to_sin_and_cos(pos),
                        "Busy": np.array([state["Busy"]] , dtype=np.int32),
                        "Memory Level": np.array([state["Memory Level"]/self.SatSim.MEMORY_SIZE], dtype=np.float32),
                        "Analysis": np.zeros((self.SatSim.n_targets,), dtype=np.int32),
                        "Images": np.zeros((self.SatSim.n_targets,), dtype=np.int32),
                        "Targets": self.pos_to_sin_and_cos(state["Targets"]).flatten(),
                        "Ground Stations": self.pos_to_sin_and_cos(state["Ground Stations"]).flatten(),
                        "Goals": self.goal_percentage(self.goals),
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

    def pos_to_sin_and_cos(self, pos: np.ndarray) -> np.ndarray:
        """
        Convert the position to sin and cos
        Input:
            pos: np.ndarray, angular position in degrees
        Output:
            pos: np.ndarray, sin and cos of the angular position
        """
        n_pos = np.array(self.SatSim.position_transformation(pos), dtype=np.float32)
        return n_pos

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
            if isinstance(v, np.ndarray) or isinstance(v, spaces.Box):
                print(k+': ',np.shape(v))
            else:
                print(k+': ',type(v))
        print('---------------------')
    
    def print_obs_shape_compare(self, obs: Dict[str, Any], obs2: Dict[str, Any]):
        """
        Print the shape of the observation
        Input:
            obs: Dict[str, Any]
        """
        i = 0
        for k, v in obs.items():
            if isinstance(v, np.ndarray) or isinstance(v, spaces.Box):
                if np.shape(v) != np.shape(obs2[k]):
                    if i == 0:
                        print('----------State-----------')
                        i += 1
                    print(k+': ',np.shape(v), " | ", np.shape(obs2[k]), " <----")
            else:
                if type(v) != type(obs2[k]):
                    if i == 0:
                        print('----------State-----------')
                        i += 1
                    print(k+': ',type(v), " | ", type(obs2[k]), " <----")
        if i >0:
            print('---------------------')
    

    def print_obs_compare(self, obs: Dict[str, Any], obs2: Dict[str, Any]):
        """
        Print the shape of the observation
        Input:
            obs: Dict[str, Any]
        """
        print('----------State-----------')
        for k, v in obs.items():
            print(k+': ',v, " | ", obs2[k])
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

    def Tuple2Number_action(self, action_tuple: Tuple) -> int:
        """
        Convert action tuple to action number
        Input:
            action_tuple: Tuple[int, int]
        Output:
            action_number: int
        """
        if self.action_space_type == "Simple":
            return action_tuple[0]
        
        action, img = action_tuple
        if img is None:
            img = 0
        action_number = max(action-1,0)*self.SatSim.n_targets + img
        return action_number
    
    def Tuple2Name_action(self, action_tuple: Tuple) -> str:
        """
        Convert action tuple to action name
        Input:
            action_tuple: Tuple[int, int]
        Output:
            action_name: str
        """
        action_number = self.Tuple2Number_action(action_tuple)
        action_name = self.Number2name_action(action_number)
        return action_name

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

    def generate_goals(self, Seed: int = None) -> List[int]:
        """
        Generate the goals
        """
        if Seed is None:
            Seed = np.random.randint(0, 2**32)
        self.Seed = Seed
        n_targets = self.SatSim.n_targets
        Max_total_goals = self.Max_total_targets
        
        target_random = rng.choice(n_targets, size=n_targets, replace=False)
        goals = np.zeros((n_targets,))
        total_goals = 0
        for i in target_random:
            Max_goals = min(self.Max_goals, Max_total_goals - total_goals)
            random.seed(Seed+i)
            n = random.randint(0, Max_goals)
            if total_goals <= self.Max_total_targets:
                n = min(self.Max_total_targets - total_goals - n, n)
                
                goals[i] = n
                total_goals += n
            else:
                break
        if total_goals == 0:
            i = random.randint(0, n_targets)
            goals[i] = 1
            total_goals += 1
        
        # Create Log folder
        if not os.path.exists(self.Log_dir):
            os.makedirs(self.Log_dir)
        with open(self.Log_dir+f"/Seed.yaml", "a") as f:
            f.write(f"    Goals_{self.SatSim.Sim_name}: {Seed}\n")
        return goals
    
    def goal_percentage(self, goals: List[int]) -> np.ndarray:
        """
        Calculate the percentage of goals
        """
        g_per = []
        for i in range(self.SatSim.n_targets):
            init_goals = self.initial_goals[i]
            if init_goals > 0:
                g_per.append(goals[i]/init_goals)
            else:
                g_per.append(0)
        return np.array(g_per, dtype=np.float32)

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

    def load_config(self, 
                    Max_image_goals_per_target: int = 10,
                    Max_total_targets: int = None,
                    **kwargs) -> None:
        self.SatSim.load_config(**kwargs)
        self.Max_goals = Max_image_goals_per_target

        if Max_total_targets is not None:
            self.Max_total_targets = Max_total_targets
        else:
            self.Max_total_targets = self.SatSim.n_targets*self.Max_goals