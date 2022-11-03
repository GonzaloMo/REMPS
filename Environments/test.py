import gym
import SimpleSatellite
env = gym.make('SimpleSatellite-v0', action_space_type="Advanced")
def print_obs(obs):
    for k, v in obs.items():
        print(k+': ',v)
env.reset()
while True:
    print('--------------------------------')
    print(env.action_list_names)
    action = input("Enter action: ")
    if action == "exit":
        break
    action = env.Name2number_action(action)
    observation, reward, done, info = env.step(action)
    env.render()
    print_obs(observation)
    print("Total reward = ", env.Total_reward)
    
    
env.view.quit()