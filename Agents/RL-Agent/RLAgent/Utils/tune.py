import SimpleSatellite
import SimpleWorld
from typing import Dict
import gym
import os
import ray.tune as tune
from typing import Dict, Any, List, Optional, Tuple, Union
from copy import deepcopy
current_dir = os.getcwd()
def env_creator_old(env_config: Dict={"env": "SimpleSatellite-setgoals-v0", "Env_setup": ["./Configurations/Environment_Config/Env_1.yaml"], 
            "Reward_Module": "Reward_functions.SimpleSat", "Reward_Function": "Reward_v1", "Log_dir": "./Results/Sim/"}):
    # Import Reward function
    import importlib
    split_env_name = env_config["env"].split("-")
    module_name = ".".join([split_env_name[0], "envs", split_env_name[1], "Reward_function", split_env_name[2]])
    Rewards = importlib.import_module(module_name, package=None)
    config = {}
    for env_config_file in env_config["Env_setup"]:
        env_config_file = env_config_file.replace("./", f"{current_dir}/")
        import yaml
        with open(env_config_file, "r") as f:
            config.update(yaml.load(f, Loader=yaml.FullLoader))
    config["Reward"] = getattr(Rewards, env_config["Reward_Function"])
    if "Log_dir" in env_config:
        config["Log_dir"] = env_config["Log_dir"]
    MyEnv = gym.make(env_config["env"], **config)
    return MyEnv  # return an env instance

def env_creator(env_config: Dict={"env": "SimpleSatellite-setgoals-v0", "Env_setup": {},
     "Reward_Function": "Reward_v1", "Log_dir": "./Results/Sim/"}):
    # Import Reward function
    import importlib
    split_env_name = env_config["env"].split("-")
    module_name = ".".join([split_env_name[0], "envs", split_env_name[1], "Reward_function", split_env_name[2]])
    Rewards = importlib.import_module(module_name, package=None)
    config = deepcopy(env_config["Env_setup"])
    config["Reward"] = getattr(Rewards, env_config["Reward_Function"])
    config["Log_dir"] = env_config["Log_dir"]
    MyEnv = gym.make(env_config["env"], **config)
    return MyEnv  # return an env instance

#############################################################################################################################

#############################################################################################################################
        
from ray.rllib.agents.ppo import PPOTrainer, APPOTrainer
from ray.rllib.algorithms.alpha_zero import AlphaZeroConfig
import torch
from torch.utils.tensorboard import SummaryWriter
import tensorflow as tf
class PPO(PPOTrainer):
    def __init__(self, *args, **kwargs):
        print("PPO init")
        super().__init__(*args, **kwargs)

class APPO(APPOTrainer):
    def __init__(self, *args, **kwargs):
        
        print("APPO init/n")
        super().__init__(*args, **kwargs)

class APPO(APPOTrainer):
    def __init__(self, *args, **kwargs):
        
        print("APPO init/n")
        super().__init__(*args, **kwargs)




# Custom TensorboardX Logger
from ray.tune.logger.tensorboardx import TBXLoggerCallback
import logging
import numpy as np

from typing import TYPE_CHECKING, Dict

from ray.tune.logger.logger import Logger, LoggerCallback
from ray.util.debug import log_once
from ray.tune.result import (
    TRAINING_ITERATION,
    TIME_TOTAL_S,
    TIMESTEPS_TOTAL,
)
from ray.tune.utils import flatten_dict
from ray.util.annotations import PublicAPI

if TYPE_CHECKING:
    from ray.tune.experiment.trial import Trial  # noqa: F401

logger = logging.getLogger(__name__)

VALID_SUMMARY_TYPES = [int, float, np.float32, np.float64, np.int32, np.int64]

from typing import TYPE_CHECKING, Dict
from ray.tune import Callback

