from tkinter import E
from turtle import color
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

def get_voices(inp_dict):
    data = []
    for k, v in inp_dict.items():
        for voice, val in v.items():
            if not voice == "MP":
                Total_goals = val['Total Initial Goals']
                Remaining_goals = val['Total Goals Left']
                comp_percentage = (1 - Remaining_goals/Total_goals) * 100 
                data.append([comp_percentage])
                
    return data
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
    import matplotlib
    font = {'weight' : 'bold',
        'size'   : 26}

    matplotlib.rc('font', **font)
    import matplotlib.pyplot as plt
    
    

    # Scalability plots
    results = np.array(pool.map(get_info, inp_lst))
    init_g = np.array(results)[:,0]
    achi_g = np.array(results)[:,1]    
    plt.figure("Scalability")
    xmax = (round(max(init_g)+5)/10)*10
    ymax = (round(max(achi_g)+5)/10)*10
    limmax = max(xmax,ymax)
    plt.plot(init_g, achi_g, "o")
    
    plt.plot([0,limmax], [60,60], "--r") # Ideal world where all time is spent taking pictures analyzing or dumping
    plt.text(10, 60+2, "Max goals can be achieved", color="r", fontdict={'weight': 'normal', 'size'   : 14})
    plt.plot([0, limmax], [0,limmax], "r--")
    plt.text(0.25*limmax, 0.3*limmax, "Ideal Preformance", color="r", fontdict={'weight': 'normal', 'size'   : 14}, rotation=36)
    plt.xlim([0, limmax])
    plt.ylim([0, limmax])
    plt.ylabel("Total Goals achieved")
    plt.xlabel("Total Goals")
    plt.tight_layout()
    plt.savefig("./Logs/Plots/Scalabitlity.png", dpi=600)
    

    # Error bars
    results = np.array(pool.map(get_voices, inp_lst))
    mean_val = np.mean(results, axis=0).reshape((3,))
    std_val = np.std(results, axis=0).reshape((3,))
    x = [1,2,3]
    xerr = [0,0,0]
    plt.figure("ErrorBar")
    plt.errorbar(x, mean_val, std_val, xerr, "o--", ecolor="r", capsize=1)
    plt.xlim([0,4])
    plt.ylim([0,100])
    plt.ylabel("$\%$ goals achieved")
    plt.xticks([1,2,3],["$V_0$", "$V_1$", "$V_2$"])
    plt.tight_layout()
    dy=[]
    for y in results:
        y.reshape((3,))
        dy.append([y[1]-y[0],y[2]-y[1]])
    dy = np.array(dy)
    mean_dy = np.mean(dy, axis=0).reshape((2,))
    std_dy = np.std(dy, axis=0).reshape((2,))
    for i in range(2):
        y1 = [mean_val[i], mean_val[i]+mean_dy[i]+std_dy[i]]
        y2 = [mean_val[i], mean_val[i]+mean_dy[i]-std_dy[i]]
        plt.plot([i+1,i+2], y1, "r")
        plt.plot([i+1,i+2], y2, "r")
    plt.savefig("./Logs/Plots/ErrorBar.png", dpi=600)
    plt.show()