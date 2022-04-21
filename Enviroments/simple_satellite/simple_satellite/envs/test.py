<<<<<<< HEAD
def print_obs(obs):
    print('Time: ', obs[0])
    print('Pos: ', obs[1])
    print('Busy: ', obs[2])
    print('Memory Level: ', obs[3])
    print('Images: ', obs[4:14])
    print('Analysi: ', obs[14:24])
    print('Targets: ', obs[24:25])
    print('Ground Stations: ', obs[25:26])
=======
# from simulation.Simulation import SatelliteSim
# from simulation.DrawSim import SatelliteView
# sim = SatelliteSim()
# view = SatelliteView(sim)
# sim.reset()
# action = 3
# print(action)
# while 0<=action<=3:

#     sim.update(action)
#     Action_avaible = sim.action_is_posible()
#     print(Action_avaible)
#     while not Action_avaible:
#         sim.update(3)
#         Action_avaible = sim.action_is_posible()
#         view.drawSim(sim)
#     action = int(input('Action: '))
    
# view.quit()

>>>>>>> 71a807e93adbcfb26d91ee96fb07986b64ac58e8
from simsat_v0 import Simple_satellite_v0
env = Simple_satellite_v0()
env.reset()
action = 3
while 0<=action<=3:
<<<<<<< HEAD
    print('--------------------------------')
    observation, reward, done, info = env.step(action, render=True)
    print_obs(observation)
=======
    print(env.step(action, render=True))
>>>>>>> 71a807e93adbcfb26d91ee96fb07986b64ac58e8
    action = int(input('Action: '))
    if action ==3: 
        for i in range(10):
            env.SatSim.update(3)
env.view.quit()