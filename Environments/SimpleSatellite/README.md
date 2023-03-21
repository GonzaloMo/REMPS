# Simple Satellite

Video: https://youtu.be/cAdJuryALuc
<iframe width="1280" height="742" src="https://www.youtube.com/embed/cAdJuryALuc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


PDDL: http://editor.planning.domains/#read_session=DUrGySABsW

[![Simple Satellite video](http://img.youtube.com/vi/cAdJuryALuc/0.jpg)](http://www.youtube.com/watch?v=cAdJuryALuc)

---

## Installation 
```
git clone https://github.com/GonzaloMo/REMPS.git 
cd REMPS/Environments/SimpleSatellite
```
For Linux

```
pip3 install -e .
```

For Windows

```
python -m pip install -e .
```
## Usage
```
import gym
import SimpleSatellite
env = gym.make('SimpleSatellite-v0')
```

---

## Simulation versions
### V1
In this version the simulation has a fixed number of orbits, and charges if an action is not being taken

### V2
In this version the simulation has a fixed number of orbits, and only charges if action sent is idle.

### V3
In this version the simulation finishes when the satellite achieves all goals, and charges if an action is not being taken.

---

## Gym environments

- [SimpleSatellite-setgoals](./SimpleSatellite/envs/SetGoals/README.md): (v0, v1, v2)
- [SimpleSatellite-opportunity](./SimpleSatellite/envs/Opportunity/README.md): (v1, v2)
- [SimpleSatellite-planner](./SimpleSatellite/envs/Planner/README.md): (NOT FULLY IMPLEMENTED)
- [SimpleSatellite-Arbiter](./SimpleSatellite/envs/Arbiter/README.md): (NOT FULLY IMPLEMENTED)