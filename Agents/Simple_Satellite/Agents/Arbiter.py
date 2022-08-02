import gym
from gym import spaces
import SimpleSatellite
import numpy as np
from ArbiterVoices.Planner_voice import Planner_Voice
import IPython
from ArbiterVoices.utils import Action
from torch import seed
from ArbiterVoices.emergencyVoices import Full_memory

class Arbiter:
    def __init__(self, env: gym.Env, tot_targets:int, n_targets_per_planner :int = 2, n_planners: int = 2, seed_v = None, amount=15, log_dir=None):
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
            if seed_v is None:
                seed = seed_v
            else:
                seed = seed_v[i]
            self.Voices.append(Planner_Voice(env.SatSim, n_targets_per_planner, tot_targets, name=f"V_{i}", seed=seed, amount=amount, log_dir=log_dir))
        self.emergency_voices = []
        self.emergency_voices.append(Full_memory(env.SatSim))
        self.npp = n_targets_per_planner
        self.n_targets = tot_targets
        self.Action_doNothing = Action(env.SatSim.ACTION_DO_NOTHING, "DoNothing", -100)

    def take_action(self, obs, alpha, type_selec_method="Priority", action_type="Action_specific"):
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
        # Take emergency action if necessary
        for e_voice in self.emergency_voices:
            e_action = e_voice.getAction(obs)
            if not (e_action == self.Action_doNothing):
                print(f"EMERGENCY VOICE !!!!")
                print(f"Emergency voice {e_voice.name} took action {e_action}")
                if not e_voice.Engaged:
                    self.reset_voices(obs)
                return e_action.get_action_from_tuple(self.n_targets)
        # If no emergency action is needed
        actions = [] 
        for i, voice in enumerate(self.Voices):
            Voice_action = voice.getAction(obs)
            priority = alpha[i]
            Voice_action.set_value(priority)
            actions.append(Voice_action)

        if type_selec_method.lower() == "priority":
            action = self.high_priority_selection(actions)
        elif type_selec_method.lower() == "weighted":
            action = self.weighted_selection(actions)
        else:
            print(f"Error: type_selec_method = {type_selec_method} not recognized")
            raise ValueError("Type must be either Priority or Weighted")
        self.prune_plan_voices(obs)
        if not action.action == self.env.SatSim.ACTION_DO_NOTHING:
            composed_action = action.get_action_from_tuple(self.n_targets)
            print(f"Selected Action {str(action)} with priority {action.Value} sugested by {action.voice}")
        
        if action_type == "Action_specific":
            # if not action.action == 0:
            #     composed_action = action.get_action_from_tuple(self.n_targets)
            #     print(f"{composed_action} -> {self.env.action_list_names[composed_action]} and action tuple is {action.action_tuple}")
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
        actions, rearrange_Voices = self.rearrange_Voices(actions)
        # Try to take action with highest priority
        for i, a in enumerate(actions):
            # check if action is possible
            if self.env.SatSim.check_action(a.action) and a.action != self.Action_doNothing.action:
                if i > 0:
                    if self.check_interference(a, i):
                        return a
                else:
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
                Weighted_actions[visited_aciton[str(a)]].Value += a.Value
            else:
                Weighted_actions.append(a)
                visited_aciton[str(a)] = i
                i += 1
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
        

    def upadte_voices_goals(self):
        for i, voice in enumerate(self.Voices):
            self.Voices[i].update_goals(self.env.SatSim.Goals_achieved)
        
    def check_interference(self, action, ith_voice):
        for i in range(ith_voice-1, -1, -1):
            voice = self.Voices[i]
            for a in voice.excuted_plan:
                pos, ac, img, _ = a
                if pos < action.end_pos+2 and self.env.SatSim.check_action((ac, img)):
                    return False
        return True

    def rearrange_Voices(self, actions):
        # Ordered from lowest value (index 0) to highest value (index n_voices)
        actions.sort(key=lambda x: x.Value, reverse=False)
        orderedVoices = []
        for a in actions:
            for v in self.Voices:
                if v.name == a.voice:
                    orderedVoices.append(a)
        return actions, orderedVoices