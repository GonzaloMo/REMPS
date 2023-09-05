import pandas as pd
import numpy as np

def preprocess(df: pd.DataFrame):
    df.action_list = df.action_list.apply(lambda x: x[2:-2].split("', '"))
    df.actions = df.actions.apply(lambda x: x[1:-1].split(",")).apply(lambda x: [int(i) for i in x])
    df["max_actions"] = df.action_list.apply(lambda x: len(x))
    df["action_global_names"] = df.actions.apply(lambda x: ["idle", "take_picture", "analyze", "dump"])
    
    action_count = []
    action_count_glob = []
    for epi in range(len(df)):
        n = df[df.episode == epi].max_actions
        print(n)
        action_global = df[df.episode == epi].action_global_names
        action_names = df[df.episode == epi].action_list
        action_array = np.zeros((n,))
        actions_global_count = np.zeros((len(action_global), ))
        actions = df[df.episode == epi].actions
        for action in actions:
            action_array[action] += 1
            for i in range(len(action_global)):
                if action_global[i] in action_names[action]:
                    actions_global_count[i] += 1
                    break
        action_count.append(action_array)
        action_count_glob.append(actions_global_count)
    df["action_count"] = action_count
    df["action_count_global"] = action_count_glob
    return df

from matplotlib import pyplot as plt
def plot_actions_count(df: pd.DataFrame, setup_c: str, reward_type:str, action_type: str, fig=None, ax=None, color=None):
    if fig is None:
        fig, ax = plt.subplots()
    
    df_spec = df[(setup_c == df.setup) & (reward_type == df.reward_type)]
    ac_mean_g = []
    max_epi = len(df_spec)
    if "global" in action_type:
        ax_name = df.iloc[0].action_global_names
    else:
        ax_name = df.iloc[0].action_list
    for action_count_global in df_spec[action_type]:
        if len(ac_mean_g) < 1 :
            ac_mean_g = np.array(action_count_global)/max_epi
        else:
            ac_mean_g += np.array(action_count_global)/max_epi
    label = f"{setup_c}-{reward_type}"
    x_axis = range(len(ax_name))
    ax.plot(x_axis, ac_mean_g, label=label, color=color)
    plt.xticks(x_axis, ax_name, rotation=90)
    return fig, ax
    
import matplotlib.patches as mpatches

def plot_violin(df, action_type, setup_c, reward_type, SimV: str="Sim_v1", fig=None, ax=None):
    df_spec = df[(setup_c == df.setup) & (reward_type == df.reward_type) & (SimV == df.Simulation_version)]
    if fig is None:
        fig, ax = plt.subplots()
    fst = True
    for actions in df_spec[action_type]:
        ac_arr = np.array([actions])
        if fst:
            action_data = ac_arr
            fst = False
        else:
            action_data = np.concatenate([action_data, ac_arr])
    if "global" in action_type:
        ax_name = df.iloc[0].action_global_names
    else:
        ax_name = df.iloc[0].action_list
    x_axis = range(0, len(ax_name))
    vp = ax.violinplot(action_data, positions=x_axis, showextrema=True)
    c = vp["bodies"][0].get_facecolor().flatten()
    c_line = vp["cmaxes"].get_edgecolor().flatten()
    fig, ax = plot_actions_count(df, setup_c, reward_type, action_type, fig=fig, ax=ax, color=c_line)
    plt.xticks(x_axis, ax_name, rotation=90)
    return fig, ax, mpatches.Patch(color=c)

