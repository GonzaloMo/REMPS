from ray.rllib.env.apis.task_settable_env import TaskSettableEnv
from SimpleSatellite.envs.setgoals.v2 import Simple_satellite
import os
import yaml
from copy import deepcopy

class CurriculumEnv(Simple_satellite, TaskSettableEnv):

    def __init__(self, 
                main_config_file="",
                CV_path=[]):
        
        
        self.CV_paths = CV_path
        self.config = {}
        self.task_dificulty = 0
        with open(main_config_file, 'r') as f:
            main_config = yaml.load(f, Loader=yaml.FullLoader)
        self.config = deepcopy(main_config)
        Simple_satellite.__init__(self,**main_config)
        for pth in self.CV_paths:
            if not os.path.isfile(pth):
                raise ValueError(f"CV path {pth} does not exist")

    def difficulty(self, task_dificulty):
        difilculty_config_file = self.CV_paths[task_dificulty]
        self.task_dificulty = task_dificulty
        with open(difilculty_config_file, 'r') as f:
            self.config.update(yaml.load(f, Loader=yaml.FullLoader))

    def get_task(self):  
        return self.task_dificulty

    def set_task(self, task_difficulty):  
        self.difficulty(task_difficulty)
        config = deepcopy(self.config)
        self.Max_goals = config["Max_image_goals_per_target"]
        del config["Max_image_goals_per_target"]
        self.SatSim.load_config(**config)


def curriculum_fn(
    train_results: dict, task_settable_env: TaskSettableEnv, env_ctx):
    """Function returning a possibly new task to set `task_settable_env` to.
    Args:
        train_results: The train results returned by Algorithm.train().
        task_settable_env: A single TaskSettableEnv object
            used inside any worker and at any vector position. Use `env_ctx`
            to get the worker_index, vector_index, and num_workers.
        env_ctx: The env context object (i.e. env's config dict
            plus properties worker_index, vector_index and num_workers) used
            to setup the `task_settable_env`.
    Returns:
        TaskType: The task to set the env to. This may be the same as the
            current one.
    """
    time_steps = train_results.get("timesteps_total")
    difficulty = task_settable_env.get_task()

    difficulty = time_steps // 1000
    print(f"Current difficulty: {difficulty}")
    print(
        f"Worker #{env_ctx.worker_index} vec-idx={env_ctx.vector_index}"
        f"\nR={train_results['episode_reward_mean']}"
        f"\nSetting env to dificulty={difficulty}"
    )
    return difficulty

def evaluate_curriculum_fn(env):
    """ Function that evaluates the agent."""


    return difficulty