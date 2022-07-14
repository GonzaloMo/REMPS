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
        self.n_targets = tot_targets
        self.Action_doNothing = Action(env.SatSim.ACTION_DO_NOTHING, "DoNothing")

    def take_action(self, obs, type_selec_method="Priority", action_type="Action_specific"):
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
            Voice_action = voice.getAction(obs)
            priority = alpha[i]
            Voice_action.set_value(priority)
            actions.append(Voice_action)

        if type_selec_method == "Priority":
            action = self.high_priority_selection(actions)
        elif type_selec_method == "Weighted":
            action = self.weighted_selection(actions)
        else:
            raise ValueError("Type must be either Priority or Weighted")
        self.prune_plan_voices(obs)
        if not action.action == self.env.SatSim.ACTION_DO_NOTHING:
            print(f"Selected Action {action.action} with priority {action.Value} sugested by {action.voice}")
        
        if action_type == "Action_specific":
            if not action.action == 0:
                composed_action = action.get_action_from_tuple(self.n_targets)
                print(f"{composed_action} -> {self.env.action_list_names[composed_action]} and action tuple is {action.action_tuple}")
            return action.get_action_from_tuple(self.n_targets)
        else: 
            return action.action

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
        for a in actions:
            # check if action is possible
            if self.env.SatSim.check_action(a.action) and a.action != self.Action_doNothing.action:
                return a
        return self.Action_doNothing
            
    def weighted_selection(self, actions):
        """
        Order the voices from weighted actions depending on an alpha parameter
        
        Args:
            actions (list[Action]): list of Action object suggested by each voice
        Returns:
            action (int): action to take
        """
        Weighted_actions = []
        visited_aciton = {}
        i = 0
        for a in actions:
            if str(a) in visited_aciton:
                Weighted_actions[visited_aciton[str(a)]] += a.Value
            else:
                Weighted_actions.append(a)
                i += 1
                visited_aciton[str(a)] = i
        # sort actions in value order
        Weighted_actions.sort(key=lambda x: x.Value, reverse=True)
        # Try to take action with highest priority
        for a in actions:
            # check if action is possible
            if self.env.SatSim.check_action(a.action) and a.action != self.Action_doNothing.action:
                return a
        
        return self.Action_doNothing

    def reset_voices(self, obs):
        for i, voice in  enumerate(self.Voices):
            voice.get_plan(obs, amount=6)

    def render(self):
        self.env.render()

    def prune_plan_voices(self, obs):
        for i, voice in enumerate(self.Voices):
            self.Voices[i].prune_plan(obs)
        

    def upadte_voices_goals(self, obs):
        for i, voice in enumerate(self.Voices):
            self.Voices[i].update_goals(self.env.Satsim.goals_acieved)