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
- `train.py`: This file contains the training loop of the agent. It is the main file of the agent. Its arguments are:
  - `--env_name`: The name of the environment to train on. The environment must be registered in the `gym` library.
  - `--load_dir`: The directory where the results will be saved.
  - `--algo`: The algorithm to use. The agent is based on the PPO algorithm.
  - `--reward_type`: The reward function to use. The agent is based on the `Reward_v1` reward function. 
-  `test.py`: This file contains the testing loop of the agent. Its arguments are:
  parser.add_argument("--env_name", type=str, default="SimpleSatellite-v0")
parser.add_argument("--save_dir", type=str, default=f"/Results")
parser.add_argument("--algo", type=str, default="PPO")
parser.add_argument("--reward_module", type=str, default="Reward_functions.SimpleSat")
parser.add_argument("--reward_type", type=str, default="Reward_v1")
parser.add_argument("--env_config", type=str, default="Trainning_1")
parser.add_argument("--n_episodes", type=int, default=10)
parser.add_argument("--render", type=bool, default=False)

  - `--env_name`: The name of the environment to test on. The environment must be registered in the `gym` library.
  - `--load_dir`: The directory where the results are saved.
  - `