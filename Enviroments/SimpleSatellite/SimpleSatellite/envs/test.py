from simsat_v0 import Simple_satellite_v0
env = Simple_satellite_v0()
env.reset()
action = env.action_space.sample()
while 0<=action<=3:
    # print(action)
    observation, reward, done, info = env.step(action, render=True)
    
    action = env.action_space.sample()
    
    # print('--------------------------------')
    # print("Total reward = ", env.Total_reward)
    # if action ==3: 
    #     for i in range(10):
    #         env.SatSim.update(3)
env.view.quit()