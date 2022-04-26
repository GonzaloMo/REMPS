# import and create environments 
def env_creator(env_config):
    import gym
    import SimpleSatellite
    return gym.make("SimpleSatellite-v0")#SimpleSatellite.SimpleSatellite.envs.Simple_satellite_v0(env_config)
from Reward_functions import Reward
env_config = {"Reward": Reward}

# import agent
import ray
from ray import tune

from ray.rllib.agents.ppo import PPOTrainer
from ray.tune.registry import register_env
register_env("SimpleSatellite-v0", lambda env_config: env_creator(env_config))
ray.init(ignore_reinit_error=True)

import IPython as ip
if __name__ == "__main__":


    config = {
        "framework":"torch",
        "env": "SimpleSatellite-v0",
        "model": {
            "fcnet_hiddens": [64, 64],
            "fcnet_activation": "relu"
            },
        "num_workers": 0,
        "lr": 1e-5, #tune.grid_search([1e-4, 1e-5, 1e-6]),
        "entropy_coeff": 0.02, # tune.grid_search([0.0, 0.01, 0.02]),
        "sgd_minibatch_size": 128, # tune.grid_search([64,128,256])
    }
    stop = {
        'timesteps_total': 1000000
    }
    results = tune.run(
        'PPO', # Specify the algorithm to train
        config=config,
        stop=stop,
        local_dir="Logs/tensorboard/RAY",
       checkpoint_at_end=True
    ) 
    checkpoints = results.get_trial_checkpoints_paths(trial=results.get_best_trial('episode_reward_mean'),
                                                       metric='episode_reward_mean')
    # retriev the checkpoint path; we only have a single checkpoint, so take the first one
    checkpoint_path = checkpoints[0][0]
    print(checkpoint_path)

    ip.embeded()