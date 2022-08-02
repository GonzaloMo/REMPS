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
class Simple_satellite_Arb_v1(gym.Env):
    def __init__(self,
            Reward: Callable[[gym.Env, int], float] = Reward_v1,
            random: bool = False,
            n_targets: int = 4,
            seed: int = None,
            log_dir: str = None):
        super(Simple_satellite_Arb_v1, self).__init__()
        
        # set true so initialization is only done once
        self.first_render = True

        # save the satelite enviroment
        self.SatSim = SatelliteSim(random_tg=random, n_targets=n_targets, log_dir=log_dir)
        

        # The actions available are:
        self.action_dict = {"Take Picture":0 ,
                            "Analyze":1,
                            "Dump": 2,
                            "Nothing": 3}
        self.action_list_names = ["Nothing"]
        temp_list = []
        temp_list_a = []
        for i in range(n_targets):
            self.action_list_names.append("Take Picture img"+str(i+1))
            temp_list_a.append("Analyze img"+str(i+1))
            temp_list.append("Dump img"+str(i+1))
        self.action_list_names.extend(temp_list_a)
        self.action_list_names.extend(temp_list)
        n_actions = len(self.action_list_names) 
        self.action_space = spaces.Discrete(n_actions)

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
        action_name = self.action_list_names[action]
        if "Take Picture" in action_name:
            action_tuple = (SatelliteSim.ACTION_TAKE_IMAGE, int(action_name[16:]))
        elif "Analyze" in action_name:
            action_tuple = (SatelliteSim.ACTION_ANALYSE, int(action_name[11:]))
        elif "Dump" in action_name:
            action_tuple = (SatelliteSim.ACTION_DUMP, int(action_name[8:]))
        else:
            action_tuple = (SatelliteSim.ACTION_DO_NOTHING, None)
        # Take action 
        next_state, done = self.SatSim.update(action_tuple)
        self.next_state = next_state
        
        self.done = done
        reward = self.Reward(self, action_tuple[0])
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
        tot_v = len(Voices)
        i = 0.5
        for v in Voices:
            Initial_goals = np.sum(v.Goal_ref.Initial_goals)
            Current_goals = np.sum(v.Goal_ref.goals)
            goals_achieved = Initial_goals - Current_goals
            self.view.draw_percentage_of_goals_completed(goals_achieved, Initial_goals,v.name, i, tot_v)
            i+=1

        
        pygame.display.flip()
        if self.action == SatelliteSim.ACTION_DO_NOTHING:
            sleep(.01)
        else:
            sleep(.1)

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