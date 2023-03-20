from ray.rllib.env.apis.task_settable_env import TaskSettableEnv
from SimpleSatellite.envs.setgoals.v2 import Simple_satellite
import numpy as np
import os
import yaml
import importlib
from copy import deepcopy

class CurriculumEnv(Simple_satellite, TaskSettableEnv):

    def __init__(self, 
                config_files={},
                **kwargs):
        main_config_file = config_files["main_config_file"]
        CV_path = config_files["CV_path"]
        Reward_name = config_files["Reward_Function"]
        Reward_module = importlib.import_module("SimpleSatellite.envs.setgoals.Reward_function.v2_CV")
        
        self.config = {}
        self.last_50_episode_reward = []
        with open(main_config_file, 'r') as f:
            main_config = yaml.load(f, Loader=yaml.FullLoader)
        self.task_dificulty = 0
        self.config = deepcopy(main_config)
        with open(CV_path[0], 'r') as f:
            self.config.update(yaml.load(f, Loader=yaml.FullLoader))
        Simple_satellite.__init__(self,**self.config)
        self.Reward = getattr(Reward_module, Reward_name)
        self.max_difficulty = len(CV_path)
        self.difficulty_config = []
        CVpath_total = CV_path + [main_config_file]
        for pth in CVpath_total:
            if not os.path.isfile(pth):
                raise ValueError(f"CV path {pth} does not exist")
            else:
                with open(pth, 'r') as f:
                    self.difficulty_config.append(yaml.load(f, Loader=yaml.FullLoader))
        self.total_episode_this_dificulty = 0

    def difficulty(self, task_dificulty):
        self.config.update(self.difficulty_config[task_dificulty])
        self.task_dificulty = task_dificulty
        self.total_episode_this_dificulty = -1
        self.last_50_episode_reward = []
        

    def get_task(self):  
        return self.task_dificulty

    def set_task(self, task_difficulty):  
        reset_env = False
        if task_difficulty != self.task_dificulty:
            reset_env = True
        self.difficulty(task_difficulty)
        config = deepcopy(self.config)
        self.load_config(**config)
        if reset_env:
            self.reset()
    def reset(self):
        if len(self.last_50_episode_reward) > 50:
            self.last_50_episode_reward.pop(0)
        self.last_50_episode_reward.append(self.Total_reward)
        self.total_episode_this_dificulty +=1
        return super().reset()


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
    difficulty = task_settable_env.get_task()
    total_episode_this_dificulty = task_settable_env.total_episode_this_dificulty
    episode_mean_reward = train_results.get("episode_reward_mean")
    # episode_mean_reward = np.mean(task_settable_env.last_50_episode_reward)
    previous_difficulty = deepcopy(difficulty)
    if episode_mean_reward is not None:
        max_goals = task_settable_env.Max_goals
        mean_episode_goal = 95
        mean_episode_lower = -95
       
        if episode_mean_reward > mean_episode_goal and total_episode_this_dificulty>20:
            difficulty += 1
        if episode_mean_reward < mean_episode_lower:
            difficulty -= 1
        # Bound deficulty
        difficulty = max(0, min(task_settable_env.max_difficulty, difficulty))
        if env_ctx.worker_index == 1 and env_ctx.vector_index == 0:
            print("----------------------------------------------------------------")
            print(f"Episode reward mean: {episode_mean_reward}")
            print(f"Total episode this difficulty: {total_episode_this_dificulty}")
            print(f"Max goals: {max_goals}")
            print(f"Mean episode goal: {mean_episode_goal}")
            print(f"Current difficulty: {previous_difficulty}")
            print(
                f"\nSetting env to dificulty={difficulty}"
            )
            print("----------------------------------------------------------------")
    return difficulty