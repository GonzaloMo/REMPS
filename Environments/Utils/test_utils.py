import numpy as np
from time import sleep
def get_obs_str(obs, stp = 20):
    hline = "-" *10 + "\n"
    blank_space = " "
    obs_str = ""
    obs_str += hline
    for k, v in obs.items():
        key_str = k+":"
        if type(v) == np.ndarray or type(v) == list:
            if len(v)>stp:
                obs_str += f"{key_str: <20} {v[0:stp]}\n"
                for j in range(stp, len(v), stp):
                    up_lim = int(min(j+stp, len(v)))
                    obs_str += f"{blank_space: <20} {v[j:up_lim]}\n"
            else:
                obs_str += f"{key_str: <20} {v}\n"
        else:
            obs_str += f"{key_str: <20} {v}\n"
    obs_str += hline
    return obs_str

def print_obs(obs, console, other_info={}, **kwargs):
    obs_list = get_obs_str(obs, **kwargs).split("\n")
    if not other_info =={} and type(other_info) == dict: 
        obs_list += get_obs_str(other_info, **kwargs).split("\n")
    # for i, v in enumerate(obs_list):
    #     print(i, v)
    console.clear()
    try:
        for i, v in enumerate(obs_list):
            console.addstr(i , 0, v)
    except:
        print(obs)
        # print(obs_list)
        sleep(100)
    return console
    

def sinCos2degree(x, y):
    rad = np.arctan2(x, y)
    if rad < 0:
        rad += 2 * np.pi
    return rad * 180 / np.pi


def inputAction(actionDict):
    print("Actions:")
    for k, v in actionDict.items():
        print(f"{k}: {v}")
    action = input("Action: ")
    return action