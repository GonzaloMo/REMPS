
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

class Gridworld_planfollowing_env(gym.Env):
    def __init__(self, 
                SimV="v0", 
                n_obstacle_range={"Agent": [0,80], 
                                  "Planner":[0,80]}, 
                NDAO = {"Distance": 3,
                        "Probability": .1},
                **kwargs):
        # Initalize Gridworld Sim

        assert SimV in Simulation_Versions.keys(), f" Simulation Version {SimV} is not register as Simulation version in SimpleWorld"

        
        SimModule = import_module(Simulation_Versions[SimV])
        self.sim = SimModule.Gridworld(**kwargs)
        self.n_obstacle_range = {}
        for k, v in n_obstacle_range.items():
            self.n_obstacle_range[k] = np.clip(v, a_min=0, a_max=int(.6*self.sim.grid_size**2))
        
        self.num_steps = 0

        # Action space
        '''Define actions'''
        self.actions = [0, 1, 2, 3]
        self.num_action = len(self.actions)
        self.action_dict = {'Up': 0, 'Down': 1, 'Left': 2, 'Right': 3} 
        self.action_list = ['Up', 'Down', 'Left', 'Right']
        self.action_pos_dict = [[0,-1], [0,1], [-1, 0], [1,0]]    

        '''Define action and action space'''
        self.action_space = spaces.Discrete(len(self.actions))
        self.action_shape = len(self.actions)

        # Observation Space 
        state_shape = (self.sim.grid_size*self.sim.grid_size, )
        self.observation_space = spaces.Dict({'Map': spaces.Box(low=0, high=self.sim.obstacleTag, shape=state_shape, dtype=np.int32),
                                              'Planner_Map': spaces.Box(low=0, high=self.sim.obstacleTag, shape=state_shape, dtype=np.int32)})  

    def step(self, action):
        done = self.move(action)
        self.timestep +=1
        observation, reward, done, info = self.get_obs(), 0, done, {}
        return observation, reward, done, info
    
    def reset(self):
        self.timestep = 0
        n_obstacle = random.randint(*self.n_obstacle_range["Agent"])
        self.Map, self.start_pos, self.goal_pos  = self.sim.CreateFullMap(n_obstacle)
        n_obstacle = random.randint(*self.n_obstacle_range["Planner"])
        self.Map_planner = self.sim.Generate_Obstacles(deepcopy(self.Map), n_obstacle)
        self.pos = np.array(deepcopy(self.start_pos))
        return self.get_obs(), {}
    
    def get_obs(self):
        obs = {
            "Map": np.array(self.Map, dtype=np.int32).flatten(),
            "Planner_Map": np.array(self.plan_obs(), dtype=np.int32).flatten(),
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
        new_pos = np.clip(self.pos - np.array(self.action_pos_dict[action]), a_min=0, a_max=self.sim.grid_size-1)
        i, j = self.pos
        i_n, j_n = new_pos
        if self.Map[i_n, j_n] == self.sim.freeSpaceTag or self.Map[i_n, j_n] == self.sim.goalPositionTag:
            if self.Map[i_n, j_n] == self.sim.goalPositionTag:
                done = True
            self.Map[i,j] = self.sim.freeSpaceTag
            self.Map[i_n,j_n] = self.sim.positionTag
            self.pos = deepcopy(new_pos)
            return done
        
    def plan_obs(self):
        i_p, j_p = np.reshape(np.array(np.where(self.Map_planner==self.sim.positionTag)), (2,))
        Map = deepcopy(self.Map_planner)
        Map[i_p,j_p] = self.sim.freeSpaceTag
        Map[self.pos[0], self.pos[1]] =  self.sim.positionTag
        return Map
        
        