# Print iterations progress
def printProgressBar (iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '█', printEnd = "\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print(f'\r{prefix} |{bar}| {iteration}/{total} {suffix}', end = printEnd)
    # Print New Line on Complete
    if iteration == total: 
        print()


def plotConfig(configDict, fig=None, ax=None, epsilon=0.1, fig_size=(20, 10), y_max=1., x_max=3600., x_min=0.):
    if fig is None:
        fig, ax = plt.subplots(1,1, figsize=fig_size)
    
    Repeat_deg = configDict["N_Repeat"]*360
    n_repeat = int(x_max//Repeat_deg)+1

    # Target Locations
    for tar_list in configDict["Targets"]:
        for j, tar in enumerate(tar_list):
            for i in range(n_repeat):
                x0, x1 = tar[0]+ i*Repeat_deg, tar[1]+ i*Repeat_deg

                ax.fill_betweenx([.0, .35*y_max], x0, x1, color=f"C3", alpha=0.2)
                if x_min < x0+1 < x_max:
                    ax.text(x0+epsilon, 0.17*y_max, f"T{j+1}", color=f"C3")
        
    # GS Locations
    for gs_list in configDict["Ground Stations"]:
        for i, gs in enumerate(gs_list):
            for i in range(n_repeat):
                x0, x1 = gs[0]+ i*Repeat_deg, gs[1]+ i*Repeat_deg

                ax.fill_betweenx([.35*y_max, .7*y_max], x0, x1, color=f"C2", alpha=0.2)
                if x_min < x0+1 < x_max:
                    ax.text(x0+epsilon, 0.5*y_max, f"GS", color=f"C2")

    # Light Shadow
    for i, light in enumerate(configDict["Light Range"]):
        for i in range(n_repeat):
            x0, x1 = light[0]+ i*Repeat_deg, light[1]+ i*Repeat_deg

            ax.fill_betweenx([0.7*y_max, 1*y_max], x0, x1, color=f"C1", alpha=0.2)
            if x_min < x0+1 < x_max:
                ax.text(x0+epsilon, 0.85*y_max, f"LIGHT", color=f"C1")

    # Orbit end Line
    for i in range(10):
        ax.axvline(i*Repeat_deg, color="k", alpha=0.3)
    
    return fig, ax
    

def plot_action_prob(res_df, Ac_df, action_list, epi, fig_size=(20, 10), fig=None, color=None):
    if fig is None:
        fig, ax = plt.subplots(figsize=fig_size)
    x = Ac_df.index
    
    # Colors
    if color is None:
        color = ["k", "C3", "C0", "C2"]
        

    # Target Locations
    for tar_list in res_df["Target_loc"][epi]:
        for i, tar in enumerate(tar_list):
            ax.fill_betweenx([.0, .35], tar[0], tar[1], color=f"C3", alpha=0.2)
            ax.text(tar[0]+epi, 0.17, f"T{i+1}", color=f"C3")
        
    # GS Locations
    for gs_list in res_df["Gs_loc"][epi]:
        for i, gs in enumerate(gs_list):
            ax.fill_betweenx([.35, .7], gs[0], gs[1], color=f"C2", alpha=0.2)
            ax.text(gs[0]+epi, 0.5, f"GS{i+1}", color=f"C2")

    # Light Shadow
    for i, light in enumerate(res_df["Light_shadow"][epi]):
        ax.fill_betweenx([0.7, 1], light[0], light[1], color=f"C1", alpha=0.2)
        ax.text(light[0]+epi, 0.85, f"L{i+1}", color=f"C1")
    
    # Orbit end Line
    for i in range(10):
        ax.axvline(i*360, color="k", alpha=0.3)

    # Action Prob
    for i in range(len(action_list)):
        ax.plot(x, Ac_df[action_list[i]], label=f'${action_list[i]}$', color=color[i])
    
    #  Clean up
    ax.xaxis.label.set_fontsize(20)
    ax.yaxis.label.set_fontsize(20)
    map(lambda p: p.set_fontsize(20), ax.get_xticklabels())
    map(lambda p: p.set_fontsize(20), ax.get_yticklabels())
    ax.set_xlabel("Position")
    ax.set_ylabel("Action Probability")
    ax.set_xlim(0, x.max())
    ax.set_ylim(0, 1)
    ax.legend(ncol=len(action_list)//2, bbox_to_anchor=(0.5, 1.15), loc='upper center', fontsize=20)
    return fig, ax