from SimpleSatellite.envs.opportunity.v2 import Simple_satellite
from ray.rllib.env.apis.task_settable_env import TaskSettableEnv

class Curriculum_v2(Simple_satellite, TaskSettableEnv):
    def __init__(self, *args, **kwargs):
        Simple_satellite.__init__(self)

    def difficulty(self):  
        return abs(self.opportunity -1)

    def get_task(self):  
        return self.difficulty()

    def set_task(self, task_difficulty):  
        while not self.difficulty() <= task_difficulty:
            self.reset()