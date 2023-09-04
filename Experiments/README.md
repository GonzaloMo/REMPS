# IAC 2023 - Experiments

This repository contains the code for the experiments of the paper "" submitted to the Internatioanl Astronautical Congress (IAC) 2023.

## Installation
### Virtual Environment (conda)
We recomend to use a virtual environment to run the experiments. We use conda to create a virtual environment with the required dependencies. To create the virtual environment, run the following command:

``` 
conda env create --prefix ../REMPS_Env -f ../REMPS_Virtual_Env.yml

conda config --set env_prompt '({name})' # To change the prompt to show the name of the virtual environment

conda activate ./REMPS_Env
```

# Run the experimen (no overlap)
To run the experiment, run the following command:

```
python3 NoOverlap.py -v/--numberVoices Nv -f/--folder "results/folder/name"
```

- Nv: is the number of voices to be used in the experiment, and 
- "results/folder/name": is the name of the folder where the results will be stored.

