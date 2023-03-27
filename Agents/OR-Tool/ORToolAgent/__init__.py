def makeAgent(env):
    envName = env.unwrapped.spec.id
    if  "SimpleSatellite" in envName:
        from ORToolAgent.SimpleSat_agent import ORAgent
        return ORAgent(env) 