# Set Goals problem

This problem consists of an earth obseravtion satellite that has to take pictures of a set of targets, a set number of times. 

___

## V0
### Observation Space
- **Orbit**: current orbit [0, $\infty$)
- **Pos**: current angular position [0, 360]
- **Busy**: busy or not [0 or 1]
- **Memory Level**: memory used %/100 [0, 1]
- **Images**: n images per target taken [0, $\infty$)
- **Analysis**: n images per target analyzed [0, $\infty$)
- **Targets**: target initial and final position in degrees [0, 360]
- **Ground Stations**: ground station initial and final position in degrees [0, 360]
- **Goals**: n of analyzed picture still left to be dumped [0, $\infty$)
- **Power**: Percentaje of power left [0, 100]

### Action Space
- **Do nothing**: Do nothing, 0
- **Take picture**: Take a picture of the target, [1, n_targets]
- **Analyze picture**: Analyze a picture of the target, (n_targets, 2$\times$n_targets+1]
- **Dump picture**: Dump a picture of the target, (2$\times$n_targets+1, 3$\times$n_targets+2]

---

### V1
### Observation Space
- **Orbit**: current orbit [0, $\infty$)
- **Pos**: current angular position [0, 360]
- **Busy**: busy or not [0 or 1]
- **Memory Level**: memory used %/100 [0, 1]
- **Images**: n images per target taken [0, $\infty$)
- **Analysis**: n images per target analyzed [0, $\infty$)
- **Targets**: target initial and final position in degrees [0, 360]
- **Ground Stations**: ground station initial and final position in degrees [0, 360]
- **Goals**: n of analyzed picture still left to be dumped [0, $\infty$)
- **Eclipse**: Is it in light and full umbra initial and final position in degrees [0, 360]
- **Power**: Percentaje of power left [0, 100]

### Action Space
- **Do nothing**: Do nothing, 0
- **Take picture**: Take a picture of the target, [1, n_targets]
- **Analyze picture**: Analyze a picture of the target, (n_targets, 2$\times$n_targets+1]
- **Dump picture**: Dump a picture of the target, (2$\times$n_targets+1, 3$\times$n_targets+2]

---

### V2
### Observation Space
- **Pos**: current position expresed in sin and cos
- **Busy**: busy or not
- **Memory Level**: memory used %/100
- **Images**: n images per target taken
- **Analysis**: n images per target analyzed
- **Targets**: vector of targets visibility (1 if visible, 0 if not)
- **Ground Stations**: vector of Ground Station visibility (1 if visible, 0 if not)
- **Goals**: n of analyzed picture still left to be dumped
- **Eclipse**: Wether the satellite is in light (1), in umbra (0) or in penumbra (-1)
- **Power**: Percentaje of power left [0 , 1]


### Action Space
- **Do nothing**: Do nothing, 0
- **Take picture**: Take a picture of the target, [1, n_targets]
- **Analyze picture**: Analyze a picture of the target, (n_targets, 2$\times$n_targets+1]
- **Dump picture**: Dump a picture of the target, (2$\times$n_targets+1, 3$\times$n_targets+2]
  
___

## Reward Functions
[Reward function description](./Reward_function/README.md)

Coded reward function:
- [V1](./Reward_function/v1.py): Reward function v9
- [V2](./Reward_function/v2.py): Reward function v2