from ray.rllib.agents.callbacks import DefaultCallbacks
from copy import deepcopy
import numpy as np


class Planner_CallBack(DefaultCallbacks):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
    
    def on_sub_environment_created(
        self,
        *,
        worker,
        sub_environment,
        env_context,
        env_index= None,
        **kwargs,):
        if "set_planner_name" in sub_environment.__dict__.keys():
            planner_name = f"planner_{env_index}"
            sub_environment.set_planner_name(planner_name)


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
        if (tot_epi_dificulty > 50000 and per_goals  > .95) or tot_epi_dificulty > 80000*(self.task + 1):
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