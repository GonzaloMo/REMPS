import gym
import SimpleSatellite
import yaml
import numpy as np
Mainconfigfile = "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/v2.yaml"
CV_path = [
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_0.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_1.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_2.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_3.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_4.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_5.yaml",
    "./SimpleSatellite/SimpleSatellite/envs/setgoals/Configurations/curriculum_learning/Dif_6.yaml",
]
env = gym.make('SimpleSatellite-setgoals_CV-v2', main_config_file=Mainconfigfile, CV_path=CV_path)
def print_obs(obs):
    for k, v in obs.items():
        print(k+': ',v)
def sinCos2degree(x, y):
    rad = np.arctan2(x, y)
    if rad < 0:
        rad += 2 * np.pi
    return rad * 180 / np.pi
for i in range(len(CV_path)):
    env.set_task(i)
    obs = env.reset()
    done = False
    
    while not done:
        action = env.action_space.sample()
        observation, reward, done, info = env.step(action)
        env.render()
        # print_obs(observation)
        if len(observation['Pos']) == 2:
            print(sinCos2degree(observation['Pos'][0], observation['Pos'][1]))
        else:
            print("{.2d}".format(observation['Pos']))
        print("Total reward = ", env.Total_reward)
    
env.view.quit()