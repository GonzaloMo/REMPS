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
The agent will be trained on the SimpleSat problem and will be tested on it. The results will be saved in the `results` folder.

## How to modify
The agent is composed of 3 files:
- `main.py`: this file contains the main function. It is used to train and test the agent.
- `agent.py`: this file contains the agent class. It is used to create the agent and to train it.
- `Reward.py`: this file contains the reward function. It is used to compute the reward of the agent.