
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

                name="Planner_0",
                Reward="v0",
                env_name="SimpleWorld-singlegoal-v0",
                env_setup="v0", 
                n_planner_obstacles= [],
                Missing_actions = {"Probability": 0.,
                                   "Number": 0},

                n_obstacle_range={"Agent": [0,80], 
                                  "Planner":[0,80]}, 
                NDAO = {"Distance": 3,
                        "Probability": .1},

                plannerConfig = {},
                **kwargs):
        # Initalize Gridworld Sim
        super().__init__()
        self.env = gym.make(env_name, **env_setup)

        self.sim = self.env.sim
        print(plannerConfig)
        self.agent = PDDLPlanner.Planner(self.env, name=name, **plannerConfig)
        self.n_planner_obstacles = n_planner_obstacles
        self.Missing_actions = Missing_actions
        reward_module = import_module("SimpleWorld.envs.planfollowing.Reward_function.v0")
        reward_name = f"Reward_{Reward}"
        reward_list = list(vars(reward_module).keys())
        assert reward_name in reward_list, f"Reward function {Reward} is not register as Reward function in SimpleWorld"
        self.reward = getattr(reward_module, reward_name)

        # Action space
        self.actions, self.num_action, self.action_dict = self.env.actions, self.env.num_action, self.env.action_dict
        self.action_list, self.action_pos_dict = self.env.action_list, self.env.action_pos_dict 
        self.action_space = self.env.action_space

        # Observation Space 
        grid_size = self.env.sim.grid_size
        state_shape = (grid_size**2, )
        self.observation_space = spaces.Dict({**self.env.observation_space,
                                              'Planner_Map': spaces.Box(low=0, high=self.sim.obstacleTag, shape=state_shape, dtype=np.int32),
                                              'Next_state': spaces.Box(low=0, high=grid_size, shape=(2,), dtype=np.int32),})  
    def step(self, action):
        reward, info_reward = self.reward(self, action)
        _, _, done, info = self.env.step(action)
        self.pos = self.env.pos
        self.trim_plan(deepcopy(self.Map))
        self.info  = {**self.info , **info_reward}
        return self.get_obs(), reward, done, self.info
    
    def reset(self):
        _ = self.env.reset()
        self.info = {}
        self.Map, self.start_pos, self.goal_pos = self.env.Map, self.env.start_pos, self.env.goal_pos
        self.agent.generateDomain()
        if self.n_planner_obstacles == []:
            self.Map_planner = deepcopy(self.Map)
        else:
            n_obstacle = random.randint(*self.n_planner_obstacles)
            self.Map_planner = self.sim.Generate_Obstacles(deepcopy(self.Map), n_obstacle)
        self.blank_map = self.sim.Create_empty_map()
        self.get_plan()

        self.pos = np.array(deepcopy(self.start_pos))
        return self.get_obs(), self.info 
    
    def get_obs(self):
        obs_planner = deepcopy(self.blank_map)
        x, y = self.pos
        obs_planner[x][y] = self.sim.positionTag
        for a in self.plan:
            x, y  = a.getEffects().tolist()
            obs_planner[x][y] = self.sim.goalPositionTag
        obs_env = self.env.get_obs()
        obs = {
                **obs_env,
                "Planner_Map": np.array(obs_planner, dtype=np.int32).flatten(),
                "Next_state": np.array(self.next_plan_state, dtype=np.int32),
               }
        return obs
    
    def get_plan(self):
        self.plan = self.agent.get_plan(self.Map_planner)
        if self.Missing_actions["Probability"] > 0 and self.Missing_actions["Number"] > 0:
            n_missing = 0 
            max_actions = len(self.plan)
            while n_missing < self.Missing_actions["Number"] or n_missing < max_actions:
                prob = random.random()
                if prob < self.Missing_actions["Probability"]:
                    self.plan.pop(random.randint(0, len(self.plan)-1))
                    n_missing += 1
        self.next_plan_state = self.get_next_plan_state(0)
    
    def render(self, render_type="ASCII"):
        if not render_type == "":
            self.sim.full_Render(self.Map, render_type=render_type, path=[a.getEffects().tolist() for a in self.plan])
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
            self.pos = [i_n, j_n]
            return done

    
    def trim_plan(self, Map):
        self.info["Trimmed_plan_i"] = "None"
        for i, a in enumerate(self.plan):
            if a.checkEffects(Map):
                self.info["Trimmed_plan_i"] = i
                self.next_plan_state = self.get_next_plan_state(i)
                self.info["Next_state_trim"] = self.next_plan_state
                self.plan.pop(i)
                break
    
    def get_next_plan_state(self, i, initial=True):
        for j in range(i, len(self.plan)):
            x, y = self.plan[j].getEffects()
            if self.Map[x, y] == self.sim.freeSpaceTag or self.Map[x, y] == self.sim.goalPositionTag:
                return np.array([x, y])
        return np.array([x, y])
        
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

        