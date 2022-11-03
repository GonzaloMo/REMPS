from setuptools import setup 
install_requires = []
with open('requirements.txt') as f:
    lines = f.readlines()
    for line in lines:
        install_requires.append(line[:-1])

setup(name='ORToolAgent', 
    author='Cheyenne Powell',
    author_email='cheyenne.powell@strath.ac.uk',
    version='0.0.1', 
    description='simple Scheduler with OR Tool for OpenAI Gym',
    install_requires=install_requires,
    packages=['ORToolAgent'])