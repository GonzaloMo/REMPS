# ------------------Copyright (C) 2022 University of Strathclyde and Author ---------------------------------
# --------------------------------- Author: Cheyenne Powell -------------------------------------------------
# ------------------------- e-mail: cheyenne.powell@strath.ac.uk --------------------------------------------

# This file is used to run all the codes for all the days entered. This will automatically run until the end\
# last day has ended. This will also plot all graphs required for each respective day, once a folder has been\
# created.
# ===========================================================================================================

import os
from CPModel_with_Hint import CPModel_data
from CPSolver import CP_solver
from Load_files import load_file


reps = 2
n = 1
filename1 = '../Logs/Test_1/GS.txt'
filename2 = '../Logs/Test_1/Target.txt'
while n in range(1, reps):

    # Manual Schedule generation function
    day = n
    time_interval = 1
    # memory required per image
    image_mem = 12 * time_interval
    downlink_data_rate = 12 * time_interval
    # 5000Kbit/s to process images
    # hardware limitations of satellites
    onboard_mem = int(15 * image_mem)
    process_im_mem = image_mem/30
    Max_pictures = int(onboard_mem / image_mem)
    mem_data_list = []
    filename = '../Logs/Test_1/Results/Test_Results '


    # create a new folder 'Day #' and sub folders if the folder doesnt exist
    if os.path.isdir(filename + str(day)):
        print('true')
        print('File ' + filename + str(day) + ' exists')
        if os.path.isdir(filename + str(day) + '/graphs'):
            print('File ' + filename + str(day) + 'graphs exists')
        else:
            os.makedirs(filename + str(day) + '/graphs')

        if os.path.isdir(filename + str(day) + '/Solver'):
            print('File ' + filename + str(day) + 'Solver exists')
        else:
            os.makedirs(filename + str(day) + '/Solver')

    else:
        os.makedirs(filename + str(day))
        os.makedirs(filename + str(day) + '/graphs')
        os.makedirs(filename + str(day) + '/Solver')



    # data called
    gs_data, target_data = load_file(filename1, filename2)



    i = 0
    horizon = min(len(gs_data), len(target_data))
    interval = horizon
    while i in range(0, horizon):
        model, summary, shifts, b, c = CPModel_data(day, interval, onboard_mem, image_mem, downlink_data_rate, process_im_mem, filename, mem_data_list, target_data,
                                                    gs_data, horizon)

        c = CP_solver(b, c, day, shifts, image_mem, downlink_data_rate, process_im_mem, filename, target_data, gs_data, model, summary, time_interval, horizon)
        i = c
    n += 1