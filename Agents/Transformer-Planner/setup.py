from setuptools import setup 
install_requires = []
with open('requirements.txt') as f:
    lines = f.readlines()
    for line in lines:
        install_requires.append(line[:-1])

setup(name='RLAgent', 
    author='Gonzalo Montesino Valle',
    author_email='gonzalo.montesino-valle@strath.ac.uk',
    version='0.0.1', 
    description='RL Agent for OpenAI Gym',
    install_requires=install_requires,
    packages=['RLAgent'])