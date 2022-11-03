from gym.envs.registration import register 
register(id='SimpleWorld-NDAO-v0',entry_point='SimpleWorld.envs:NonDeterministicActionOutcomes_Env',) 
register(id='SimpleWorld-UPS-v0',entry_point='SimpleWorld.envs:UnachievablePlanState_Env',)
register(id='SimpleWorld-MA-v0',entry_point='SimpleWorld.envs:MissingActions_Env',)
register(id='SimpleWorld-CE-v0',entry_point='SimpleWorld.envs:Combined_Env',)
