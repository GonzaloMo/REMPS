from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from PDDLPlanner.Environment_Specific.SimpleSatellite_setgoals_v0.Action import Action
from typing import List, Tuple, Dict, Any
import subprocess
import math
import numpy as np
import gym

def generatePlan(sh_file: str, domain: str, problem: str, plan: str, time_limit: int=10, memory_limit: int=1000000) -> None:
    with open(sh_file, 'rb') as file:
        script = file.read()
    loc = "/".join(sh_file.split('/')[:-1])
    domain = domain.encode('UTF-8')
    problem = problem.encode('UTF-8')
    plan = plan.encode('UTF-8')
    loc = loc.encode('UTF-8')
    time_limit = str(time_limit).encode('UTF-8')
    memory_limit = str(memory_limit).encode('UTF-8')
    script = script % (time_limit, memory_limit, loc, loc, domain, problem, plan,)
    exit_code = subprocess.call(script, shell=True)
    with open(plan, 'a') as file:
        script = file.write('\nEND')
    if exit_code:
        return False
    else:
        return True

def writePDDLProblem(obs: dict, file: str, orbits=5) -> None:
    header = "(define(problem satprob)\n"
    header +="(:domain SimpleSatelliteSetGoals)\n"
    # Define Objects
    objects = "(:objects\n "
    for index in range(len(obs['Analysis'])):
        objects += f" img{index+1}"
    objects += " - image\n"
    objects+= ")\n"

    # Define initial conditions
    initC = "(:init\n"
    if obs["Busy"] == 1:
        initC +="  (sat_busy)\n"
    else:
        initC +="  (sat_free)\n"
    initC +="  (= (total_score) 0)\n\n"
    for img in range(len(obs['Analysis'])):
        n_analyzed = obs['Analysis'][img]
        n_taken = obs['Images'][img] 
        n_unanalyzed = n_taken - n_analyzed
        initC += f"  (= (image_analysed img{img+1}) {n_analyzed})\n"
        initC += f"  (= (image_Unanalysed img{img+1}) {n_unanalyzed})\n"
        initC += f"  (= (image_score img{img+1}) 0)\n\n"
    memlevel = math.floor(obs["Memory Level"]*1000)/1000
    initC += f"  (= (memory_level) {memlevel})\n\n"
    tg = ''
    gs = ''
    #* Done in the Satellite reference frame
    for o in range(0, orbits):
        for index in range(0, len(obs['Targets']), 2):
            #* Change to satelite reference frame ( + 360*orbit - satellite_position)
            img = int(index/2)
            start = obs['Targets'][index] + 360 * o - obs['Pos'][0]
            end = obs['Targets'][index+1] + 360 * o - obs['Pos'][0]
            # Set start
            if start < 0:
                if end > 0:
                    tg += "  (at " + str(0) + " (image_available img" + str(img+1) + "))\n"
            else:
                tg += "  (at " + str(int(start)+1) + " (image_available img" + str(img+1) + "))\n"
            # Set end
            if end > 0:
                    tg += "  (at " + str(int(end)-1) + " (not (image_available img" + str(img+1) + ")))\n"  

        for index in range(0, len(obs['Ground Stations']), 2):
            #* Change to satelite reference frame ( + 360*orbit - satellite_position)
            start = obs['Ground Stations'][index] + 360 * o - obs['Pos'][0] + 5
            end = obs['Ground Stations'][index+1] + 360 * o - obs['Pos'][0] + 5
            # Set start
            if start < 0:
                if end > 0:
                    gs += "  (at " + str(1) + " (dump_available))\n"
            else:
                gs += "  (at " + str(round(start, 3)+1) + " (dump_available))\n"
            # Set end
            if end > 0:
                   gs += "  (at " + str(round(end, 3)-1) + " (not (dump_available)))\n"
            
    initC += tg
    initC += gs
    initC +="\n"
    initC +=")\n"
    # Define Goals
    Goals = "(:goal (and\n"
    goals = obs["Goals"]
    metrics = "(:metric maximize (+\n"
    tot_goals = len(goals)
    for img, n_img in enumerate(goals):
        Goals += f"  (> (image_score img{img+1}) 0)\n"
        Goals += f"  (<= (image_score img{img+1}) {n_img})\n"
        space_infront = "  "*(img+1)
        if img == 0:
            metrics += f"{space_infront}(image_score img{img+1})\n"
        elif img == tot_goals-1:
            metrics += f"{space_infront}(image_score img{img+1})\n"
        else:
            metrics += f"{space_infront}(+ (image_score img{img+1})\n"
    metrics+="  "*(tot_goals - img) + ")\n"
    num_of_minimum_images = min(np.sum(goals)*0.2, 8)
    Goals += f"  (>= (total_score) {num_of_minimum_images}))\n"
    Goals += "))\n"
    
    # Join full problem
    problem = header + objects + initC + Goals + metrics + ")\n"
    with open(file, "w") as f:
        f.write(problem)
        f.close()


