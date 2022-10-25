# ---------------------------------------------------------------------------------------------------------------------------------------------------
# The script generates the plan for the optic.
# Inputs:
#   1 - The name of the file with the plan. 
#   2 - Upper time limit for the plan. [sec]
#   3 - Upper memory limit for the plan. [kB]
#   4 - The path to the domain file.
#   5 - The path to the problem file. 
#   6 - The path to the plan file.
# Effects:
#   1 - Aplan file is created at the path specified in the 6th argument.
# ---------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

cd %s

# Set upper limit on time (-t[sec]) and memory usage (-v[kB]) for the plan.
ulimit -t %s 
ulimit -v %s

# Run Optic planner
chmod 755 optic-cplex
./optic-cplex %s %s > %s

cd ..