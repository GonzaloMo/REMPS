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
    def __init__(self, tot_targets, n_targets_planner, log_dir:str= None, max_goals:int=300, max_campaigns:int=3):
        self.single_goals = {}
        self.campaigns = []
        self.value = 0
        self.log_dir = log_dir
        self.MAX_SINGLE_GOALS = max_goals
        self.MAX_CAMPAIGNS = max_campaigns
        self.goals = np.zeros(tot_targets, dtype=np.int8)
        self.target_planner = np.random.randint(tot_targets, size=n_targets_planner)


    def generateSingleGoals(self, amount=1):
        goals = self.goals.copy()
        for i in self.target_planner:
            goals[i] = random.randint(1, amount)

        # Check if there are too many goals
        if np.sum(goals) > self.MAX_SINGLE_GOALS:
            self.generateSingleGoals(amount=amount-1)
        self.goals = goals

    def evaluateDump(self, image, weight:int = 1):
        
        # check single goals
        goals = self.goals.copy()
        if image in self.target_planner and goals[image] > 0:
            goals[image] -= 1
            self.goals = goals
            return weight
        else:
            return 0
        


    def set_seed(self, seed, Planner:str):
        """
        Set the seed of the random number generator.
            
        Args:
            seed: the seed to be set.
            Planner: the name of the planner.
        """
        seed = seed if seed is not None else np.random.randint(0, 2**32)
        np.random.seed(seed)
        random.seed(seed)
        self.seed = seed
        print("Goal Seed: ", self.seed)
        with open(self.log_dir+"Goal_seed.txt", "a") as f:
            f.write(Planner+" | "+datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + " " + str(self.seed)+"\n")