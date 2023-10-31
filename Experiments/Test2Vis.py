# %%
import pandas as pd
import random
import numpy as np
import os
from copy import deepcopy
from utils.Visualization import plot_action_prob, plotConfig
import matplotlib.pyplot as plt
import matplotlib
matplotlib.rcParams.update({'font.size': 24})

# %%
# foldername = "./Results/SimpleSatellite-setgoals-v4/"
foldername_init = "./Results/arbiter_test/EqualEta/"
foldername = foldername_init + "Overlapping/"
fig_size = (20,10)
agent_list = os.listdir(foldername)

agent_list_to_sort = []
for i, fol in enumerate(agent_list):
    val_list = fol.split("_")
    agent_list_to_sort.append(float(val_list[1])+float(val_list[3])) 
    
agent_list = [x for _, x in sorted(zip(agent_list_to_sort, agent_list))]
# %%
results_sumerize = {}
for folder_name in agent_list:
    
    filename = foldername + "/" + folder_name + "/"   + "/results.feather"
    keystr_list = folder_name.split("_")
    keystr = f"V{keystr_list[1]} \n{int(float(keystr_list[3])*100)}% \n" 
    try:
        results_df = pd.read_feather(filename)
        total_Goals_percentage = []
        total_orbits = []
        print(f"Results for {keystr} length: {len(results_df)}")
        for i, v in results_df.iterrows():
            final_goals = np.sum(np.stack(v["Goals"]), axis=1)[-1]
            init_goals = np.sum(np.stack(v["Goals"]), axis=1)[0]
            total_Goals_percentage.append(100 - 100*final_goals/init_goals)
            total_orbits.append(v["Orbit"][-1])
        
        
        # label = label[:3] + " " + label[3:]
        results_sumerize[keystr] = [total_Goals_percentage, total_orbits]
    except:
        print("No results for ", keystr)

# %%
import matplotlib.patches as mpatches
x_ticks = []
fig, ax = plt.subplots(1,1, figsize=fig_size)
i = 0
for k, v in results_sumerize.items():
   violin_parts = ax.violinplot(v[:][0], [i], showmeans=True, showmedians=True, showextrema=False)
   for pc in violin_parts['bodies']:
      pc.set_facecolor('blue')
      pc.set_edgecolor('black')
      pc.set_linewidth(1)
   
   for partname in ['cmeans', "cmedians"]:
      vp = violin_parts[partname]
      if partname == "cmeans":
         vp.set_edgecolor('red')
      else:
         vp.set_edgecolor('black')
      vp.set_linewidth(2)
   x_ticks.append(k)
   i += 1
ax.set_xticks([i for i in range(len(x_ticks))])
ax.set_xticklabels(x_ticks)
ax.set_ylabel("Percentage of Goals Achieved")
ax.grid()
fig.suptitle("Test 2")
ax.legend([mpatches.Patch(color='red'), mpatches.Patch(color='black')], ['Mean', 'Median'], loc='lower right')
fig.savefig(foldername_init + "Test2ViolinPlot_Goals.png", dpi=300)

# %%
import matplotlib.patches as mpatches
x_ticks = []
fig, ax = plt.subplots(1,1, figsize=fig_size)
i = 0
for k, v in results_sumerize.items():
   violin_parts = ax.violinplot(v[:][1], [i], showmeans=True,showextrema=False, showmedians=True)

   for pc in violin_parts['bodies']:
      pc.set_facecolor('blue')
      pc.set_edgecolor('black')
      pc.set_linewidth(1)
   
   for partname in ['cmeans', "cmedians"]:
      vp = violin_parts[partname]
      if partname == "cmeans":
         vp.set_edgecolor('red')
      else:
         vp.set_edgecolor('black')
      vp.set_linewidth(2)
      
   x_ticks.append(k)
   i += 1
ax.set_xticks([i for i in range(len(x_ticks))])
ax.set_xticklabels(x_ticks)
ax.grid()
ax.legend([mpatches.Patch(color='red'), mpatches.Patch(color='black')], ['Mean', 'Median'])
fig.savefig(foldername_init + "Test2ViolinPlot_Orbits.png", dpi=300)

# %%



