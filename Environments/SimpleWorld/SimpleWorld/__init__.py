from gym.envs.registration import register 
register(id='SimpleWorld-singlegoal-v0',entry_point='SimpleWorld.envs:Gridworld_singlegoal_env',) 
register(id='SimpleWorld-planfollowing-v0',entry_point='SimpleWorld.envs:Gridworld_planfollowing_env',) 
