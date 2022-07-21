from ifaddr import IP
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import subprocess
import math
import numpy as np

def generatePlan(loc: str, domain: str, problem: str, plan: str, time_limit: int=10, memory_limit: int=1000000):
    with open(loc+'generateplan_optic.sh', 'rb') as file:
        script = file.read()
    domain = domain.encode('UTF-8')
    problem = problem.encode('UTF-8')
    plan = plan.encode('UTF-8')
    loc = loc.encode('UTF-8')
    time_limit = str(time_limit).encode('UTF-8')
    memory_limit = str(memory_limit).encode('UTF-8')
    script = script % (loc, time_limit, memory_limit, domain, problem, plan,)
    exit_code = subprocess.call(script, shell=True)
    with open(loc+plan, 'a') as file:
        script = file.write('\nEND')
    if exit_code:
        return False
    else:
        return True

# def generatePlan(loc: str, domain: str, problem: str, plan: str, time_limit: int=100, memory_limit: int=1000000):
#     with open(loc+'generateplan.sh', 'rb') as file:
#         script = file.read()
#     domain = domain.encode('UTF-8')
#     problem = problem.encode('UTF-8')
#     plan = plan.encode('UTF-8')
#     loc = loc.encode('UTF-8')
#     print(loc, domain, problem, plan)
#     script = script % (loc, domain, problem, plan,)
#     exit_code = subprocess.call(script, shell=True)
#     with open(loc+plan, 'a') as file:
#         script = file.write('\nEND')
#     if exit_code:
#         return False
#     else:
#         return True

def writePDDLProblem(obs: dict, file: str, goals, orbits=5):
    header = "(define(problem satprob)\n"
    header +="(:domain SimpleSatellite)\n"
    # Define Objects
    objects = "(:objects\n "
    
    img = ''
    imgS = ''
    memfree = '' # used in initial condition
    for index, target in enumerate(obs['Targets']):
        img += " img" + str(index+1)
        imgS += "  (= (image_score img"+str(index+1)+") 0)\n"
    img += " - image\n"
    
    # Define initial conditions
    initC = "(:init\n"
    initC +="  (sat_free)\n"
    initC +=imgS
    initC +="  (= (total_score) 0)\n\n"
    memtak = ''
    animg = ''
    mem = ''
    for memo, targ in enumerate(obs['Images']):
        mem += " mem" + str(memo)
        if targ == 0:
            memfree +="  (memory_free mem" + str(memo) + ")\n"
        else:
            memtak +="   (memory_taken mem" + str(int(memo)) + " img" + str(int(targ)) + ")\n"
            if obs['Analysis'][memo]:
                animg += "(image_analysed mem" + str(int(memo)) + " img" + str(int(targ)) + ")\n"
    initC +=memfree + "\n" + memtak + "\n" + animg + "\n"
    mem += " - memory\n"
    objects = "(:objects\n " + mem + img +")\n"
    tg = ''
    gs = ''
    #* Done in the Satellite reference frame
    for o in range(0, orbits):
        for index, target in enumerate(obs['Targets']):
            #* Change to satelite reference frame ( + 360*orbit - satellite_position)
            start = target[0] + 360 * o - obs['Pos'][0]
            end = target[1] + 360 * o - obs['Pos'][0]
            # Set start
            if start < 0:
                if end > 0:
                    tg += "  (at " + str(0) + " (image_available img" + str(index+1) + "))\n"
            else:
                tg += "  (at " + str(int(start)+1) + " (image_available img" + str(index+1) + "))\n"
            # Set end
            if end > 0:
                    tg += "  (at " + str(int(end)-1) + " (not (image_available img" + str(index+1) + ")))\n"  

        for index, target in enumerate(obs['Ground Stations']):
            #* Change to satelite reference frame ( + 360*orbit - satellite_position)
            start = target[0] + 360 * o - obs['Pos'][0]
            end = target[1] + 360 * o - obs['Pos'][0]
            # Set start
            if start < 0:
                if end > 0:
                    gs += "  (at " + str(0) + " (dump_available))\n"
            else:
                gs += "  (at " + str(round(start, 3)+1) + " (dump_available))\n"
            # Set end
            if end > 0:
                   gs += "  (at " + str(round(end, 3)-1) + " (not (dump_available)))\n"
            
            
    debug = False
    if debug:
        print("-----------------------------------------------------")
        print("Satellite Position: ", obs['Pos'][0])
        print("Orbit: ", obs['Orbit'])
        print("Targets: ", obs['Targets'])
        print("Ground Stations: ", obs['Ground Stations'])
        print(tg)
        print(gs)
        print("-----------------------------------------------------")
    initC += tg
    initC += gs
    initC +="\n"
    initC +=")\n"
    # Define Goals
    Goals = "(:goal (and\n"
    
    i = 0
    end_metrics = ""
    total_targets = len(np.where(goals>0)[0])
    if total_targets > 1:
        metrics = "(:metric maximize (+\n"
    else:
        metrics = "(:metric minimize (\n"
    for targ, n_img in enumerate(goals):
        space_infront = "  "*(i+1)
        if n_img>0:
            
            Goals += "  (> (image_score img"+str(targ+1)+") "+str(0)+")\n"
            Goals += "  (<= (image_score img"+str(targ+1)+") "+str(n_img)+")\n\n"
            metrics += space_infront 
            if i == 0:
                metrics += "(image_score img"+str(targ+1)+")\n"
            elif i == total_targets-1:
                metrics += "(image_score img"+str(targ+1)+")\n"
            else:
                metrics += "(+ (image_score img"+str(targ+1)+")\n"
            i+=1
            end_metrics += "  "*(total_targets - i) + ")\n"
    Goals += "))\n"
    metrics += end_metrics
    if total_targets == 1:
        metrics += ")\n"
    # metrics += ")\n"

    # Join full problem
    problem = header + objects + initC + Goals + metrics + ")\n"
    with open(file, "w") as f:
        f.write(problem)
        f.close()


