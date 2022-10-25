"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle
"""
from typing import List, Dict, Tuple, Any
import numpy as np
def ObservtionToState(observation: Dict[str, Any], n_orbits: int=5) -> List:
    """
    Converts the simple sattelite observation to a state that can be used by the agent.
    
    Args:
        observation (Dict[str, Any]): The observation from the environment.
        n_orbits (int, optional): The number of orbits to plan for. Defaults to 5.
    
    Returns:
        List[np.ndarray]: The state that can be used by the agent.
    """

    # Get target binary coverage vector
    target_loc = observation['Targets']
    GS_loc = observation['Ground Stations']
    target_coverage = []
    GS_coverage = []
    for j in range(0, 360): # angular positio of orbit
        vis_t = 0
        for init_loc_t, end_loc_t in target_loc:
            if init_loc_t <= j <= end_loc_t:
                vis_t = 1
                break
        vis_gs = 0
        for init_loc_gs, end_loc_gs in GS_loc:
            if init_loc_gs <= j <= end_loc_gs:
                vis_gs = 1
                break
        
        target_coverage.append(vis_t)
        GS_coverage.append(vis_gs)
    target_coverage = target_coverage*n_orbits
    GS_coverage = GS_coverage*n_orbits
    state = [target_coverage, GS_coverage]
    return state