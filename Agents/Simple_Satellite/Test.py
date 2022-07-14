
from Arbiter import Arbiter
# Load Environment with random target positions
import gym
import SimpleSatellite
from ArbiterVoices.Planner import Planner_Voice


option_agent = 0

n_targets_per_planner = 5
n_planners = 2
total_targets = 10
if option_agent == 0:
    env = gym.make("SimpleSatelliteArb-v0", random=False, n_targets = total_targets)

    # Initialize arbiter
    agent = Arbiter(env, total_targets, n_targets_per_planner=n_targets_per_planner, n_planners=n_planners)

    # Start Simulation
    episode_reward = 0
    done = False
    
    obs = env.reset(total_targets)
    print(obs["Targets"])
    agent.reset_voices(obs)
    while not done:
        action = agent.take_action(obs)
        obs, reward, done, info = env.step(action)
        env.render(agent.Voices)
        episode_reward += reward
        print (f"Goals_achieved: {env.SatSim.Goals_achieved}")
    print(episode_reward)
    env.close()

elif option_agent == 1:
    env = gym.make("SimpleSatellitePlanner-v0", random=True)
    # Initialize Planner
    First_target = 0
    Last_target = First_target + n_targets_per_planner
    planner = Planner_Voice(env.SatSim, First_target, Last_target, name="Planner_0")
    # Start Simulation
    episode_reward = 0
    done = False
    obs = env.reset(total_targets)
    planner.get_plan(obs, amount=5)
    while not done:
        action = planner.getAction(obs)
        obs, reward, done, info = env.step(action)
        env.render(planner.full_plan)
        episode_reward += reward
    print(episode_reward)
    env.close()


