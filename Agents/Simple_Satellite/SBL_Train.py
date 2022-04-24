# import and create environments 
import gym
import SimpleSatellite
from Reward_functions import Reward 

# import agent
from stable_baselines3 import PPO

config = { 'learning_rate': 1e-3, 'n_steps':2048, 'batch_size':64, 'n_epochs':5, 'gamma':0.99, 'gae_lambda':0.95,
         'clip_range':0.2, 'clip_range_vf':None, 'ent_coef':0.01, 'vf_coef':0.8, 'max_grad_norm':0.5, 
         'target_kl':None,  'policy_kwargs': dict(net_arch=[dict(pi=[64, 64], vf=[64, 64])])}
n_timestep = 1e7
if __name__ == '__main__':
    save_dir = "SBL_Logs/"

    # Create the vectorized environment
    env = gym.make("SimpleSatellite-v0", Reward = Reward)

    # Create model  
    policy = "MultiInputPolicy"

    # Create model
    
    model = PPO(policy, env, verbose=1, tensorboard_log='./'+save_dir+"tensorboard/SBL3/", **config)

    # Train model
    model.learn(total_timesteps=n_timestep)

    #Save Model
    model.save(save_dir+'SBL3/ppo_SimpleSatellite_v0')