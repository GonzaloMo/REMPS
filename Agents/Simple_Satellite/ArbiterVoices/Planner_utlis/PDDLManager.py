from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import requests
import subprocess
import math

from tqdm import tgrange

def generatePlan(loc: str, domain: str, problem: str, plan: str):
    with open(loc+'generateplan.sh', 'rb') as file:
        script = file.read()
    domain = domain.encode('UTF-8')
    problem = problem.encode('UTF-8')
    plan = plan.encode('UTF-8')
    loc = loc.encode('UTF-8')
    script = script % (loc, domain, problem, plan,)
    exit_code = subprocess.call(script, shell=True)
    with open(loc+plan, 'a') as file:
        script = file.write('\nEND')
    if exit_code:
        return False
    else:
        return True


def writePDDLProblem(obs: dict, file: str, goals, orbits=5):
    header = "(define(problem satprob)\n"
    header +="(:domain SimpleSatellite)\n"
    # Define Objects
    objects = "(:objects\n "
    mem = ''
    img = ''
    imgS = ''
    memfree = '' # used in initial condition
    for index, target in enumerate(obs['Targets']):
        mem += " mem" + str(index)
        img += " img" + str(index+1)
        imgS += "  (= (image_score img"+str(index+1)+") 0)\n"
        
    mem += " - memory\n"
    img += " - image\n"
    objects = "(:objects\n " + mem + img +")\n"
    # Define initial conditions
    initC = "(:init\n"
    initC +="  (sat_free)\n"
    initC +=imgS
    initC +="  (= (total_score) 0)\n\n"
    memtak = ''
    animg = ''
    for memo, targ in enumerate(obs['Images']):
        if targ == 0:
            memfree +="  (memory_free mem" + str(index) + ")\n"
        else:
            memtak +="   (memory_taken mem" + str(memo) + " img" + str(targ) + ")\n"
            if obs['Analysis'][memo]:
                animg += "(image_analysed mem" + str(memo) + " img" + str(targ) + ")\n"
    initC +=memfree + "\n"
    tg = ''
    gs = ''
    for o in range(orbits):
        for index, target in enumerate(obs['Targets']):
            start = target[0] + 360 * o
            end = target[1] + 360 * o
            tg += "  (at " + str(round(start, 3)) + " (image_available img" + str(index+1) + "))\n"
            tg += "  (at " + str(round(end, 3)) + " (not (image_available img" + str(index+1) + ")))\n"
        for index, target in enumerate(obs['Ground Stations']):
            start = target[0] + 360 * o
            end = target[1] + 360 * o
            gs += "  (at " + str(round(start, 3)) + " (dump_available))\n"
            gs += "  (at " + str(round(end, 3)) + " (not (dump_available)))\n"
    initC += tg
    initC += gs
    initC +="\n"
    initC +=")\n"
    # Define Goals
    Goals = "(:goal (and\n"
    for targ, n_img in enumerate(goals):
        if n_img>0:
            Goals += "  (= (image_score img"+str(targ+1)+") "+str(n_img)+")\n"
    Goals += ")))\n"

    # Join full problem
    problem = header + objects + initC + Goals
    with open(file, "w") as f:
        f.write(problem)
        f.close()


def readPDDLPlan(file: str):
    actionMap = {"take_image": 0, "dump_image": 1, "analyse_image": 2}
    plan = []
    with open(file, "r") as f:
        line = f.readline().strip()
        start_reading = False
        end = True
        while end:
            if start_reading and line:
                tokens = line.split()
                time = tokens[0][:-1]
                action = tokens[1][1:]
                image = tokens[2]
                memory = tokens[3][:-1]
                plan.append((float(time), actionMap[action], int(image[3:]), int(memory[3:])))
            if 'Time' in line:
                start_reading = True
            line = f.readline().strip()
            if 'END' in line:
                end = False
        f.close()
    return plan

def writePDDLDomain(sim: SatelliteSim, file: str):
    # duration of action are set in relation to space not time done by 
    # DA = V*da where 
    # - V is the velocity of the satellite in degrees/seconds
    # - da = duration of the action in seconds
    # - DA = Duration of the action in degrees
    DA = math.ceil(sim.velocity * sim.DURATION_ANALYSE)
    DD = math.ceil(sim.velocity * sim.DURATION_DUMP)
    DI = math.ceil(sim.velocity * sim.DURATION_TAKE_IMAGE)
    with open(file, "w") as f:
        f.write(
f"""(define (domain SimpleSatellite)

    (:requirements
        :durative-actions
        :timed-initial-literals 
        :equality
        :negative-preconditions
        :numeric-fluents
        :object-fluents
        :typing
    ) 

    (:types
        image
        memory
    )

    (:predicates
        (image_available ?i  - image)
        (image_dumped ?i  - image)
        
        (memory_free ?m - memory)
        (memory_taken ?m - memory ?i - image)
        (image_analysed ?m - memory ?i  - image)
        
        (dump_available)
        
        (sat_busy)
        (sat_free)
    )

    (:functions
        (image_score ?i - image)
        (total_score)
    )

    (:durative-action take_image
        :parameters (?i - image ?m - memory)
        :duration (= ?duration {int(DI)})
        :condition (and 
            (at start (sat_free))
            (at start (image_available ?i))
            (at start (memory_free ?m))
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at start (not (memory_free ?m)))
            (at end (memory_taken ?m ?i))
            (at end (not (sat_busy)))
            (at end (sat_free))
            )
    )
  
    (:durative-action analyse_image
        :parameters (?i - image ?m - memory)
        :duration (= ?duration {int(DA)})
        :condition (and 
            (at start (sat_free))
            (at start (memory_taken ?m ?i))
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at end (image_analysed ?m ?i))
            (at end (not (sat_busy)))
            (at end (sat_free))
            )
    )
    
    (:durative-action dump_image
        :parameters (?i - image ?m - memory)
        :duration (= ?duration {int(DD)})
        :condition (and
            (at start (sat_free))
            (at start (image_analysed ?m ?i))
            (at start (dump_available))
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at start (not (memory_taken ?m ?i)))
            (at end (memory_free ?m))
            (at end (not (image_analysed ?m ?i)))
            (at end (image_dumped ?i))
            (at end (not (sat_busy)))
            (at end (sat_free))
            (at end (increase (image_score ?i) 1))
            )
    )
)""")
        f.close()

if __name__ == '__main__':
    import numpy
    sim = SatelliteSim()
    obs = sim.reset()
    #          img0  img1  img2  img3 ... imgn
    # goals = [n_0,  n_1,  n_2,  n3, ...  n_n]
    #
    goals = list(numpy.random.randint(3, size=4))  #[1,3,2,0]
    print(goals)
    writePDDLDomain(sim,'ArbiterVoices/Planner_utlis/Domain.pddl')
    writePDDLProblem(obs,'ArbiterVoices/Planner_utlis/problem.pddl', goals)

    generatePlan("ArbiterVoices/Planner_utlis/",
                "Domain.pddl", 
                "problem.pddl", 
                "plan.pddl")
    print(readPDDLPlan("ArbiterVoices/Planner_utlis/plan.pddl"))
    print("done")
