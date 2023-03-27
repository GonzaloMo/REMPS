# ------------------Copyright (C) 2022 University of Strathclyde and Author ---------------------------------
# ---------------------- Author: Cheyenne Powell, Gonzalo Montesino -----------------------------------------
# ------------------------- e-mail: cheyenne.powell@strath.ac.uk --------------------------------------------

# This file is used to run all the codes for all the days entered. This will automatically run until the end\
# last day has ended. This will also plot all graphs required for each respective day, once a folder has been\
# created.
# ===========================================================================================================

import os
from typing import List, Dict, Tuple, Any, Optional


class ORAgent_Base:
    def __init__(self,
        env,
    ):
        self.env = env
        self.plan = []
        ## OR tools initiation


    def observationHandler(self, obs):
        return obs
    
    def getAction(self, obs):
        return 0
    
    def computePlan(self, obs):
        pass

    def close(self):
        pass