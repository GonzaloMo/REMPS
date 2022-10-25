from time import sleep
from typing import Callable, Dict, Optional, Tuple, Any
import os
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.simulation.Reward_functions import Reward_v1 
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
import pygame

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
class Simple_satellite(gym.Env):
    def __init__(self,
            Reward: Callable[[gym.Env, int], float] = Reward_v1,
            random_take_picture_failure: bool = False,
            random_analyze_failure: bool = False,
            random_dump_failure: bool = False,
            action_space_type: str = "Simple",
            n_targets: int = 4,
            ) -> None:
        """
        Initialize the environment

        Input:
            Reward: Callable[[gym.Env, int], float]
            random: bool
            action_space_type: str
            n_targets: int
        """
        super(Simple_satellite, self).__init__()
        
        # set true so initialization is only done once
        self.first_render = True

        # Set random failure list
        random_failure = [random_take_picture_failure, random_analyze_failure, random_dump_failure]
        
        # save the satelite enviroment
        self.SatSim = SatelliteSim()
        
        # The actions available are:
        self.action_dict = {"Take Picture":0 ,
                            "Analyze":1,
                            "Dump": 2,
                            "Nothing": 3}
        self.action_list_names = ["Nothing"]

        # Create action name list
        if action_space_type=="Simple":
            self.action_list_names += ["Take Picture", "Analyze", "Dump"]
        elif action_space_type=="Advance":
            temp_list = []
            temp_list_a = []
            for i in range(n_targets):
                self.action_list_names.append("Take Picture img"+str(i+1))
                temp_list_a.append("Analyze img"+str(i+1))
                temp_list.append("Dump img"+str(i+1))
            self.action_list_names.extend(temp_list_a)
            self.action_list_names.extend(temp_list)

        # Define Discrete action space
        n_actions = len(self.action_list_names) 
        self.action_space = spaces.Discrete(n_actions)

        # Observation space is composed as: 
        # state = [time(continous), theta(continous), busy(binary), memory_picture(discrete), memory_analyze_pic(discrete), locations of targets, locations of ground station]
        max_memory = self.SatSim.MEMORY_SIZE
        n_targets = self.SatSim.n_targets
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
        self.action = action
        # Take action 
        next_state, done = self.SatSim.update(self.Number2Tuple_action(action))
        
        # Action_avaible = self.SatSim.action_is_posible()
        self.next_state = next_state

        self.done = done
        reward = self.Reward(self, action)
        self.state = next_state
        self.Total_reward += reward
        info = {}
        observation = self.state
        return (observation, reward, done, info)

    def reset(self, n_targ: int = 4) -> Dict[str, Any]:
        """
        Reset the enviroment to the start state
        Input:
            n_targ: int
        Output:
            observation: Dict[str, Any]
        """
        self.SatSim.reset(n_targ)
        self.state = self.SatSim.get_state()
        self.Total_reward = 0
        observation = self.state
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
        pygame.display.flip()
        sleep(.01)

    def close (self) -> None:
        """
        Close the enviroment
        """
        pygame.quit()

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
        action_name = self.Number2name_action(action)
        if "Take Picture" in action_name:
            action_tuple = (SatelliteSim.ACTION_TAKE_IMAGE, int(action_name[16:]))
        elif "Analyze" in action_name:
            action_tuple = (SatelliteSim.ACTION_ANALYSE, int(action_name[11:]))
        elif "Dump" in action_name:
            action_tuple = (SatelliteSim.ACTION_DUMP, int(action_name[8:]))
        else:
            action_tuple = (SatelliteSim.ACTION_DO_NOTHING, None)
        return action_tuple