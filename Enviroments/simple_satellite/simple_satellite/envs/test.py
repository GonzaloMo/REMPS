from simulation.Simulation import SatelliteSim
from simulation.DrawSim import SatelliteView
sim = SatelliteSim()
view = SatelliteView(sim)
sim.reset()
action = 3
print(action)
while 0<=action<=3:

    sim.update(action)
    Action_avaible = sim.action_is_posible()
    print(Action_avaible)
    while not Action_avaible:
        sim.update(3)
        Action_avaible = sim.action_is_posible()
    view.drawSim(sim)
    action = int(input('Action: '))
    
view.quit()