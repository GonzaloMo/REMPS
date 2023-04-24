
import gym
from gym import spaces
import numpy as np
from copy import deepcopy
from importlib import import_module
import PDDLPlanner
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
                env_name="SimpleWorld-sinlgegoal-v0",
                env_setup="v0", 
                n_obstacle_range={"Agent": [0,80], 
                                  "Planner":[0,80]}, 
                NDAO = {"Distance": 3,
                        "Probability": .1},
                plannerConfig = {},
                **kwargs):
        # Initalize Gridworld Sim
        super().__init__()
        self.env = gym.make(env_name, **env_setup)
        self.agent = PDDLPlanner.Planner(self, env_name="SimpleWorld-sinlgegoal-v0", **plannerConfig)
        # Action space
        '''Define actions'''
        self.actions = self.env.actions
        self.num_action = self.env.num_action
        self.action_dict = self.env.action_dict
        self.action_list = self.env.action_list
        self.action_pos_dict = self.env.action_pos_dict   

        '''Define action and action space'''
        self.action_space = self.env.action_space

        # Observation Space 
        state_shape = (self.sim.grid_size*self.sim.grid_size, )
        self.observation_space = spaces.Dict({**self.env.observation_space,
                                              'Planner_Map': spaces.Box(low=0, high=self.sim.obstacleTag, shape=state_shape, dtype=np.int32)})  
    def step(self, action):
        observation, reward, done, info = self.env.step(action)
        return observation, reward, done, info
    
    def reset(self):
        obs = self.env.reset()
        self.agent.generateDomain()
        
        n_obstacle = random.randint(*self.n_obstacle_range["Agent"])
        self.Map, self.start_pos, self.goal_pos  = self.sim.CreateFullMap(n_obstacle)
        if self.n_obstacle_range["Planner"] == []:
            self.Map_planner = deepcopy(self.Map)
        else:
            n_obstacle = random.randint(*self.n_obstacle_range["Planner"])
            self.Map_planner = self.sim.Generate_Obstacles(deepcopy(self.Map), n_obstacle)
        plan_obs = self.plan_obs()
        self.plan = self.agent.get_plan(plan_obs)
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
        
    def planner_obs(self):
        obs = {
            "Map": np.array(self.Map_planner, dtype=np.int32).flatten(),
            }
        return obs
    
    def plan_obs(self):
        obs = deepcopy(self.Map_planner)
        obs[obs == self.sim.obstacleTag] = self.sim.freeSpaceTag
        return obs

    def set_planner_name(self, name):
        self.agent.set_name(name)
        
        