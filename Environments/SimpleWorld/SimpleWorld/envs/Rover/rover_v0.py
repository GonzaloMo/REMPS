
import gym
from gym import spaces
import numpy as np
from copy import deepcopy
from importlib import import_module
import os 
import yaml 
import random
import pygame
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'
from time import sleep
direc = "/".join(str(__file__).split("/")[:-2]) 
# /home/ksb21109/Documents/PhD/REMPS/Environments/SimpleWorld/SimpleWorld/envs/singlegoal/v0.py
with open(f"{direc}/Simulation/simulationVersions.yaml", "r") as f:
    Simulation_Versions = yaml.load(f, Loader=yaml.FullLoader)

class Gridworld_Rover_env(gym.Env):
    goalTag = 4
    def __init__(self, SimV="v0", n_obstacle_range=[0,80], n_Goals_range=[2,10], **kwargs):
        # Initalize Gridworld Sim

        assert SimV in Simulation_Versions.keys(), f" Simulation Version {SimV} is not register as Simulation version in SimpleWorld"
        SimModule = import_module(Simulation_Versions[SimV])
        self.sim = SimModule.Gridworld(**kwargs)
        self.n_obstacle_range = np.clip(n_obstacle_range, a_min=0, a_max=.6*self.sim.grid_size**2)
        maxGoals = int(.1*self.sim.grid_size**2)
        self.n_Goals_range = np.clip(n_Goals_range, a_min=0, a_max=maxGoals)
        print(self.n_obstacle_range)
        print(self.n_Goals_range )

        # Action space
        '''Define actions'''
        # self.action_dict = {'Up': 0, 'Down': 1, 'Left': 2, 'Right': 3, 'Pick Up': 4, 'Drop':5} 
        # self.action_pos_dict = {'Up': [0,-1], 'Down': [0,1], 'Left': [-1, 0], 'Right': [1,0], 'Pick Up': [0,0], 'Drop':[0,0]} 
        self.action_dict = {'Up': 0, 'Down': 1, 'Left': 2, 'Right': 3} 
        self.action_pos_dict = {'Up': [0,-1], 'Down': [0,1], 'Left': [-1, 0], 'Right': [1,0]} 
        self.action_list = list(self.action_dict.keys())
        self.num_action = len(self.action_list)   
        self.actions = range(self.num_action)

        '''Define action and action space'''
        self.action_space = spaces.Discrete(self.num_action)

        # Observation Space 
        state_shape = (self.sim.grid_size*self.sim.grid_size, )
        self.observation_space = spaces.Dict({'Map':   spaces.Box(low=0, high=self.sim.obstacleTag, shape=state_shape, dtype=np.int32),}) 

    def step(self, action):
        done = self.move(action)
        self.timestep +=1
        observation, reward, done, info = self.get_obs(), 0, done, {}
        return observation, reward, done, info
    
    def reset(self):
        self.timestep = 0
        self.storage = 0
        n_obstacle = random.randint(self.n_obstacle_range[0], self.n_obstacle_range[1])
        self.Map, self.start_pos, self.goal_pos  = self.sim.CreateFullMap(n_obstacle)
        self.generateGoals()
        self.pos = np.array(deepcopy(self.start_pos))
        return self.get_obs(), {}
    
    def get_obs(self):
        obs = {
            "Map": np.array(self.Map, dtype=np.int32).flatten(),
               }
        return obs

    
    def render(self, render_type="ASCII"):
        if not render_type == "":
            self.sim.full_Render(self.Map, render_type=render_type)
            if render_type == "PYGAME":
                pygame.display.flip()
        sleep(.1)

    def quit(self):
        pass

    def move(self, action):
        done = False
        action_movment = self.action_pos_dict[self.action_list[action]]
        new_pos = np.clip(self.pos - np.array(action_movment), a_min=0, a_max=self.sim.grid_size-1)
        i, j = self.pos
        i_n, j_n = new_pos
        to_go_value = self.Map[i_n, j_n]
        if to_go_value == self.sim.freeSpaceTag or to_go_value == self.sim.goalPositionTag or to_go_value == self.goalTag:
            if self.Map[i_n, j_n] == self.sim.goalPositionTag:
                done = True
            self.Map[i,j] = self.sim.freeSpaceTag
            self.Map[i_n,j_n] = self.sim.positionTag
            self.pos = deepcopy(new_pos)
            return done
        
    def generateGoals(self):
        n_Goals = random.randint(self.n_Goals_range[0], self.n_Goals_range[1])
        self.goals_loc = []
        genGoals = 0 
        while genGoals < n_Goals:
            x = random.randint(1, self.sim.grid_size-2)
            y = random.randint(1, self.sim.grid_size-2)
            match = self.sim._check_location((x,y), self.Map)
            if not match: 
                self.Map[x][y] = self.goalTag
                self.goals_loc.append([x,y])
                genGoals += 1