def readPDDLPlan(file: str, env: gym.Env, executionMargin: Dict[str, Any]=None) -> List[Action]:
    plan = []
    with open(file, "r") as f:
        line = f.readline().strip()
        start_reading = False
        end = True
        while end:
            if start_reading and line:
                tokens = line.split()
                if "." in tokens[0]:
                    #* Change from satelite reference frame to general (+ satellite_position)
                    precondition = {"Pos": float(tokens[0][:-1])}
                    if executionMargin is not None:
                        precondition["Margin"] = executionMargin["Pos"]
                    action_name = f"{tokens[1][1:]} {tokens[2][:-1]}"
                    action = Action(env, action_name, preconditions=precondition)
                    plan.append(action)
            if 'Time' in line:
                start_reading = True
            line = f.readline().strip()
            if 'END' in line:
                end = False
    return plan

def writePDDLDomain(env: gym.Env, file: str, Conservative_add:float=2):
    print("Writing PDDL Domain")
    # duration of action are set in relation to space not time done by 
    # DA = V*da where 
    # - V is the velocity of the satellite in degrees/seconds
    # - da = duration of the action in seconds
    # - DA = Duration of the action in degrees
    sim = env.SatSim
    MM = math.ceil(1/sim.MEMORY_SIZE*1000)/1000
    # MM = sim.MEMORY_SIZE
    DI = math.ceil((sim.DURATION_TAKE_IMAGE+Conservative_add)*sim.velocity)
    DA = math.ceil((sim.DURATION_ANALYSE+Conservative_add)*sim.velocity)
    DD = math.ceil((sim.DURATION_DUMP+Conservative_add)*sim.velocity)
    with open(file, "w") as f:
        f.write(
        f"""(define (domain SimpleSatelliteSetGoals)

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
    )

    (:predicates
        (image_available ?i  - image)
        (dump_available)
        
        (sat_busy)
        (sat_free)
    )

    (:functions
        (image_Unanalysed ?i - image)
        (image_analysed ?i - image)
        (image_score ?i - image)
        (memory_level)
        (total_score)
    )

    (:durative-action take_picture
        :parameters (?i - image)
        :duration (= ?duration {DI})
        :condition (and 
            (at start (sat_free))
            (at start (image_available ?i))
            (at start (< (memory_level) 1.0)) 
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at end (not (sat_busy)))
            (at end (sat_free))
            (at end (increase (image_Unanalysed ?i) 1))
            (at end (increase (memory_level) {MM}))
            )
    )
  
    (:durative-action analyze
        :parameters (?i - image)
        :duration (= ?duration {DA})
        :condition (and 
            (at start (sat_free))
            (at start (> (image_Unanalysed ?i) 0)) 
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at end (increase (image_Unanalysed ?i) -1))
            (at end (increase (image_analysed ?i) 1))
            (at end (not (sat_busy)))
            (at end (sat_free))
            )
    )
    
    (:durative-action dump
        :parameters (?i - image)
        :duration (= ?duration {DD})
        :condition (and
            (at start (sat_free))
            (at start (> (image_analysed ?i) 0)) 
            (at start (dump_available))
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at end (increase (memory_level) -{MM}))
            (at end (increase (image_analysed ?i) -1))
            (at end (increase (image_score ?i) 1))
            (at end (increase (total_score) 1))
            (at end (not (sat_busy)))
            (at end (sat_free))
            
            )
    )
)""")
        f.close()
    print("Domain written")
