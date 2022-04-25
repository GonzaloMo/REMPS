# import and create environments 
def env_creator(env_config):
    import gym
    import SimpleSatellite
    return gym.make("SimpleSatellite-v0")
from ray.tune.registry import register_env
register_env("SimpleSatellite-v0", lambda env_config: env_creator(env_config))
from ray.rllib.agents.ppo import  PPOTrainer
config = {
        "framework":"torch",
        "env": "SimpleSatellite-v0",
        "model": {
            "fcnet_hiddens": [64, 64],
            "fcnet_activation": "relu"
            },
        "num_workers": 0,
        "vf_share_layers": False,
        "lr": 1e-5,
    }
agent = PPOTrainer(config=config)
agent.restore("Logs/tensorboard/RAY/PPO/PPO_SimpleSatellite-v0_1b4d4_00004_4_lr=1e-05,vf_share_layers=False_2022-04-25_09-17-16/checkpoint_000250/checkpoint-250")
# run until episode ends
episode_reward = 0
done = False
env = env_creator(0)
obs = env.reset()
while not done:
    action = agent.compute_action(obs)
    obs, reward, done, info = env.step(action, render=True)
    episode_reward += reward