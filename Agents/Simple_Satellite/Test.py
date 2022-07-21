
from Arbiter import Arbiter
# Load Environment with random target positions
import gym
import SimpleSatellite
from ArbiterVoices.utils import read_seed
from ArbiterVoices.Planner import Planner_Voice
from time import sleep
import datetime

newsim = True
log_dir = "./Logs/Simulation/"
# Set Seed for reproducibility
if newsim:
    seed_env = None
    seed_planner = None
    n_targets_per_planner = 5
    n_planners = 2
    total_targets = 10
    amount_of_goals_per_target = 15
    with open(f"{log_dir}Seed.txt", "a") as f:
        f.write(f"New Simulation run at {datetime.datetime.now()}\n")
        f.write(f"----------------------------------------------------\n")
        f.write(f"N_targets: {total_targets}\n")
        f.write(f"N_targets_per_planner: {n_targets_per_planner}\n")
        f.write(f"Amount_of_goals_per_target: {amount_of_goals_per_target}\n")
else:
    date_time = "2022-07-19 17:34:14.429248"
    seed_dict = read_seed(f"{log_dir}Seed.txt", date_time)
    seed_planner = []
    planner_names = []
    for key in seed_dict:
        if "Simulation_Seed" == key:
            seed_env = seed_dict[key]
        elif "N_targets" == key:
            total_targets = seed_dict[key]
        elif "N_targets_per_planner" in key:
            n_targets_per_planner = seed_dict[key]
        elif "Amount_of_goals_per_target" in key:
            amount_of_goals_per_target = seed_dict[key]
        else:
            seed_planner.append(seed_dict[key])
            planner_names.append(key)
    n_planners = len(planner_names)
    print(f"Loadded Simulation: {seed_dict}")

alpha = list(range(1, n_planners+1))
# Initialize Environment
env = gym.make("SimpleSatelliteArb-v1", random=False, n_targets = total_targets)
# Initialize arbiter
agent = Arbiter(env, total_targets, n_targets_per_planner=n_targets_per_planner, n_planners=n_planners,seed_v=seed_planner, amount=amount_of_goals_per_target)
# Start Simulation
episode_reward = 0
done = False
obs = env.reset(total_targets, seed=seed_env)
print(obs["Targets"])
agent.reset_voices(obs)
if newsim:
    with open(f"{log_dir}Seed.txt", "a") as f:
        f.write(f"END\n")
        f.write(f"----------------------------------------------------\n\n")
while not done:
    action = agent.take_action(obs, alpha, type_selec_method="Priority")
    obs, reward, done, info = env.step(action)
    if "Dump" in env.action_list_names[action]:
        agent.upadte_voices_goals()
    env.render(agent.Voices)
    episode_reward += reward
print(episode_reward)
env.close()
goals_achieved = env.SatSim.Goals_achieved
print(f"Goals Achieved: {goals_achieved}")
for voice in agent.Voices:
    goals_left = voice.Goal_ref.goals
    init_goals = voice.Goal_ref.Initial_goals
    print(f"{voice.name} had {init_goals} goals initially")
    print(f"{voice.name} has {goals_left} goals left")

