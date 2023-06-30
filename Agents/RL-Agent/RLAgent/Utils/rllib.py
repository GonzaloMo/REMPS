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


class PG_callback(DefaultCallbacks):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
    
    def on_episode_end(self, *, worker, base_env, policies, episode, env_index: int,**kwargs) -> None:
        env = base_env.get_sub_environments()[env_index]
        if "SimpleSatellite" in env.unwrapped.spec.id:
            percentage_of_goals = (1- np.sum(env.goals)/np.sum(env.initial_goals))
            episode.custom_metrics["percentage_of_goals"] = percentage_of_goals
        return super().on_episode_end(worker=worker, base_env=base_env, policies=policies, episode=episode, env_index=env_index, **kwargs)