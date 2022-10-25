import math
import random
from typing import List
import numpy as np
import datetime
import os

class CampaignGoal:

    def __init__(self, targets=[], reward=1):
        self.targets = targets
        self.targets_completed = [False]*len(targets)
        self.campaign_start_orbit = -1
        self.campaign_started = False
        self.campaign_failed = False
        self.campaign_completed = False
        self.reward = reward

class GoalReferee:
    def __init__(self, tot_targets, n_targets_planner, log_dir:str= "", max_goals:int=300, max_campaigns:int=3, planner_name:str="", seed:int=None):
        self.single_goals = {}
        self.campaigns = []
        self.value = 0
        self.log_dir = log_dir
        self.planner_name = planner_name
        self.MAX_SINGLE_GOALS = max_goals
        self.MAX_CAMPAIGNS = max_campaigns
        self.goals = np.zeros(tot_targets, dtype=np.int8)
        if seed is None:
            self.generate_seed()
        else:
            self.set_seed(seed)
        self.target_planner = np.random.randint(1, tot_targets+1, size=n_targets_planner)


    def generateSingleGoals(self, amount=1):
        goals = self.goals.copy()
        for i in self.target_planner:
            random.seed(self.seed+i)
            goals[i-1] = random.randint(1, amount)

        # Check if there are too many goals
        if np.sum(goals) > self.MAX_SINGLE_GOALS:
            self.generateSingleGoals(amount=amount-1)
        self.goals = goals
        self.Initial_goals = goals.copy()
        # print(f"{self.planner_name} | Goals: {self.goals}")

    def evaluateDump(self, image, weight:int = 1):
        
        # check single goals
        goals = self.goals.copy()
        if image in self.target_planner and goals[image] > 0:
            return weight
        else:
            return 0
        
    def update(self, goals_achieved):
        """
        Update the goals achieved.
            
        Args:
            goals_achieved: the goals achieved.
        """
        for i, g in enumerate(goals_achieved):
            current_g = self.Initial_goals[i] - g
            self.goals[i] = max(0, current_g)

    def set_seed(self, seed):
        """
        Set the seed of the random number generator.
            
        Args:
            seed: the seed to be set.
        """

        self.seed = seed
        random.seed(seed)
        np.random.seed(seed)
        print(f"{self.planner_name} | Goal Seed: {self.seed}")

    def generate_seed(self):
        """
        Generate a seed for the random number generator.
        """
        seed = np.random.randint(0, 2**32)
        np.random.seed(seed)
        random.seed(seed)
        self.seed = seed
        with open(self.log_dir+"Seed.yaml", "a") as f:
            f.write(f"    {self.planner_name}: {self.seed} \n")
        