# import and create environments 
import gym
import SimpleSatellite
# import agent
import ray
from ray import tune

from ray.tune.registry import register_env
env =  gym.make("SimpleSatellite-v0")
def env_creator(env_config):
    return gym.make("SimpleSatellite-v0")

register_env("SimpleSatellite-v0", env_creator)
ray.init(ignore_reinit_error=True)
config = {
    'env': 'SimpleSatellite-v0',
    "num_workers": 2,
    "vf_share_layers": tune.grid_search([True, False]),
    "lr": tune.grid_search([1e-4, 1e-5, 1e-6]),
}
stop = {
    'timesteps_total': 1000000
}
results = tune.run(
    'PPO', # Specify the algorithm to train
    config=config,
    stop=stop
) 