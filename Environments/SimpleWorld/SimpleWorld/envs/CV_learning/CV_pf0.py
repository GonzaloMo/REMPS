from copy import deepcopy
import gym 
from ray.rllib.env.apis.task_settable_env import TaskSettableEnv
import numpy as np
import math
import os
import yaml
import importlib
from copy import deepcopy

class CurriculumEnv(TaskSettableEnv):

    def __init__(self, 
                 env_name= "Simple_satellite-v0",
                 Env_config={},
                **kwargs):
        print("----------------------------------------------")
        print(Env_config)
        print("----------------------------------------------")
        self.env = gym.make(env_name, **Env_config)
        self.max_difficulty = self.env.grd_size
        self.task_dificulty = 1

    def difficulty(self, task_dificulty):
        self.task_dificulty = min(self.max_difficulty, max(1,task_dificulty))
        

    def get_task(self):  
        return self.task_dificulty

    def set_task(self, task_difficulty):  
        self.difficulty(task_difficulty)
        
    def step(self, action):
        return self.env.step(action)
    
    def reset(self):
        obs = self.env.reset()
        dis = np.abs(self.start_pos-self.goal_pos)
        while dis > self.task_dificulty[0] or dis > self.task_dificulty[1]:
            obs = self.env.reset()
            dis = np.abs(self.start_pos-self.goal_pos)
        return obs


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
        self.max_size = 100
        self.min_epi = 10000
    
    
    def on_train_result(self, algorithm, result, **kwargs):

        tot_epi = result["episodes_total"]
        mean_epi_reward = result["episode_reward_mean"]
        task = min(min(algorithm.workers.foreach_worker(
                                lambda ev: ev.foreach_env(
                                    lambda env: env.get_task()))))
        tot_epi_dificulty = tot_epi - self.begin_epi_dificulty
        if  (mean_epi_reward > self.task*2) and \
            (tot_epi_dificulty > self.min_epi):
            self.begin_epi_dificulty = deepcopy(tot_epi)
            algorithm.save( f"./Task_{self.task}")
            self.Task_change = 0
            self.task+=1

        task = self.task
        algorithm.workers.foreach_worker(
            lambda ev: ev.foreach_env(
                lambda env: env.set_task(task)))
        report  = "----------------------------------------------------------------\n"
        report += f"Episode reward mean: {mean_epi_reward}\n"
        report += f"Total episode: {tot_epi}\n"
        report += f"Total episode difficulty: {tot_epi_dificulty}\n"
        report += f"Setting env to dificulty: {task}\n"
        report += "----------------------------------------------------------------\n"
        ####################################
        if self.Task_change:
            with open("./logs_CV.txt", "a") as f:
                f.write(report)
        print(report)
        
        self.Task_change = False
    
    def on_episode_step(self, *, worker, base_env, episode, env_index, **kwargs) -> None:
        env = base_env.get_sub_environments()[env_index]
        episode.custom_metrics["task_difficulty"] = env.get_task()
        return super().on_episode_step(worker=worker, base_env=base_env, episode=episode, env_index=env_index, **kwargs)
    
    # def on_episode_end(self, *, worker, base_env, policies, episode, env_index: int,**kwargs) -> None:
    #     env = base_env.get_sub_environments()[env_index]
    #     percentage_of_goals = (1- np.sum(env.goals)/np.sum(env.initial_goals))
    #     episode.custom_metrics["percentage_of_goals"] = percentage_of_goals
    #     return super().on_episode_end(worker=worker, base_env=base_env, policies=policies, episode=episode, env_index=env_index, **kwargs)