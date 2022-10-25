from setuptools import setup 

setup(name='SimpleSatellite', 
    version='0.0.1', 
    description='Minimalistic observation satellite environment',
    install_requires=['gym==0.20.0', 'pygame', 'numpy', 'pyyaml'],
    packages=['SimpleSatellite', 'SimpleSatellite.envs'])