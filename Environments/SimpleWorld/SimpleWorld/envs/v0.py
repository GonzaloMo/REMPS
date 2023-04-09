
import gym
from importlib import import_module
from SimpleWorld.SimpleWorld.envs import Simulation_Versions
import os 

class Env_Wrap(gym.Env):
    def __init__(self, SimV="v0"):
        # Initalize Gridworld Sim
        assert SimV in Simulation_Versions.keys(), f" Simulation Version {SimV} is not register as Simulation version in SimpleWorld"
        SimModule = import_module(Simulation_Versions[SimV])
        self.sim = SimModule.Gridworld(grid_size=10, problem_type='Train_env', debug=False, verbose=False, render_type = 'ASCII')
        self.num_steps = 0

    def step(self, action):
        return []
    
    def reset(self):
        return []
    
    def render()
        
        
        