## Callback logger
class Custom_TBXLoggerCallback(LoggerCallback):
    """TensorBoardX Logger.

    Note that hparams will be written only after a trial has terminated.
    This logger automatically flattens nested dicts to show on TensorBoard:

        {"a": {"b": 1, "c": 2}} -> {"a/b": 1, "a/c": 2}
    """

    VALID_HPARAMS = (str, bool, int, float, list, type(None))
    VALID_NP_HPARAMS = (np.bool8, np.float32, np.float64, np.int32, np.int64)

    def __init__(self):
        try:
            from tensorboardX import SummaryWriter
            
            self._summary_writer_cls = SummaryWriter
        except ImportError:
            if log_once("tbx-install"):
                logger.info('pip install "ray[tune]" to see TensorBoard files.')
            raise
        self._trial_writer: Dict["Trial", SummaryWriter] = {}
        self._trial_result: Dict["Trial", Dict] = {}

    def log_trial_start(self, trial: "Trial"):
        if trial in self._trial_writer:
            self._trial_writer[trial].close()
        trial.init_logdir()
        self._trial_writer[trial] = self._summary_writer_cls(
            trial.logdir, flush_secs=30
        )
        
        self._trial_result[trial] = {}

    def log_trial_result(self, iteration: int, trial: "Trial", result: Dict):
        if trial not in self._trial_writer:
            self.log_trial_start(trial)
        step = result.get(TIMESTEPS_TOTAL) or result[TRAINING_ITERATION]

        tmp = result.copy()
        for k in ["config", "pid", "timestamp", TIME_TOTAL_S, TRAINING_ITERATION]:
            if k in tmp:
                del tmp[k]  # not useful to log these

        flat_result = flatten_dict(tmp, delimiter="/")
        path = ["ray", "tune"]
        valid_result = {}

        for attr, value in flat_result.items():
            full_attr = "/".join(path + [attr])
            if isinstance(value, tuple(VALID_SUMMARY_TYPES)) and not np.isnan(value):
                valid_result[full_attr] = value
                self._trial_writer[trial].add_scalar(full_attr, value, global_step=step)
            elif (isinstance(value, list) and len(value) > 0) or (
                isinstance(value, np.ndarray) and value.size > 0
            ):
                valid_result[full_attr] = value

                # Must be video
                if isinstance(value, np.ndarray) and value.ndim == 5:
                    self._trial_writer[trial].add_video(
                        full_attr, value, global_step=step, fps=20
                    )
                    continue

                try:
                    self._trial_writer[trial].add_histogram(
                        full_attr, value, global_step=step
                    )
                # In case TensorboardX still doesn't think it's a valid value
                # (e.g. `[[]]`), warn and move on.
                except (ValueError, TypeError):
                    if log_once("invalid_tbx_value"):
                        logger.warning(
                            "You are trying to log an invalid value ({}={}) "
                            "via {}!".format(full_attr, value, type(self).__name__)
                        )

        self._trial_result[trial] = valid_result
        # model = torch.jit.load(trial.logdir+"/policy/model.pt")
        # env = self.env
        # obs = env.reset()
        # self._trial_writer[trial].add_graph(model, obs)
        self._trial_writer[trial].flush()

    def log_trial_end(self, trial: "Trial", failed: bool = False):
        if trial in self._trial_writer:
            if trial and trial.evaluated_params and self._trial_result[trial]:
                flat_result = flatten_dict(self._trial_result[trial], delimiter="/")
                scrubbed_result = {
                    k: value
                    for k, value in flat_result.items()
                    if isinstance(value, tuple(VALID_SUMMARY_TYPES))
                }
                self._try_log_hparams(trial, scrubbed_result)
            self._trial_writer[trial].close()
            del self._trial_writer[trial]
            del self._trial_result[trial]

    def _try_log_hparams(self, trial: "Trial", result: Dict):
        # TBX currently errors if the hparams value is None.
        flat_params = flatten_dict(trial.evaluated_params)
        scrubbed_params = {
            k: v for k, v in flat_params.items() if isinstance(v, self.VALID_HPARAMS)
        }

        np_params = {
            k: v.tolist()
            for k, v in flat_params.items()
            if isinstance(v, self.VALID_NP_HPARAMS)
        }

        scrubbed_params.update(np_params)

        removed = {
            k: v
            for k, v in flat_params.items()
            if not isinstance(v, self.VALID_HPARAMS + self.VALID_NP_HPARAMS)
        }
        if removed:
            logger.info(
                "Removed the following hyperparameter values when "
                "logging to tensorboard: %s",
                str(removed),
            )

        from tensorboardX.summary import hparams

        try:
            experiment_tag, session_start_tag, session_end_tag = hparams(
                hparam_dict=scrubbed_params, metric_dict=result
            )
            self._trial_writer[trial].file_writer.add_summary(experiment_tag)
            self._trial_writer[trial].file_writer.add_summary(session_start_tag)
            self._trial_writer[trial].file_writer.add_summary(session_end_tag)
        except Exception:
            logger.exception(
                "TensorboardX failed to log hparams. "
                "This may be due to an unsupported type "
                "in the hyperparameter values."
            )
            
    def on_episode_end(worker, base_env, policies, episode, env_index, **kwargs)-> None:
        episode.custom_metrics["episodes_total"] = episode.episodes_total
        # tune.result.histogram(nparray, max_bins=5)
        # episode.custom_metrics["action_histogram"] = np.histogram(episode.actions, bins=env.action_space.n)[0]

