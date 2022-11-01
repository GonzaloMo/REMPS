# RL SimpleSat
This folder contains all the file that compose a RL agent made to solve the SimpleSat problem. The agent is based on the [Proximal Policy Optimization](https://arxiv.org/abs/1707.06347) algorithm.

## Installation
To install the agent you need to install the following dependencies:
```
pip install -r requirements.txt
```

## How to use
To use the agent, you need to have the [OpenAI Gym](https://gym.openai.com/) library installed. Then, you can run the agent with the following command:
```
python3 main.py
```
The agent will be trained on the SimpleSat problem and will be tested on it. The results will be saved in the `Logs/Agent/RAY` folder.

## How to modify
The agent is composed of 3 files:
- `main.py`: This file contains the main function that will run the agent. It will train the agent on the SimpleSat problem and then test it on it.
  - `--mode`: This argument allows you to choose the mode of the agent. The possible values are `train` and `test`. The default value is `train`.
  - `--Conifg`: This argument allows you to choose the configuration file that will be used by the agent. To train or test the agent, you need to use   the `config.yaml` file. The default value is `Training_config.yaml`.
