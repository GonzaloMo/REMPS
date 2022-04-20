import numpy as np
import math

def Eval(env, state, valid_action):
        r = 0
        total_plan_length = len(env.full_plan)
        if valid_action:
            if env.check_if_in_plan_state(state):
                r = 1/(total_plan_length-2)
        return r

def Eval_2(env, state, valid_action):
        r = 0
        total_plan_length = len(env.full_plan)
        if valid_action:
            if env.check_if_in_plan_state(state):
                r += 1/total_plan_length
        else:
            r = -1
        return r

def type1(env, state, valid_action):
    r = 0
    if env.check_if_in_plan_state(state):
            r = 10 
    return r

def type2(env, state, valid_action):
    r = 0
    if env.check_if_in_plan_state(state):
        r = 10  # Gives positive reward if plan state is achieved
    else:
        r = -1 # Gives negative reward if not in plan state 
    return r


def type3(env, state, valid_action):
    r = 0
    state_pos = np.array(np.where(state==1))
    if env.check_if_in_plan_state(state):
        return 10  # Gives positive reward if plan state is achieved
    else:
        r = -1 * np.linalg.norm(state_pos-env.plan_states[0]) # Gives negative proportional to the distance to the first plan state
    return r

def type4(env, state, valid_action):
    r = -1 * math.inf
    state_pos = np.array(np.where(state==1))
    if env.check_if_in_plan_state(state):
        return 10  # Gives positive reward if plan state is achieved
    else:
        d_min = np.inf
        for plan_s in env.plan_states:
            d = np.linalg.norm(state_pos-plan_s)
            if d_min > d:
                d_min = d
        r = -1 * d_min # Gives negative proportional to the distance to the nearest state
    return r

def type5(env, state, valid_action):
        r = 0
        total_plan_length = len(env.full_plan)
        if valid_action:
            if env.check_if_in_plan_state(state):
                    r = 1/total_plan_length
            if r>0:
                r = -.1/total_plan_length
        else:
            r = -1
        return r

# Hard maximising plan state reward
def max_state_hard(env, state, valid_action):
    total_plan_length = len(env.full_plan_achievable)
    if env.done:
        return env.number_of_achieved_plan_states/total_plan_length
    else:
        return 0
    
def max_state_hard_2(env, state, valid_action):
    total_plan_length = len(env.full_plan)-2
    if env.done and valid_action:
        return env.number_of_achieved_plan_states/total_plan_length
    else:
        return 0
# Hard maximising plan state reward
def min_nonstate_hard(env, state, valid_action):
    if env.done:
        return (env.number_of_achieved_plan_states/env.num_steps)
    else:
        return 0

def min_nonstate_hard_2(env, state, valid_action):
    if env.done and valid_action:
        return (env.number_of_achieved_plan_states/env.num_steps)
    else:
        return 0

# Per timestep reward 
def min_nonstate_hard_stp(env, state, valid_action):
    r = -1 * math.inf
    state_pos = np.array(np.where(state==1))
    if env.check_if_in_plan_state(state):
        return 10  # Gives positive reward if plan state is achieved
    else:
        d_min = np.inf
        for plan_s in env.plan_states:
            d = np.linalg.norm(state_pos-plan_s)
            if d_min > d:
                d_min = d
        r = 1 / ((d_min +1)) # Gives positive reward inversally proportional to the distance to the nearest state
    return r


# non plan state percentage 
def Eval_n(env, state, valid_action):
    if env.done:
        return (len(env.plan_state_achieved)/env.num_steps) 
    else:
        return 0

# Planstate percentage
def Eval_p(env, state, valid_action):
    total_plan_length = len(env.full_plan_achievable)-2
    if env.done:
        return (len(env.plan_state_achieved)/total_plan_length)
    else:
        return 0
Reward_function = {'Eval': Eval, 'Eval_2': Eval_2, 'Eval_p': Eval_p, 'Eval_n': Eval_n, 'type1': type1, 
'type2': type2, 'type3': type3, 'type4': type4, 'type5': type5, 
'MSH':max_state_hard, 'MSH_2':max_state_hard_2,
'mnsh': min_nonstate_hard,  'mnsh_2': min_nonstate_hard_2, 'mnsh_stp': min_nonstate_hard_stp}