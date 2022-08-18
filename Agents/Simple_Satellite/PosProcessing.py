import numpy as np
import os, yaml
date_dir = "2022-08-18_19-07-47"
dir = "./Logs/Simulation/"+date_dir
# res_dict = read_Results(dir)

def get_info(inp_dict):
    for k, v in inp_dict.items():
        Total_goals = v['MP']['Total Initial Goals']
        Achieved_goals = v['MP']['Total Goals Achieved']
    return [Total_goals, Achieved_goals]

# Main Multiprocessing
from multiprocessing import Pool, Lock
if __name__ == "__main__":
    # Create log directory
    log_dir = "./Logs/Simulation/"+date_dir
    with open(f"{log_dir}/Results.yaml", "r") as f:
        docs = yaml.load_all(f, Loader=yaml.FullLoader)
        inp_lst = [] 
        for doc in docs:
            inp_lst.append(doc)
    
    print("Run pool")
    # Create Pool of Processes
    pool = Pool(processes=5)
    # Run Simulation
    print("Run map")
    results = pool.map(get_info, inp_lst)
    init_g = np.array(results)[:,0]
    achi_g = np.array(results)[:,1]

    import matplotlib.pyplot as plt
    plt.plot(init_g, achi_g)
