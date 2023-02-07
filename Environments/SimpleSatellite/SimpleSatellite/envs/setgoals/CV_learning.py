from ray.rllib.env.apis.task_settable_env import TaskSettableEnv
from SimpleSatellite.envs.setgoals.v2 import Simple_satellite
import os
import yaml
from copy import deepcopy

class CurriculumEnv(Simple_satellite, TaskSettableEnv):

    def __init__(self, 
                config_files={},
                **kwargs):
        main_config_file = config_files["main_config_file"]
        CV_path = config_files["CV_path"]
        self.CV_paths = CV_path
        self.config = {}
        self.task_dificulty = 0
        with open(main_config_file, 'r') as f:
            main_config = yaml.load(f, Loader=yaml.FullLoader)
        self.config = deepcopy(main_config)
        Simple_satellite.__init__(self,**main_config)
        self.max_difficulty = len(CV_path)
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
    difficulty = task_settable_env.get_task()
    episode_mean_reward = train_results.get("episode_reward_mean")
    
    if episode_mean_reward is not None:
        max_goals = task_settable_env.Max_goals
        mean_episode_goal = max_goals *0.5
       
        if episode_mean_reward > mean_episode_goal:
            difficulty += 1
        if episode_mean_reward < 0:
            difficulty -= 1
    # Bound deficulty
    difficulty = max(0, min(task_settable_env.max_difficulty, difficulty))
    if env_ctx.worker_index == 1:
        print("----------------------------------------------------------------")
        print(f"Episode reward mean: {episode_mean_reward}")
        print(f"Max goals: {max_goals}")
        print(f"Mean episode goal: {mean_episode_goal}")
        print(f"Current difficulty: {difficulty}")
        print(
            f"\nSetting env to dificulty={difficulty}"
        )
        print("----------------------------------------------------------------")
    return difficulty