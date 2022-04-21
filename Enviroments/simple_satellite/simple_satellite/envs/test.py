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

from simsat_v0 import Simple_satellite_v0
env = Simple_satellite_v0()
env.reset()
action = 3
print(action)
while 0<=action<=3:
    print(env.step(action, render=True))
    action = int(input('Action: '))
    if action ==3: 
        for i in range(10):
            env.SatSim.update(3)
env.view.quit()