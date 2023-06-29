from typing import Dict, Union
from ray.rllib.env.apis.task_settable_env import TaskSettableEnv
from SimpleSatellite.envs.setgoals.v4 import Simple_satellite
import numpy as np
import math
import os
import yaml
import importlib
from copy import deepcopy

from ray.rllib.env.base_env import BaseEnv
from ray.rllib.evaluation import RolloutWorker
from ray.rllib.evaluation.episode import Episode
from ray.rllib.evaluation.episode_v2 import EpisodeV2
from ray.rllib.policy import Policy
from ray.rllib.utils.typing import PolicyID

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
            self.Reward_list_names = config_files["Reward_Function"]
            Reward_name = self.Reward_list_names[0]
            self.Reward_name = Reward_name
            R_module_name = "v4_CV_stepReward"
            self.CV_type = "Reward"
            self.max_difficulty = len(self.Reward_list_names) 

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
            self.Reward_name = Reward_name
            self.CV_type = "Config"
            self.max_difficulty = len(self.difficulty_config) 
        
        
        Simple_satellite.__init__(self,**self.config)
        self.Reward_module = importlib.import_module(f"SimpleSatellite.envs.setgoals.Reward_function.{R_module_name}")
        self.Reward = getattr(self.Reward_module, Reward_name)
        if self.CV_type == "Reward":
            self.Reward_list = []
            for reward_name in self.Reward_list_names:
                self.Reward_list.append(getattr(self.Reward_module, reward_name))

    def difficulty(self, task_dificulty):
        if self.CV_type == "Reward":
            self.Reward_name = self.Reward_list_names[task_dificulty]
            # with open("./logs_CV.txt", "a") as f:
                # f.write("----------------------------------------------------------------\n")
                # f.write(f"Reward List name: {self.Reward_name}\n")
                # f.write(f"Difficulty: {task_dificulty}\n")
                # f.write(f"Reward: {self.Reward_list[task_dificulty]}\n")
                # f.write("----------------------------------------------------------------\n")
            self.Reward = getattr(self.Reward_module, self.Reward_name)
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
            # self.reset()
        

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
        self.begin_epi_dificulty = 0
        self.Reward_vec = []
        self.percentage_of_goals = []
        self.max_size = 100
        self.Task_change = False
        self.task = 0
    
    
    def on_train_result(self, algorithm, result, **kwargs):

        tot_epi = result["episodes_total"]
        mean_epi_reward = result["episode_reward_mean"]
        CV_type = algorithm.workers.foreach_worker(lambda ev: ev.foreach_env(lambda env: env.CV_type))[1][1]
        ############ Type of CV ################
        if CV_type == "Reward":
            ##    Step Reward  ##########################
            max_difficulty = max(max(algorithm.workers.foreach_worker(
                                lambda ev: ev.foreach_env(
                                    lambda env: env.max_difficulty))))
            n = len(self.Reward_vec)
            if "percentage_of_goals_mean" in result["custom_metrics"].keys():
                per_goals = result["custom_metrics"]["percentage_of_goals_mean"]
            else:
                per_goals = -1
            if n < self.max_size:
                self.Reward_vec.append(mean_epi_reward)
                self.percentage_of_goals.append(per_goals)
                mean_error = 10.
                result["custom_metrics"]["mean_error"] = 0
            else:
                self.Reward_vec.pop(0)
                self.Reward_vec.append(mean_epi_reward)
                self.percentage_of_goals.pop(0)
                self.percentage_of_goals.append(per_goals)
                range_limit = int(self.max_size//10)
                mean_error = np.abs(np.mean(self.Reward_vec[-range_limit:]) - np.mean(self.Reward_vec[:range_limit]))/np.abs(np.mean(self.Reward_vec[:range_limit]))
                result["custom_metrics"]["mean_error"] = mean_error

            tot_epi_dificulty = tot_epi - self.begin_epi_dificulty
            previous_difficulty = deepcopy(self.task)
            minmum_epi = 100000
            Conditions = [tot_epi_dificulty > minmum_epi, mean_error<.01, mean_epi_reward>0, self.task < max_difficulty]
            mean_error_old = deepcopy(mean_error)
            
            if  (tot_epi_dificulty > minmum_epi \
                    and mean_error<.01  \
                    and mean_epi_reward>0 \
                    and self.task < max_difficulty) or \
                (tot_epi_dificulty > 5*minmum_epi 
                    and self.task < max_difficulty):
                
                self.Reward_vec = []
                mean_error = 10.
                self.begin_epi_dificulty = deepcopy(tot_epi)
                algorithm.save( f"./Task_{self.task}")
                self.Task_change = 0
                self.task+=1
                self.Task_change = True

            task = self.task
            algorithm.workers.foreach_worker(
                lambda ev: ev.foreach_env(
                    lambda env: env.set_task(task)))
            
            result["custom_metrics"]["N_stored_mean_error"] = n
            result["custom_metrics"]["iteration"] = algorithm.iteration
            report  = "----------------------------------------------------------------\n"
            report += f"Episode reward mean: {mean_epi_reward}\n"
            report += f"Mean error: {mean_error_old}\n"
            report += f"n: {n}\n"
            report += f"max_difficulty: {max_difficulty}\n"
            report += f"Percentage of goals: {per_goals}\n"
            report += f"Total episode: {tot_epi}\n"
            report += f"Total episode difficulty: {tot_epi_dificulty}\n"
            report += f"Current difficulty: {previous_difficulty}\n"
            report += f"Setting env to dificulty: {task}\n"
            report += f"Conditions: \n"
            for i, cond in enumerate(Conditions):
                report += f"  {i}: {cond}\n"
            if self.Task_change:
                task_vector = algorithm.workers.foreach_worker(lambda ev: ev.foreach_env(lambda env: env.get_task()))
                report += f"Task vector: \n"
                for i, tsk in enumerate(task_vector):
                    report += f"  {i}: {tsk}\n"
            report += "----------------------------------------------------------------\n"
        else:
            ##    Config Reward  ##########################
            tot_epi = result["episodes_total"]
            mean_epi_reward = result["episode_reward_mean"]
            max_difficulty = max(max(algorithm.workers.foreach_worker(
                                lambda ev: ev.foreach_env(
                                    lambda env: env.max_difficulty))))
            max_target = max(max(algorithm.workers.foreach_worker(
                                lambda ev: ev.foreach_env(
                                    lambda env: env.max_difficulty))))
            
            tot_epi_dificulty = tot_epi - self.begin_epi_dificulty
            previous_difficulty = deepcopy(self.task)      
            if  (mean_epi_reward > (max_target*35) \
                    and self.task < max_difficulty):
                self.begin_epi_dificulty = deepcopy(tot_epi)
                algorithm.save( f"./Task_{self.task}")
                self.Task_change = 0
                self.task+=1
                self.Task_change = True

            task = self.task
            algorithm.workers.foreach_worker(
                lambda ev: ev.foreach_env(
                    lambda env: env.set_task(task)))
            result["custom_metrics"]["iteration"] = algorithm.iteration
            report  = "----------------------------------------------------------------\n"
            report += f"Episode reward mean: {mean_epi_reward}\n"
            report += f"max_difficulty: {max_difficulty}\n"
            report += f"max_target: {max_target}\n"
            report += f"Total episode: {tot_epi}\n"
            report += f"Total episode difficulty: {tot_epi_dificulty}\n"
            report += f"Current difficulty: {previous_difficulty}\n"
            report += f"Setting env to dificulty: {task}\n"
            report += "----------------------------------------------------------------\n"
        ####################################
        if self.Task_change:
            with open("./logs_CV.txt", "a") as f:
                f.write(report)
        print(report)
        
        self.Task_change = False
    
    def on_episode_end(self, *, worker, base_env, policies, episode, env_index: int,**kwargs) -> None:
        env = base_env.get_sub_environments()[env_index]
        percentage_of_goals = (1- np.sum(env.goals)/np.sum(env.initial_goals))
        episode.custom_metrics["percentage_of_goals"] = percentage_of_goals
        return super().on_episode_end(worker=worker, base_env=base_env, policies=policies, episode=episode, env_index=env_index, **kwargs)
    
    def on_episode_step(self, *, worker, base_env, episode, env_index, **kwargs) -> None:
        env = base_env.get_sub_environments()[env_index]
        episode.custom_metrics["task_difficulty"] = env.get_task()
        return super().on_episode_step(worker=worker, base_env=base_env, episode=episode, env_index=env_index, **kwargs)