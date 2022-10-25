from tkinter import E
from turtle import color
import numpy as np
import os, yaml
date_dir = "2022-08-20_06-40-57"
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
                if Total_goals > 120 :
                    Total_goals = 120
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
    
    with open(f"{log_dir}/Results_MP.yaml", "r") as f:
        docs = yaml.load_all(f, Loader=yaml.FullLoader)
        inp_lst_mp = [] 
        for doc in docs:
            inp_lst_mp.append(doc)
    
    with open(f"{log_dir}/Results_VA.yaml", "r") as f:
        docs = yaml.load_all(f, Loader=yaml.FullLoader)
        inp_lst_va = [] 
        for doc in docs:
            inp_lst_va.append(doc)
    
    
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
    

    # import IPython; IPython.embed()
    con = input("Continue?")
    if "y" in con:
        from plot_utils import *
        plt.figure("Per_Scalability")
        results = np.array(pool.map(get_info, inp_lst))  
        results_mp = np.array(pool.map(get_info, inp_lst_mp))
        x_max, limmax = scalability_per_plot(results, color ='ob')
        scalability_per_plot(results_mp, color='or')
        id_l = []
        x_id_l = []
        for i in range(limmax):
            if i < 120:
                id_l.append(100)
            else:
                id_l.append((120/i) *100)
            x_id_l.append(i)
        plt.plot(x_id_l, id_l, "--r") # Ideal world where all time is spent taking pictures analyzing or dumping
        plt.xlim([0, limmax])
        plt.ylim([0, 110])
        plt.ylabel("% Goals achieved")
        plt.xlabel("Total Goals")
        plt.legend(["Arbiter", "Planner"], loc="upper right")
        plt.tight_layout()
        plt.savefig("./Logs/Plots/Per_Scalabitlity.png", dpi=600)

        plt.figure("Scalability")
        scalability_plot(results, color ='ob')
        scalability_plot(results_mp, color='or')

        plt.plot([0,120], [0,120], "--r") # Ideal world where all time is spent taking pictures analyzing or dumping
        # plt.text(145, 120+5, "Max goals can be achieved", color="r", fontdict={'weight': 'normal', 'size'   : 14})
        plt.plot([120, limmax], [120,120], "r--")
        # plt.text(0.2*limmax, 0.3*limmax, "Ideal Preformance", color="r", fontdict={'weight': 'normal', 'size'   : 14}, rotation=36)
        plt.xlim([0, limmax])
        plt.ylim([0, 140])
        plt.ylabel("Total Goals achieved")
        plt.xlabel("Total Goals")
        plt.legend(["Arbiter", "Planner"], loc="upper right")
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
            y1 = [mean_val[i], mean_val[i+1]+mean_dy[i]]
            y2 = [mean_val[i], mean_val[i+1]-mean_dy[i]]
            plt.plot([i+1,i+2], y1, "r")
            plt.plot([i+1,i+2], y2, "r")
        plt.savefig("./Logs/Plots/ErrorBar.png", dpi=600)

        # Error bars VA
        results_va = np.array(pool.map(get_voices, inp_lst_va))
        mean_val = np.mean(results_va, axis=0).reshape((3,))
        std_val = np.std(results_va, axis=0).reshape((3,))
        x = [1,2,3]
        xerr = [0,0,0]
        plt.figure("ErrorBar_VA")
        plt.errorbar(x, mean_val, std_val, xerr, "o--", ecolor="r", capsize=1)
        plt.xlim([0,4])
        plt.ylim([0,100])
        plt.ylabel("$\%$ goals achieved")
        plt.xticks([1,2,3],["$V_0$", "$V_1$", "$V_2$"])
        plt.tight_layout()
        dy=[]
        for y in results_va:
            y.reshape((3,))
            dy.append([y[1]-y[0],y[2]-y[1]])
        dy = np.array(dy)
        mean_dy = np.mean(dy, axis=0).reshape((2,))
        std_dy = np.std(dy, axis=0).reshape((2,))
        for i in range(2):
            y1 = [mean_val[i], mean_val[i+1]+ (mean_dy[i])] #  min(min(100,mean_val[i]+std_val[i+1]),
            y2 = [mean_val[i], mean_val[i+1]-(mean_dy[i])] # max(mean_val[i]-std_val[i+1],
            plt.plot([i+1,i+2], y1, "r")
            plt.plot([i+1,i+2], y2, "r")
        plt.savefig("./Logs/Plots/ErrorBar_VA.png", dpi=600)
        plt.show()

