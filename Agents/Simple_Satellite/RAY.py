# import and create environments 
import SimpleSatellite
def env_creator(env_config):
    return SimpleSatellite.SimpleSatellite.envs.Simple_satellite_v0(env_config)
from Reward_functions import Reward
env_config = {"Reward": Reward}

# import agent
import ray
from ray import tune

from ray.tune.registry import register_env
register_env("SimpleSatellite-v0", lambda env_config: env_creator(env_config))
ray.init(ignore_reinit_error=True)
if __name__ == "__main__":
    config = {
        "framework":"torch",
        'env': 'SimpleSatellite-v0',
        "model": {
            "fcnet_hiddens": [64, 64],
            "fcnet_activation": "relu"
            }
        # "num_workers": 4,
        # "vf_share_layers": tune.grid_search([True, False]),
        # "lr": tune.grid_search([1e-4, 1e-5, 1e-6]),
    }
    stop = {
        'timesteps_total': 1000000
    }
    results = tune.run(
        'PPO', # Specify the algorithm to train
        
        config=config,
        stop=stop,
        local_dir="Logs/tensorboard/RAY"
    ) 