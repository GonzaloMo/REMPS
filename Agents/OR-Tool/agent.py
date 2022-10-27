# ------------------Copyright (C) 2022 University of Strathclyde and Author ---------------------------------
# ---------------------- Author: Cheyenne Powell, Gonzalo Montesino -----------------------------------------
# ------------------------- e-mail: cheyenne.powell@strath.ac.uk --------------------------------------------

# This file is used to run all the codes for all the days entered. This will automatically run until the end\
# last day has ended. This will also plot all graphs required for each respective day, once a folder has been\
# created.
# ===========================================================================================================

import os
from typing import List, Dict, Tuple, Any, Optional
from OR_Utils.CPModel_with_Hint import CPModel_data
from OR_Utils.CPSolver import CP_solver
from OR_Utils.Load_files import load_file


class OR_Agent:
    def __init__(self,
    log_dir: str="./Logs/Agent",
    timestep: float=1,
    action_list: List[str]=["Take_Picture", "Analyse", "Dump"],
    duration_of_action: List[int]= [12, 30, 12],
    Memory_perimage: int=12,
    Total_memory: int=15,
    ):
        self.log_dir = log_dir
        # Environment Data
        self.timestep = timestep
        # Action Parameters
        self.action_list = action_list
        self.duration_of_action = duration_of_action
        # Memory Parameters
        self.Memory_perimage = Memory_perimage
        self.Total_memory = Total_memory
        # Make Directories
        self.make_directories()
        self.Data_dict = load_file(self.log_dir, self.rep)
        self.run()


    def run_Optimizer(self, Coverage: Dict[str, List[int]] , Test_name: str="Test_1") -> None:
        i = 0
        gs_data = Coverage["Ground_Station"]
        target_data = Coverage["Target"]
        horizon = min(len(gs_data), len(target_data))
        interval = horizon
        log_dir = f"{self.log_dir}/Results/{Test_name}"
        while i in range(0, horizon):
            model, summary, shifts, b, c = CPModel_data(horizon, onboard_mem, image_mem, downlink_data_rate, process_im_mem, mem_data_list, target_data,
                                                        gs_data)

            c = CP_solver(c, log_dir, shifts, image_mem, downlink_data_rate, process_im_mem, filename, target_data, gs_data, model, summary, time_interval, horizon)
            i = c

    def make_directories(self, Test_name: str="Test_1") -> None:
        """
        Create a new folder for a every opti ization and sub folders if the folder doesnt exist
        """
        filename = f"{self.log_dir}/Results/{Test_name}"
        # create a new folder 'Day #' and sub folders if the folder doesnt exist
        if os.path.isdir(filename):
            if not os.path.isdir(f"{filename}/graphs"):
                os.makedirs(f"{filename}/graphs")
            if not os.path.isdir(f"{filename}/Solver"):
                os.makedirs(f"{filename}/Solver")
        else:
            os.makedirs(filename)
            os.makedirs(f"{filename}/graphs")
            os.makedirs(f"{filename}/Solver")
    
    def load_file(self, filename1: str, filename2: str) -> Dict[str, List[int]]:
        # data called
        gs_data, target_data = load_file(filename1, filename2)
        # data stored in a dictionary
        Coverage = {"Ground_Station": gs_data, "Target": target_data}
        return Coverage