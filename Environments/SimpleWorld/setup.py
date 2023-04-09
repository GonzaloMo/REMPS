from setuptools import setup 
install_requires = []
with open('requirements.txt') as f:
    lines = f.readlines()
    for line in lines:
        install_requires.append(line[:-1])
setup(name='SimpleWorld', 
    version='0.0.1', 
    description='Simple Grid Environment',
    install_requires=install_requires,
    packages=['SimpleWorld', 'SimpleWorld.envs'])