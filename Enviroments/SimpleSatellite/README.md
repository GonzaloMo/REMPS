# Simple Satellite

Video: https://youtu.be/cAdJuryALuc
<iframe width="1280" height="742" src="https://www.youtube.com/embed/cAdJuryALuc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



PDDL: http://editor.planning.domains/#read_session=DUrGySABsW

[![Simple Satellite video](http://img.youtube.com/vi/cAdJuryALuc/0.jpg)](http://www.youtube.com/watch?v=cAdJuryALuc)


## Installation 
```
git clone https://github.com/GonzaloMo/REMPS.git 
cd REMPS/Environments/SimpleSatellite
pip3 install -e .
```
## Usage
```
import gym
import SimpleSatellite
env = gym.make('SimpleSatellite-v0')
```

## Environments
### Action Spaces
#### V0
Version 0 of the simple satellite environment Action space:
- Take picture (0)
- Analyze last un-analyzed picture of the Memory (1)
- Dump last analyze picture of the memory (2)
- Don't take an action (3)

$$
a \in [0,4]
$$

#### V1
Version 1 of the simple satellite environment Action space:
- Take picture- (0)
- Analyze a specific image of the memory ([1, $n_t$])
- Dump a specific image of the memory ([$n_t$+1, $2n_t$])
- Don't take an action ($2n_t+1$)
$$
a \in [0,2n_t+1]
$$

### Observation Space
The observation space is a 'Dict' gym space and all sub-observations spaces are defined as gym 'Box' spaces:
- Orbit: $o \in[0, M_o]$ -> $M_o\equiv$ Max orbits per episode, 
- Pos: $p \in[0,360]$,
- Busy: $b \in[0, 1]$,
- Memory Level: $o \in[0, M_m-1]$ -> $M_m\equiv$ Memory size, 
- Images: $[img_1,...,img_n]| \forall img \in [0,n_t-1]$ \& $n = 1,...,M_m$,
- Analysis: $[an_1,...,an_n]| \forall img \in [0,1]$ \& $n = 1,...,M_m$,
- Targets: $\begin{bmatrix}
    x_1 & y_1 \\
    \vdots & \vdots \\
    x_n & y_n
\end{bmatrix}$,
- Ground Stax_1 & y_1 \\
\vdots & \vddot \\
x_n &tio y_nns: np.array(self.groundStations, dtype=np.float32)}