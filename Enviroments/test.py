import gym
import SimpleSatellite
env = gym.make('SimpleSatellite-v0')
def print_obs(obs):
    print('Time: ', obs[0])
    print('Pos: ', obs[1])
    print('Busy: ', obs[2])
    print('Memory Level: ', obs[3])
    print('Images: ', obs[4:14])
    print('Analysi: ', obs[14:24])
    print('Targets: ', obs[24])
    print('Ground Stations: ', obs[25])
env.reset()
action = 3
while 0<=action<=3:
    print('--------------------------------')
    observation, reward, done, info = env.step(action, render=True)
    print_obs(observation)
    print("Total reward = ", env.Total_reward)
    action = int(input('Action: '))
    if action ==3: 
        for i in range(10):
            env.SatSim.update(3)
env.view.quit()