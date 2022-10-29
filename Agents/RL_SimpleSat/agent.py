from typing import Dict
import ray
from ray import tune 
from ray.rllib.agents.ppo import PPOTrainer
from ray.rllib.agents.a3c import  A2CTrainer

class RAY_agent:
    def __init__(self,
                run = 'PPO',    
                save_dir:str = "Logs/Agent/",
                config: Dict = {"framework":"torch",
                    "env": "SimpleSatellite-v0",
                    "env_config": "Trainning_1",
                    "model": {
                        "fcnet_hiddens": [64, 64],
                        "fcnet_activation": "tanh"
                        },
                    "num_workers": 0,
                    "lr": 1e-5, 
                    "entropy_coeff": 0.0,
                    "sgd_minibatch_size": 64, },
                ):
        self.save_dir = save_dir
        self.config = config
        self.env_name = config['env']
        self.Algotrithm = run
        if run == 'PPO':
            self.agent = PPOTrainer#(logger_creator=self.custom_log_creator())
        elif run == 'A2C':
            self.agent = A2CTrainer
        ray.init(ignore_reinit_error=True)
            

    def train(self, stop_criteria, env_config, Save_path, restore_lc=True):
        """
        Train an RLlib PPO agent using tune until any of the configured stopping criteria is met.
        :param stop_criteria: Dict with stopping criteria.
            See https://docs.ray.io/en/latest/tune/api_docs/execution.html#tune-run
        :return: Return the path to the saved agent (checkpoint) and tune's ExperimentAnalysis object
            See https://docs.ray.io/en/latest/tune/api_docs/analysis.html#experimentanalysis-tune-experimentanalysis
        """
        if restore_lc:
            restore = self.last_checkpoint.to_directory()
        else:
            restore = None
        self.env_config = env_config["Config"]
        self.config["env_config"]= env_config
        self.analysis = ray.tune.run(self.agent, config=self.config, local_dir=self.save_dir, stop=stop_criteria,
                                checkpoint_at_end=True, name=Save_path, restore=restore)
        self.last_checkpoint = self.analysis.get_last_checkpoint()

    def save(self, path: str):
        import os
        path += '/Model'
        
        if not os.path.exists(path):
            os.makedirs(path)
        # Save Trainning data 
        # self.analysis.save(path+'/Model/Analysis')
        # Save Configuration Variables
        import yaml
        Temp_config = {}
        Temp_config['Algotrithm'] = self.Algotrithm
        Temp_config['save_dir'] = self.save_dir
        Temp_config['config'] = self.config
        Temp_config['env_name'] = self.env_name
        Temp_config['env_config'] = self.env_config
        Temp_config['last_checkpoint'] = str(self.last_checkpoint.to_directory())
        with open(path+'/Config.yaml', 'w') as outfile:
            yaml.dump(Temp_config, outfile)
        print('Agent Saved')

    def load(self, path: str, Partial_load = False):
        """
        Agent loading function.
        :param path: Path to the saved agent
        """
        # Load Configuration Variables
        import yaml
        with open(path+'/Model/Config.yaml') as file:
            Temp_config = yaml.load(file, Loader=yaml.FullLoader)
        self.save_dir = Temp_config['save_dir']
        self.config = Temp_config['config']
        self.env_name = Temp_config['env_name']
        self.env_config = Temp_config['env_config']
        self.Algotrithm = Temp_config['Algotrithm']
        if self.Algotrithm == 'PPO':
            self.agent = PPOTrainer(config=self.config)
        elif self.Algotrithm == 'A2C':
            self.agent = A2CTrainer
        last_checkpoint_loc = Temp_config['last_checkpoint'].replace(self.save_dir, "./Logs/Agent/")

        # Load Agent
        if not Partial_load:
            self.agent.restore(checkpoint_path=last_checkpoint_loc)
        

    def test(self, env, render=False):
        """
        Test trained agent for a single episode. Return the episode reward
        :param env: Environment to test the agent on
        :return: Episode reward
        """

        # run until episode ends
        episode_reward = 0
        done = False
        obs = env.reset()
        while not done:
            action = self.agent.compute_action(obs)
            obs, reward, done, info = env.step(action)
            if render:
                env.render()
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
    
    