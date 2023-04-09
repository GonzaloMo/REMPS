import numpy as np
def get_obs_str(obs, stp = 4):
    hline = "-" *10 + "\n"
    blank_space = " "
    obs_str = ""
    obs_str += hline
    for k, v in obs.items():
        key_str = k+":"
        if type(v) == np.ndarray:
            vshape = v.shape
            if len(vshape)>1:
                obs_str += f"{key_str: <20} {v[0]}\n"
                for i in range(1, vshape[0]):
                    obs_str += f"{blank_space: <20} {v[i]}\n"
            else:
                obs_str += f"{key_str: <20} {v}\n"
        else:
            obs_str += f"{key_str: <20} {v}\n"
    obs_str += hline
    return obs_str

def print_obs(obs, console, other_info={}):
    obs_list = get_obs_str(obs).split("\n")
    if not other_info =={}: 
        obs_list += get_obs_str(other_info).split("\n")
    # for i, v in enumerate(obs_list):
    # print(i, v)
    console.clear()
    for i, v in enumerate(obs_list):
        console.addstr(i , 0, v)
    return console
    

def sinCos2degree(x, y):
    rad = np.arctan2(x, y)
    if rad < 0:
        rad += 2 * np.pi
    return rad * 180 / np.pi