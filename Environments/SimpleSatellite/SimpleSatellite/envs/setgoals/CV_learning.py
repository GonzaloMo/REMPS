from ray.rllib.env.apis.task_settable_env import TaskSettableEnv
from SimpleSatellite.envs.setgoals.v4 import Simple_satellite
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
        self.config = {}
        with open(main_config_file, 'r') as f:
            main_config = yaml.load(f, Loader=yaml.FullLoader)
        self.task_dificulty = 0
        self.config = deepcopy(main_config)
        
        if type(config_files["Reward_Function"]) == list:
            self.Reward_list = config_files["Reward_Function"]
            Reward_name = self.Reward_list[0]
            R_module_name = "v4_CV_stepReward"
            self.CV_type = "Reward"
            self.max_difficulty = len(self.Reward_list) 

        else:
            CV_path = config_files["CV_path"]
            with open(CV_path[0], 'r') as f:
                self.config.update(yaml.load(f, Loader=yaml.FullLoader))
            self.max_difficulty = len(CV_path)
            self.difficulty_config = []
            CVpath_total = CV_path + [main_config_file]
            for pth in CVpath_total:
                if not os.path.isfile(pth):
                    raise ValueError(f"CV path {pth} does not exist")
                else:
                    with open(pth, 'r') as f:
                        self.difficulty_config.append(yaml.load(f, Loader=yaml.FullLoader))
            self.set_global_max_targets(main_config["Max_image_goals_per_target"])
            R_module_name = "v4_CV"
            Reward_name = config_files["Reward_Function"]
            self.CV_type = "Config"
            self.max_difficulty = len(self.difficulty_config) 
        
        
        Simple_satellite.__init__(self,**self.config)
        self.Reward_module = importlib.import_module(f"SimpleSatellite.envs.setgoals.Reward_function.{R_module_name}")
        self.Reward = getattr(self.Reward_module, Reward_name)

    def difficulty(self, task_dificulty):
        if self.CV_type == "Reward":
            self.Reward = getattr(self.Reward_module, f"Reward_{task_dificulty}")
        elif self.CV_type == "Config":
            self.config.update(self.difficulty_config[task_dificulty])
            config = deepcopy(self.config)
            self.load_config(**config)
        self.task_dificulty = task_dificulty
        

    def get_task(self):  
        return self.task_dificulty

    def set_task(self, task_difficulty):  
        if task_difficulty != self.task_dificulty and task_difficulty < self.max_difficulty:
            self.difficulty(task_difficulty)
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
    return difficulty


from ray.rllib.agents.callbacks import DefaultCallbacks


class CV_CallBack(DefaultCallbacks):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.task = 0
        self.begin_epi_dificulty = 0
    

    def on_train_result(self, algorithm, result, **kwargs):
        tot_epi = result["episodes_total"]
        mean_epi_reward = result["episode_reward_mean"]
        if "percentage_of_goals_mean" in result["custom_metrics"].keys():
            per_goals = result["custom_metrics"]["percentage_of_goals_mean"]
        else:
            per_goals = -1
        tot_epi_dificulty = tot_epi - self.begin_epi_dificulty
        previous_difficulty = deepcopy(self.task)
        if ((tot_epi_dificulty > 50000 and per_goals  > .95) or tot_epi_dificulty > 80000*(self.task + 1)) and self.task < 1:
            self.begin_epi_dificulty = deepcopy(tot_epi)
            self.task += 1
        elif per_goals < .0:
            self.task = max(0, self.task - 1)

        task = self.task
        report  = "----------------------------------------------------------------\n"
        report += f"Episode reward mean: {mean_epi_reward}\n"
        report += f"Percentage of goals: {per_goals}\n"
        report += f"Total episode: {tot_epi}\n"
        report += f"Total episode difficulty: {tot_epi_dificulty}\n"
        report += f"Current difficulty: {previous_difficulty}\n"
        report += f"Setting env to dificulty: {task}\n"
        report += "----------------------------------------------------------------"
        print(report)
        algorithm.workers.foreach_worker(
            lambda ev: ev.foreach_env(
                lambda env: env.set_task(task)))
    
    
    def on_episode_end(self, *, worker, base_env, policies, episode, env_index: int,**kwargs) -> None:
        env = base_env.get_sub_environments()[env_index]
        percentage_of_goals = (1- np.sum(env.goals)/np.sum(env.initial_goals))
        episode.custom_metrics["percentage_of_goals"] = percentage_of_goals
        episode.custom_metrics["task_difficulty"] = env.get_task()
        # episode.custom_metrics["Power_truncated"] = env.truncated
        return 

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