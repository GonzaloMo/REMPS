import SimpleSatellite
from SimpleSatellite import envs
import os
# find the path to the SimpleSatellite folder
path = os.path.dirname(SimpleSatellite.__file__)
print(path)

# print attributes of the simulation folder
print(dir(envs))
envs.test()
print("Done")