import pickle
from RAY_agent import RAY_agent
agetn = RAY_agent()
with open("Logs/RAY/Agent.pickle", "rb") as f:
    agent = pickle.load(f)
agent.load()
agent.test()