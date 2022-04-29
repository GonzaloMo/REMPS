from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
import requests
import subprocess

def generatePlan(domain: str, problem: str, plan: str):
    with open('SimpleSatellite/envs/Planner/generateplan.sh', 'rb') as file:
        script = file.read()
    domain = domain.encode('UTF-8')
    problem = problem.encode('UTF-8')
    plan = plan.encode('UTF-8')
    script = script % (domain, problem, plan,)
    exit_code = subprocess.call(script, shell=True)
    if exit_code:
        return False
    else:
        return True


def writePDDLProblem(sim: SatelliteSim, file: str, orbits=5):
    with open(file, "w") as f:
        f.write("(define(problem satprob)\n") 
        f.write("(:domain SimpleSatellite)\n")
        f.write("(:objects\n ")
        for index in range(SatelliteSim.MEMORY_SIZE):
            f.write(" mem" + str(index))
        f.write(" - memory\n")
        for index, target in enumerate(sim.targets):
            f.write(" img" + str(index))
        f.write(" - image\n")
        f.write(")\n")
        f.write("(:init\n")
        f.write("  (sat_free)\n")
        f.write("  (= (total_score) 0)\n")
        f.write("\n")
        for index in range(SatelliteSim.MEMORY_SIZE):
            f.write("  (memory_free mem" + str(index) + ")\n")
        f.write("\n")
        for o in range(orbits):
            for index, target in enumerate(sim.targets):
                start = target[0] + sim.PERIOD * o
                end = target[1] + sim.PERIOD * o
                f.write("  (at " + str(round(start, 3)) + " (image_available img" + str(index) + "))\n")
                f.write("  (at " + str(round(end, 3)) + " (not (image_available img" + str(index) + ")))\n")
        f.write("\n")
        for o in range(orbits):
            for index, target in enumerate(sim.groundStations):
                start = target[0] + sim.PERIOD * o
                end = target[1] + sim.PERIOD * o
                f.write("  (at " + str(round(start, 3)) + " (dump_available))\n")
                f.write("  (at " + str(round(end, 3)) + " (not (dump_available)))\n")
        f.write(")\n")
        f.write("(:goal (and\n")
        for target in sim.goalRef.single_goals:
            f.write("  (image_dumped img" + str(target) + ")\n")
        f.write("  (image_dumped img" + str(1) + ")\n")
        f.write(")))\n")
        f.close()


def readPDDLPlan(file: str):
    actionMap = {"take_image": 0, "dump_image": 1, "analyse_image": 2}
    plan = []
    with open(file, "r") as f:
        line = f.readline().strip()
        while line:
            tokens = line.split()
            time = tokens[0][:-1]
            action = tokens[1][1:]
            image = tokens[2]
            memory = tokens[3][:-1]
            plan.append((float(time), actionMap[action], int(image[3:]), int(memory[3:])))

            line = f.readline().strip()
        f.close()
    return plan

def read_plan(self, filename):
    with open(filename, 'r') as f:
        check = True
        r_from = False
        plan = []
        while check:
            line = f.readline()
            if line:
                if r_from:
                    self.plan.append(line[8:-11].split())
                elif line[0:6] == '; Time':
                    r_from = True
            else:
                check = False
                if self.write_output:
                    print('finished')
            
if __name__ == '__main__':
    writePDDLProblem(SatelliteSim(),'SimpleSatellite/envs/Planner/problem.pddl')
    generatePlan("Domain.pddl", 
                "problem.pddl", 
                "plan.pddl")
    print("done")
