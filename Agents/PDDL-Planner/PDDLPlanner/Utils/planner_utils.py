import subprocess

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

