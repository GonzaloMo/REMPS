from setuptools import setup 
install_requires = []
with open('requirements.txt') as f:
    lines = f.readlines()
    for line in lines:
        install_requires.append(line[:-1])

setup(name='Architecture', 
    author='Gonzalo Montesino Valle',
    author_email='gonzalo.montesino-valle@strath.ac.uk',
    version='0.0.1', 
    description='Arbiter Architecture',
    install_requires=install_requires,
    packages=['Architecture'])