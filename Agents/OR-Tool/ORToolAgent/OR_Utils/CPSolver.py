# ------------------Copyright (C) 2022 University of Strathclyde and Author ---------------------------------
# --------------------------------- Author: Cheyenne Powell -------------------------------------------------
# ------------------------- e-mail: cheyenne.powell@strath.ac.uk --------------------------------------------


# This function calls the OR-Tools solver and stores the values of actions determined into a file
# ===========================================================================================================

from __future__ import print_function
import numpy as np
import pandas as pd
import os
from ortools.sat.python import cp_model


def CP_solver(horizon, log_dir, shifts, image_mem, downlink_data_rate, 
              process_im_mem, target_data, gnd_data, model,
              summary, time_interval):
    filename1 = log_dir + '/Solver/Optimized_results.txt'
    all_actions = range(0, 3)

    solver = cp_model.CpSolver()

    #solver.parameters.max_time_in_seconds = 5000
    solver.parameters.log_search_progress = True
    solver.parameters.num_search_workers = 6

    status = solver.Solve(model)
    print(status)

    final_list = []
    final_list1 = ['gnd_station', 'target', 'action', 'n', 'memory_total' , 'pics_taken' , 'pics_count', 'processed_images', 'processed_pics_count',
         'processed images', 'downloaded_instances', 'downlinked_instance_images', 'downlink_count', 'downlinked images',
         'idle_time', 'Action_executed']

    downlink_count = 0
    icount = 0

    # use extracted last data for the next row in this function 'b' and 'c' are used to separate the data into "chunks"\

    for n in range(0, horizon):
        if n == horizon - 1:
            time_interval = time_interval - 1
        check_single_action = 0
        for a in all_actions:
            memory_total = solver.Value(summary[n][2])
            pics_taken = solver.Value(summary[n][0]) / 100
            processed_images = solver.Value(summary[n][1]) / 100
            # print(a, n, b, s)
            # print('shifts', solver.Value(shifts[(a, s)]))
            if solver.Value(shifts[(a, n)]) == 1:
                check_single_action = check_single_action + 1
                if a == 2:
                    downloaded_instances += 1
                if a == 2 and icount <= 1000:
                    downlink_count += 1
                elif icount > 1000:
                    downlink_count = 0
                    icount = 0
                if a == 0:
                    pics_count += 1
                if a == 1:
                    processed_pics_count += 1

                if any(e[3] == n for e in final_list):
                    z = ([e[3] == n for e in final_list])
                    d = [i for i in range(len(z)) if z[i] == True]
                    # print(d)
                    for index in sorted(d, reverse=True):
                        del final_list[index]

                    # print('pop')
                    if idle_time > 0:
                        idle_time -= 1

                    final_list.append(
                        [target_data[n], gnd_data[n], a, n,
                         memory_total, pics_taken, pics_count, processed_images, processed_pics_count,
                         processed_pics_count / (image_mem / process_im_mem),
                         downloaded_instances, downloaded_instances / (image_mem / downlink_data_rate), downlink_count,
                         downlink_count / (image_mem / downlink_data_rate),
                         idle_time, 'YES'])
                else:
                    # print('Action', a, 'works shift', n, 'time start', country_data_list[n][0],
                     #     'YES')
                    final_list.append(
                        [target_data[n], gnd_data[n], a, n,
                         memory_total, pics_taken, pics_count, processed_images, processed_pics_count,
                         processed_pics_count / (image_mem / process_im_mem),
                         downloaded_instances, downloaded_instances / (image_mem / downlink_data_rate), downlink_count,
                         downlink_count / (image_mem / downlink_data_rate),
                         idle_time, 'YES'])

            elif any(e[3] == n for e in final_list):
                k = 'Do nothing,jump to next'

            else:
                # print('Action', a, 'works shift', n, 'NO')
                idle_time += 1
                final_list.append(
                    [target_data[n], gnd_data[n], a, n, memory_total,
                     pics_taken, pics_count, processed_images, processed_pics_count,
                     processed_pics_count / (image_mem / process_im_mem),
                     downloaded_instances, downloaded_instances / (image_mem / downlink_data_rate), downlink_count,
                     downlink_count / (image_mem / downlink_data_rate),
                     idle_time, 'NO'])

        if check_single_action > 1:
            print('ERROR: more than one action per time step')

    final_list = sorted(final_list, key=lambda x: x[3])
    final_list_change_action = []
    for i in range(0, len(final_list)):
        # taking of images
        if final_list[i][2] == 0 and final_list[i][15] == 'YES':
            a = 1
        # process
        elif final_list[i][2] == 1 and final_list[i][15] == 'YES':
            a = 2
        # downlink
        elif final_list[i][2] == 2 and final_list[i][15] == 'YES':
            a = 3
        else:
            # idle
            a = 0
        final_list_change_action.append([final_list[i][0], final_list[i][1], a, final_list[i][3], final_list[i][4],
                                        final_list[i][5], final_list[i][6], final_list[i][7], final_list[i][8],
                                        final_list[i][9], final_list[i][10], final_list[i][11], final_list[i][12],
                                        final_list[i][13], final_list[i][14], final_list[i][15]])

    final_list_change_action.insert(0, final_list1)
    np.set_printoptions(threshold=np.inf)
    final_list = np.array(final_list_change_action)

    with open(filename1, "a+") as file:
        # Move read cursor to the start of file.
        file.seek(0)
        # If file is not empty then append '\n'
        data = file.read(100)
        if len(data) > 0:
            file.write("\n")
        df = pd.DataFrame(final_list)
        file.writelines(df.to_string(header=False, index=False))

    return c
