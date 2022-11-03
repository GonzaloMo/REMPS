from setuptools import setup 
install_requires = []
with open('requirements.txt') as f:
    lines = f.readlines()
    for line in lines:
        install_requires.append(line[:-1])
setup(name='SimpleSatellite', 
    version='0.0.1', 
    description='Minimalistic observation satellite environment',
    install_requires=install_requires,
    packages=['SimpleSatellite', 'SimpleSatellite.envs'])