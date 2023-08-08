from gym.envs.registration import register 
register(id='SimpleWorld-singlegoal-v0',entry_point='SimpleWorld.envs:Gridworld_singlegoal_env',) 
register(id='SimpleWorld-planfollowing-v0',entry_point='SimpleWorld.envs:Gridworld_planfollowing_env',) 
register(id='SimpleWorld-rover-v0',entry_point='SimpleWorld.envs:Gridworld_Rover_env',) 
register(id='SimpleWorld-planfollowing-CV',entry_point='SimpleWorld.envs:CurriculumEnv',)
