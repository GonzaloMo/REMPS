import gym
import SimpleSatellite
import yaml
configfile = '/home/ksb21109/Documents/PhD/REMPS/Environments/SimpleSatellite/SimpleSatellite/envs/Examples/Configurations/Gym_env/Opportunity_v1.yaml'
with open(configfile, 'r') as f:
    config = yaml.load(f, Loader=yaml.FullLoader)
env = gym.make('SimpleSatellite-opportunity-v1', **config)
def print_obs(obs):
    for k, v in obs.items():
        print(k+': ',v)
obs = env.reset()
while True:
    action = env.action_space.sample()
    observation, reward, done, info = env.step(action)
    env.render()
    print_obs(observation)
    print("Total reward = ", env.Total_reward)
    
env.view.quit()