# ------------------Copyright (C) 2022 University of Strathclyde and Author ---------------------------------
# --------------------------------- Author: Cheyenne Powell -------------------------------------------------
# ------------------------- e-mail: cheyenne.powell@strath.ac.uk --------------------------------------------

# This file contains the or-tools model and hints a solution from the manual schedule created
# ===========================================================================================================

from __future__ import print_function
from ortools.sat.python import cp_model
import os


def CPModel_data(interval, onboard_mem, image_mem, down_link_data_rate, process_im_mem, mem_data_list,
                 target_data, gnd_data, horizon):

    memory_keep = []
    processed_keep = []
    photos_keep = []
    num_processed = 0
    num_pics = 0
    memory = 0
    # using idle time
    all_actions = range(0, 3)
    # without idle time implemented
    # all_actions = range(0, 3)


    hot_start = 0
    summary = []
    # at start b and c are the same
    c = horizon
    b = c
    # j is the remainder of division
    j = horizon % interval
    # check the division to determine loops (reps)
    # This is done for every 3000 data points, due to hardware limitations, accuracy of schedule can be improved\
    # with larger ranges
    if j > 0 and ((b + j) == horizon):

        c = b + j
    else:
        b = 0
        c = b + int(horizon / (horizon / interval))

    print(b, c)
    all_shifts = range(b, c)
    mod_shifts = range(0, c - b)

    model = cp_model.CpModel()

    # shifts[(a,s)] is used to determine the action with the respective shift, in this case 3 actions - take images '0'
    # , process '1' and down_link '2'
    shifts = {}
    for s in mod_shifts:

        for a in all_actions:
            shifts[(a, s)] = model.NewBoolVar('shift_a%is%i' % (a, s))

    # no more than 1 action can be executed per shift, also meaning no actions can be executed
    for s in mod_shifts:
        model.Add(sum(shifts[(a, s)] for a in all_actions) <= 1)
    target_data_count = 0
    gnd_data_count = 0
    n = 0
    while n in all_shifts:

        if n > 0:
            s = n - b
            if target_data[n - 1] == 1:
                target_data_count = target_data_count + 1
            else:
                target_data_count = 0

            if gnd_data[n - 1] == 1:
                gnd_data_count = gnd_data_count + 1
            else:
                gnd_data_count = 0
        else:
            s = 0
            if target_data[n] == 1:
                target_data_count = target_data_count + 1
            else:
                target_data_count = 0

            if gnd_data[n] == 1:
                gnd_data_count = gnd_data_count + 1
            else:
                gnd_data_count = 0

        model.Add((target_data_count == 12)).OnlyEnforceIf(shifts[(0, s)])
        model.Add(gnd_data_count == 12).OnlyEnforceIf(shifts[(2, s)])

        if target_data_count > 12:
            target_data_count = 0
        else:
            target_data_count = target_data_count

        if gnd_data_count > 12:
            gnd_data_count = 0
        else:
            gnd_data_count = gnd_data_count

        #print(target_data_count, gnd_data_count)
        n = n + 1

    for s in mod_shifts:

        if len(memory_keep) >= 1 and s == 0:
            num_pics = int(photos_keep[len(photos_keep) - 1])
            memory = memory_keep[len(memory_keep) - 1]
            num_processed = int(processed_keep[len(processed_keep) - 1])

            num_pics = num_pics + (shifts[(0, s)] * 100) - (
                    shifts[(2, s)] * (int(100 * down_link_data_rate / image_mem)))
            memory = memory + (image_mem * (shifts[(0, s)])) - (down_link_data_rate * (shifts[(2, s)]))
            num_processed = num_processed + (shifts[(1, s)] * 100) - (
                    shifts[(2, s)] * (int(100 * down_link_data_rate / process_im_mem)))
        else:
            num_pics += (shifts[(0, s)] * 100) - (shifts[(2, s)] * (int(100 * down_link_data_rate / image_mem)))
            memory += (image_mem * (shifts[(0, s)])) - (down_link_data_rate * (shifts[(2, s)]))
            num_processed += (shifts[(1, s)] * 100) - (shifts[(2, s)] * (int(100 * down_link_data_rate / process_im_mem)))

        model.Add(num_processed > (int(100 * down_link_data_rate / process_im_mem))).OnlyEnforceIf(
            shifts[(2, s)])

        model.Add(num_pics > 0).OnlyEnforceIf(shifts[(1, s)])

        total_to_process = (num_pics * int((image_mem / process_im_mem)))
        model.Add(num_processed <= total_to_process)
        model.Add(memory < onboard_mem)
        summary.append([num_pics, num_processed, memory])


    # function used
    model.Maximize(sum((shifts[(2, s)]) + shifts[(0, s)] + shifts[(1, s)] for s in mod_shifts))
    # manual schedule inputted here as a hint to the solution
    if hot_start == 1:

        for n in all_shifts:
            if n > 0:
                s = n - b
            else:
                s = 0

            if mem_data_list[n][2] == 0:
                model.AddHint(shifts[(0, s)], 1)
            if mem_data_list[n][2] == 1:
                model.AddHint(shifts[(1, s)], 1)
            if mem_data_list[n][2] == 2:
                model.AddHint(shifts[(2, s)], 1)

    return model, summary, shifts, b, c
