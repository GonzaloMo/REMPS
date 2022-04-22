import SimpleSatellite.envs
from gym.envs.registration import register 
register(id='SimpleSatellite-v0',entry_point='SimpleSatellite.envs:Simple_satellite_v0',) 

import pkg_resources
installed_packages = pkg_resources.working_set
for i in installed_packages:
    if 'ray' in i.key.lower():
        import gym
        from ray.tune.registry import register_env
        def env_creator(env_config):
            return gym.make('SimpleSatellite-v0')  # return an env instance
        register_env("SimpleSatellite-v0", env_creator)