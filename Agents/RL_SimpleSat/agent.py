from typing import Dict
import ray
from ray import tune 
from ray.rllib.agents.ppo import PPOTrainer
from ray.rllib.agents.a3c import  A2CTrainer
from datetime import datetime
import os
import tempfile
from ray.tune.logger import UnifiedLogger
class RAY_agent:
    def __init__(self,
                run = 'PPO',    
                save_dir:str = "Logs/Agent/RAY",
                config: Dict = {"framework":"torch",
                    "env": "SimpleSatellite-v0",
                    "model": {
                        "fcnet_hiddens": [64, 64],
                        "fcnet_activation": "tanh"
                        },
                    "num_workers": 0,
                    "lr": 1e-5, 
                    "entropy_coeff": 0.0,
                    "sgd_minibatch_size": 64, }
                ):
        self.type_run = run
        if run == 'PPO':
            self.agent = PPOTrainer
        elif run == 'A2C':
            self.agent = A2CTrainer
        ray.init(ignore_reinit_error=True)
        self.save_dir = save_dir
        self.config = config
        self.env_name = config['env']
            

    def train(self, stop_criteria):
        """
        Train an RLlib PPO agent using tune until any of the configured stopping criteria is met.
        :param stop_criteria: Dict with stopping criteria.
            See https://docs.ray.io/en/latest/tune/api_docs/execution.html#tune-run
        :return: Return the path to the saved agent (checkpoint) and tune's ExperimentAnalysis object
            See https://docs.ray.io/en/latest/tune/api_docs/analysis.html#experimentanalysis-tune-experimentanalysis
        """
        self.analysis = ray.tune.run(self.agent, config=self.config, local_dir=self.save_dir, stop=stop_criteria,
                                checkpoint_at_end=True)
        
        return self.analysis

    def load(self):
        """
        Load a trained RLlib agent from the specified path. Call this before testing a trained agent.
        :param path: Path pointing to the agent's saved checkpoint (only used for RLlib agents)
        """
        self.agent = PPOTrainer(config=self.config, env=self.env_name)
        # list of lists: one list per checkpoint; each checkpoint list contains 1st the path, 2nd the metric value
        checkpoints = self.analysis.get_trial_checkpoints_paths(trial=self.analysis.get_best_trial('episode_reward_mean'),
                                                        metric='episode_reward_mean')
        # retriev the checkpoint path; we only have a single checkpoint, so take the first one
        print ("{:<8} {:<15}".format('Num','Path','Reward'))
        for i,j in enumerate(checkpoints):
            print ("{:<2} {:<8}".format(i,round(j[1],2)))
        
        
        checkpoint = int(input("Num to be loaded: "))
        
        path = checkpoints[0][checkpoint]
        self.agent.restore(path)

    def test(self):
        """Test trained agent for a single episode. Return the episode reward"""
        # instantiate env class
        env = self.env_class(self.env_config)

        # run until episode ends
        episode_reward = 0
        done = False
        obs = env.reset()
        while not done:
            action = self.agent.compute_action(obs)
            obs, reward, done, info = env.step(action, render=True)
            episode_reward += reward
        return episode_reward

    def add_to_config(self, config: Dict):
        self.config = {**self.config, **config}
    
    def grid_search_config(self, search: Dict):
        for v, k in search.items():
            if type(v) == Dict:
                for v1, k1 in v.items():
                    self.config[k][k1] = tune.grid_search(v1)
            else:
                self.config[k] = tune.grid_search(v)