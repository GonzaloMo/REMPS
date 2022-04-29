from RAY_agent import RAY_agent
import pickle
config = {
    "framework":"torch",
    "env": "SimpleSatellite-v0",
    "model": {
        "fcnet_hiddens": [64, 64],
        "fcnet_activation": "relu"
        },
    "num_workers": 0,
    "lr": 1e-5, #tune.grid_search([1e-4, 1e-5, 1e-6]),
    "entropy_coeff": 0.02, # tune.grid_search([0.0, 0.01, 0.02]),
    "sgd_minibatch_size": 128, # tune.grid_search([64,128,256])
}
agent = RAY_agent()
stop_criteria = {'timesteps_total': 10000000}
agent.add_to_config(config)
agent.train(stop_criteria)
with open("Logs/RAY/Agent.pickle", "wb") as f:
    pickle.dump(agent, f)