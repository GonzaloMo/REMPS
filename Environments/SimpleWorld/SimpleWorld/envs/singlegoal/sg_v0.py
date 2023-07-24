
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

class Gridworld_singlegoal_env(gym.Env):
    def __init__(self, 
                 Reward = "v0",
                 SimV="v0", 
                 n_obstacle_range=[0,80], 
                 max_timestep=100,
                 NDAO = {
                        "Distance": 3,
                        "Probability": .0,
                        },
                 **kwargs):
        # Initalize Gridworld Sim

        assert SimV in Simulation_Versions.keys(), f" Simulation Version {SimV} is not register as Simulation version in SimpleWorld"
        reward_module = import_module("SimpleWorld.envs.singlegoal.Reward_function.v0")
        reward_name = f"Reward_{Reward}"
        reward_list = list(vars(reward_module).keys())
        assert reward_name in reward_list, f"Reward function {Reward} is not register as Reward function in SimpleWorld"
        self.Reward_name = reward_name
        self.max_timestep = max_timestep
        self.reward = getattr(reward_module, reward_name)
        SimModule = import_module(Simulation_Versions[SimV])
        self.sim = SimModule.Gridworld(**kwargs)
        self.n_obstacle_range = np.clip(n_obstacle_range, a_min=0, a_max=.5*self.sim.grid_size**2)
        self.NDAO = NDAO
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
        self.observation_space = spaces.Dict({'Map': spaces.Box(low=0, high=self.sim.obstacleTag, shape=state_shape, dtype=np.int32)})  

    def step(self, action):
        
        self.timestep +=1
        reward = self.reward(self, action)
        done = self.move(action)
        self.path.append(self.pos)
        observation = self.get_obs()
        info = {}
        if self.timestep >= self.max_timestep:
            done = True
        return observation, reward, done, info
    
    def reset(self):
        
        self.timestep = 0
        n_obstacle = random.randint(self.n_obstacle_range[0], self.n_obstacle_range[1])
        self.Map, self.start_pos, self.goal_pos  = self.sim.CreateFullMap(n_obstacle)
        self.pos = np.array(deepcopy(self.start_pos))
        self.path = [self.pos]
        self.color_path = ["b"]
        return self.get_obs(), {}
    
    def get_obs(self):
        obs = {
            "Map": np.array(self.Map, dtype=np.int32).flatten(),
               }
        return obs

    
    def render(self, render_type="ASCII", **kwargs):
        if not render_type == "":
            self.sim.full_Render(self.Map, render_type=render_type, **kwargs)
            
            if render_type == "PYGAME":
                self.sim.render_path(self.path, colorname=self.color_path)
                pygame.display.flip()
        sleep(.1)

    def quit(self):
        pass

    def move(self, action):
        done = False
        if self.NDAO["Probability"] > np.random.rand():
            self.color_path.append("k")
            dpos = np.random.randint(-self.NDAO["Distance"], self.NDAO["Distance"]+1, size=2)
        else:
            self.color_path.append("b")
            dpos = np.array(self.action_pos_dict[action])
        new_pos = np.clip(self.pos + dpos, a_min=0, a_max=self.sim.grid_size-1)
        i, j = self.pos
        i_n, j_n = new_pos
        if self.Map[i_n, j_n] == self.sim.freeSpaceTag or self.Map[i_n, j_n] == self.sim.goalPositionTag:
            if self.Map[i_n, j_n] == self.sim.goalPositionTag:
                done = True
            self.Map[i,j] = self.sim.freeSpaceTag
            self.Map[i_n,j_n] = self.sim.positionTag
            self.pos = deepcopy(new_pos)
            return done
        return done
        
        
        