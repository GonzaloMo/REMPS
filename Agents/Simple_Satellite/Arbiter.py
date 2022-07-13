import gym
from gym import spaces
import SimpleSatellite
import numpy as np
from ArbiterVoices.Planner import Planner_Voice
import IPython
from ArbiterVoices.utils import Action

class Arbiter:
    def __init__(self, env: gym.Env, tot_targets:int, n_targets_per_planner :int = 2, n_planners: int = 2):
        """
        Initialize the Arbiter
        Args:   
            env (gym.Env): environment
            tot_targets (int): total number of targets
            n_targets_per_planner (int): number of targets per planner
            n_planners (int): number of planners
        """
        self.env = env
        self.Voices = []
        for i in  range(n_planners):
            self.Voices.append(Planner_Voice(env.SatSim, n_targets_per_planner, tot_targets, name=f"V_{i}"))
        self.npp = n_targets_per_planner

    def take_action(self, obs, type_selec_method="Priority"):
        """
        Selects the action taken by the arbiter

        Args:
            obs (dict): observation from the environment
            type_selec_method (str): method to select the action
                "Priority": select the action with the highest priority
                "Weighted": select the action with the highest summed weight
        Returns:
            action (int): action to take
        """
        alpha = [1, 2]
        actions = [] 
        for i, voice in enumerate(self.Voices):
            current_action = voice.getAction(obs)
            priority = alpha[i]
            Voice_action = Action(current_action, priority)
            actions.append(Voice_action)

        if type_selec_method == "Priority":
            action = self.high_priority_selection(actions)
        elif type_selec_method == "Weighted":
            action = self.weighted_selection(actions)
        else:
            raise ValueError("Type must be either Priority or Weighted")
        return action

    def high_priority_selection(self, actions):
        """
        Order the voices from highest priority to lowest priority depending on an alpha parameter

        Args:
            actions (list[Action]): list of Action object suggested by each voice
        
        Returns:
            action (int): action to take
        """
        # sort actions in priority order
        actions.sort(key=lambda x: x.Value, reverse=True)

        # Try to take action with highest priority
        for a in range(len(actions)):
            # check if action is possible
            if self.env.SatSim.check_action(a.action) and a.action != 3:
                return a.action
        return 3
            
    def weighted_selection(self, actions):
        """
        Order the voices from weighted actions depending on an alpha parameter
        
        Args:
            actions (list[Action]): list of Action object suggested by each voice
        Returns:
            action (int): action to take
        """
        # index -> 0: take_image, 1: analyze, 2: dump, 3: idle
        Weighted_actions = [Action(0, 0), Action(0, 1), Action(0, 2), Action(0, 3)]
        for a in actions:
            Weighted_actions[a.action].Value += a.Value
        # sort actions in value order
        Weighted_actions.sort(key=lambda x: x.Value, reverse=True)
        # Try to take action with highest priority
        for a in range(actions):
            # check if action is possible
            if self.env.SatSim.check_action(a.action) and a.action != 3:
                return a.action
        return 3

    def reset_voices(self, obs):
        for i, voice in  enumerate(self.Voices):
            voice.get_plan(obs, amount=6)

    def render(self):
        self.env.render()



