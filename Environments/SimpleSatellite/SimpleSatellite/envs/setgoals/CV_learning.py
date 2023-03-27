from ray.rllib.env.apis.task_settable_env import TaskSettableEnv
from SimpleSatellite.envs.setgoals.v2 import Simple_satellite
import numpy as np
import math
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

    def difficulty(self, task_dificulty):
        self.config.update(self.difficulty_config[task_dificulty])
        self.task_dificulty = task_dificulty
        

    def get_task(self):  
        return self.task_dificulty

    def set_task(self, task_difficulty):  
        if task_difficulty != self.task_dificulty:
            self.difficulty(task_difficulty)
            config = deepcopy(self.config)
            self.load_config(**config)
            self.reset()

    def reset(self):
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
    # tot_epi = len(train_results["hist_stats"]["episode_reward"])
    # episode_mean_reward = train_results.get("episode_reward_mean")
    # # episode_mean_reward = np.mean(task_settable_env.last_50_episode_reward)
    # previous_difficulty = deepcopy(difficulty)
    # if episode_mean_reward is not None:
    #     max_goals = task_settable_env.Max_goals
    #     mean_episode_goal = 90 * math.log(math.e + 6*task_settable_env.task_dificulty)
    #     mean_episode_lower = -100
       
    #     if episode_mean_reward > mean_episode_goal and tot_epi>80:
    #         difficulty += 1
    #     if episode_mean_reward < mean_episode_lower:
    #         difficulty -= 1
    #     # Bound deficulty
    #     difficulty = max(0, min(task_settable_env.max_difficulty, difficulty))
    #     if env_ctx.worker_index == 1 and env_ctx.vector_index == 0:
    #         print("----------------------------------------------------------------")
    #         for k, v in train_results.items():
    #             print(f"{k}: {v}")
    #         print("----------------------------------------------------------------")
    #         print(f"Episode reward mean: {episode_mean_reward}")
    #         print(f"Max goals: {max_goals}")
    #         print(f"Change Mean episode goal: {mean_episode_goal}")
    #         print(f"Current difficulty: {previous_difficulty}")
    #         print(
    #             f"\nSetting env to dificulty={difficulty}"
    #         )
    #         print("----------------------------------------------------------------")
    return difficulty


from ray.tune import Callback


from ray.rllib.agents.callbacks import DefaultCallbacks


class CV_CallBack(DefaultCallbacks):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.task = 0
        self.begin_epi_dificulty = 0
        self.per_goals = []

    def on_train_result(self, algorithm, result, **kwargs):
        tot_epi = result["episodes_total"]
        mean_epi_reward = result["episode_reward_mean"]

        tot_epi_dificulty = tot_epi - self.begin_epi_dificulty
        mean_episode_goal =  100 *math.log(math.e + 6*self.task)
        mean_episode_lower = -100
        previous_difficulty = deepcopy(self.task)
        if tot_epi_dificulty > 80 and mean_epi_reward  > mean_episode_goal:
            self.begin_epi_dificulty = deepcopy(tot_epi)
            self.task += 1
        elif mean_epi_reward < mean_episode_lower:
            self.task -= 1

        task = self.task
        # per_goals = result["custom_metrics"]["Percentage_of_goals"]
        print("----------------------------------------------------------------")
        print(f"Episode reward mean: {mean_epi_reward}")
        # print(f"Percentage of goals: {per_goals}")
        print(f"Total episode: {tot_epi}")
        print(f"Total episode difficulty: {tot_epi_dificulty}")
        print(f"Change Mean episode goal: {mean_episode_goal}")
        print(f"Current difficulty: {previous_difficulty}")
        print(f"Setting env to dificulty: {task}")
        print("----------------------------------------------------------------")
        algorithm.workers.foreach_worker(
            lambda ev: ev.foreach_env(
                lambda env: env.set_task(task)))
    
    # def on_episode_end(self, *, worker, base_env, policies, episode, env_index: int,**kwargs) -> None:
    #     percentage_of_goals = (1- np.sum(base_env[env_index].goals)/np.sum(base_env[env_index].initial_goals))
    #     episode.custom_metrics["Percentage_of_goals"] = percentage_of_goals
    #     if len(self.per_goals > 100):
    #         self.per_goals.pop(0)
    #     self.per_goals.append(percentage_of_goals)
    #     return 

# from ray.rllib.agents.callbacks import Callback
# class CV_CallBack(Callback):
#     def setup(
#         self,
#         stop= None,
#         num_samples= None,
#         total_num_samples = None,
#         **info,
#         ):
#         self.task = 0
#         self.begin_epi_dificulty  = 0

#     def on_trial_result(self, iteration, trials, trial, result, **info):
#         tot_epi = result["episodes_total"]
#         mean_epi_reward = result["episode_reward_mean"]
#         tot_epi_dificulty = tot_epi - self.begin_epi_dificulty
#         mean_episode_goal = 90 * math.log(math.e + 6*self.task)
#         mean_episode_lower = -100
#         previous_difficulty = deepcopy(self.task)
#         if tot_epi_dificulty > 80 and mean_epi_reward  > mean_episode_goal:
#             self.task += 1
#         elif mean_epi_reward < mean_episode_lower:
#             self.task -= 1

#         task = self.task
#         print("----------------------------------------------------------------")
#         print(f"Episode reward mean: {mean_epi_reward}")
#         print(f"Total episode: {tot_epi}")
#         print(f"Total episode difficulty: {tot_epi_dificulty}")
#         print(f"Change Mean episode goal: {mean_episode_goal}")
#         print(f"Current difficulty: {previous_difficulty}")
#         print(f"Setting env to dificulty: {task}")
#         print("----------------------------------------------------------------")
#         for tr in trials:
#             tr.workers.foreach_worker(
#                 lambda ev: ev.foreach_env(
#                     lambda env: env.set_task(task)))