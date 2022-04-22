from setuptools import setup 

setup(name='SimpleSatellite', 
    version='0.0.1', 
    description='Minimalistic observation satellite environment',
    install_requires=['gym', 'pygame'],
    packages=['SimpleSatellite', 'SimpleSatellite.envs'])