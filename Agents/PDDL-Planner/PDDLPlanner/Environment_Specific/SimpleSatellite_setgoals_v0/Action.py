from typing import Dict, List, Tuple, Union, Any
import gym
import SimpleSatellite

class Action:
    def __init__(self, env: gym.Env, action_name: str, preconditions: Dict[str, Any]=None):
        self.action_name = action_name
        self.action = env.Name2number_action(action_name)
        self.action_tuple = env.Name2Tuple_action(action_name)
        self.preconditions = preconditions

    def __str__(self):
        return f"{self.action_name}"
    
    def get_action_gym(self) -> int:
        return self.action    
    
    def check_preconditions(self, obs: Dict[str, Any]) -> bool:
        pos = obs["Pos"]
        orbit = obs["Orbit"]
        Full_Position = pos + orbit*360
        if self.preconditions is not None:
            min_exec_pos = self.preconditions["Pos"] - self.preconditions["Margin"]
            max_exec_pos = self.preconditions["Pos"] + self.preconditions["Margin"]
            if min_exec_pos < Full_Position < max_exec_pos:
                return True
            else:
                return False
        else:
            return True