def readPDDLPlan(file: str, obs: dict):
    actionMap = {"take_image": SatelliteSim.ACTION_TAKE_IMAGE, "dump_image": SatelliteSim.ACTION_DUMP, "analyse_image": SatelliteSim.ACTION_ANALYSE}
    plan = []
    unMod_plan = []
    with open(file, "r") as f:
        line = f.readline().strip()
        start_reading = False
        end = True
        sat_pos =  obs['Pos'][0] + 360 * obs['Orbit'][0]
        while end:
            if start_reading and line:
                tokens = line.split()
                if "." in tokens[0]:
                    #* Change from satelite reference frame to general (+ satellite_position)
                    
                    time = float(tokens[0][:-1]) 
                    action = tokens[1][1:]
                    image = tokens[2]
                    memory = tokens[3][:-1]
                    plan.append((float(time), actionMap[action], int(image[3:]), int(memory[3:])))
                    unMod_plan.append((float(time), actionMap[action], int(image[3:]), int(memory[3:])))
            if 'Time' in line:
                start_reading = True
            line = f.readline().strip()
            if 'END' in line:
                end = False
        # print("-----------------------------")
        # print("Unmodified Plan: ", unMod_plan)
        # print("Plan: ", plan)
        # print("Targets: ", obs['Targets'])
        # print("Ground Stations: ", obs['Ground Stations'])
        # print("-----------------------------")
    return plan

def writePDDLDomain(sim: SatelliteSim, file: str, Conservative_add:float=2):
    # duration of action are set in relation to space not time done by 
    # DA = V*da where 
    # - V is the velocity of the satellite in degrees/seconds
    # - da = duration of the action in seconds
    # - DA = Duration of the action in degrees
    DA = math.ceil(sim.DURATION_ANALYSE*sim.velocity+Conservative_add)
    DD = math.ceil(sim.DURATION_DUMP*sim.velocity+Conservative_add)
    DI = math.ceil(sim.DURATION_TAKE_IMAGE*sim.velocity+Conservative_add)
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
