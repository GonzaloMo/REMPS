import os
from time import sleep
from typing import Callable, List, Dict, Any, Tuple
os.environ['PYGAME_HIDE_SUPPORT_PROMPT'] = '1'
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from SimpleSatellite.envs.Utils.Reward_function.Standard import Reward as default_reward
from SimpleSatellite.envs.simulation.DrawSim import SatelliteView 
import pygame
from Agents.Architecture.ArbiterVoices.Wrapper import Voice

# import the gym class and spaces
import gym
from gym import spaces

import numpy as np
class Simple_satellite_Arb_v0(gym.Env):
    def __init__(self,
            Voices: List[Voice] = 0,   
            Reward: Callable[[gym.Env, int], float] = default_reward,
            random: bool = False,
            action_space_type: str = "Simple",
            n_targets: int = 4):
        super(Simple_satellite_Arb_v0, self).__init__()
        
        # set true so initialization is only done once
        self.first_render = True

        # save the satelite enviroment
        self.SatSim = SatelliteSim(random_tg=random, n_targets=n_targets)
        

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
        action_space = spaces.Discrete(n_actions)
        self.action_space = action_space

        # Observation space is composed as: 
        # state = [time(continous), theta(continous), busy(binary), memory_picture(discrete), memory_analyze_pic(discrete), locations of targets, locations of ground station]
        max_memory = self.SatSim.MEMORY_SIZE
        n_targets = self.SatSim.n_tagets
        n_gs = self.SatSim.n_gs
        # TODO: Multidiscrete is changed into a box until RLlib fixes the issues with handeling multi discrete and discrete only use boxes
        state_space = { 'Orbit': spaces.Box(low=0, high=31., shape=(1,), dtype=np.int8), #spaces.Discrete(31), 
                        'Pos': spaces.Box(low=0, high=360., shape=(1,)),
                        'Busy': spaces.Box(low=0, high=1, shape=(1,), dtype=np.int8),#spaces.Discrete(2),
                        'Memory Level': spaces.Box(low=0, high=max_memory+1, shape=(1,), dtype=np.int8), #spaces.Discrete(max_memory+1),
                        'Images': spaces.Box(low=0, high=n_targets, shape=(max_memory,), dtype=np.int8),#spaces.MultiDiscrete([n_targets+1 for i in range(max_memory)]),
                        'Analysis': spaces.Box(low=0, high=1, shape=(max_memory,), dtype=np.int8), #spaces.MultiBinary(max_memory),
                        'Targets': spaces.Box(low=0, high=360., shape=(n_targets,2)),
                        'Ground Stations': spaces.Box(low=0, high=360., shape=(n_gs,2))}
        voices_space = {}
        self.Voices = Voices
        for voice in Voices:
            voice_space = {'Action': action_space}
            if voice.extra_observation_space() is not None:
                    voice_space['Extra_Observation']: voice.extra_observation_space()
            voices_space[voice.name] = spaces.Dict(voice_space)
        self.observation_space = spaces.Dict({'State': spaces.Dict(state_space), **voices_space})
        self.state = self.SatSim.get_state()
        self.Total_reward = 0
        self.Reward = Reward
        
    def step(self, action):
        self.action = action
        # Take action Main environment
        next_state, done = self.SatSim.update(action)
        self.next_state = next_state           
        self.done = done
        reward = self.Reward(self, action)
        self.state = next_state
        self.Total_reward += reward
        info = {}
        observation = self.get_obs()
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
        pygame.display.flip()
        if self.action == SatelliteSim.ACTION_DO_NOTHING:
            sleep(.01)
        else:
            sleep(.01)

    def close (self):
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
        if self.SatSim.POWER_OPTION:
            observation["Power"] = np.array([state["Power"]], dtype=np.float32)
        for voice in self.Voices:
            observation[voice.name] = voice.get_voice_output(state)
        return observation

    def write_obs(self, obs: Dict[str, Any]):
        """
        Print the observation
        Input:
            obs: Dict[str, Any]
        """
        obs_str = '\n----------State-----------\n'
        for k, v in obs.items():
            obs_str += f"{k}: {v}\n"
        obs_str += '---------------------\n'
        return obs_str

    def write_obs_shape(self, obs: Dict[str, Any]):
        """
        Print the shape of the observation
        Input:
            obs: Dict[str, Any]
        """
        obs_str = '\n----------State Shape-----------\n'
        import collections
        # obs = collections.OrderedDict(sorted(obs.items()))
        for k, v in obs.items():
            if isinstance(v, np.ndarray) or isinstance(v, gym.spaces.box.Box):
                obs_str += f"{k}: {np.shape(v)}\n"
            else:
                obs_str += f"{k}: {type(v)}\n"
        obs_str += '---------------------\n'
        return obs_str
    
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