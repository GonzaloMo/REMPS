from simsat_v0 import Simple_satellite_v0
env = Simple_satellite_v0()
env.reset()
action = 3 #env.action_space.sample()
while 0<=action<=3:
    observation, reward, done, info = env.step(action)
    env.render()
    action = 3
env.view.quit()