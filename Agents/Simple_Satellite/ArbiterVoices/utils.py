from logging import raiseExceptions
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from pyrsistent import s
import numpy as np

class Action(object):
    DURATIONS = [0, SatelliteSim.DURATION_TAKE_IMAGE, SatelliteSim.DURATION_ANALYSE, SatelliteSim.DURATION_DUMP]
    def __init__(self, action, voice, Pos, Velocity=0.6) -> None:
        self.Value = 0
        self.action = action
        self.voice = voice
        self.Pos = Pos
        self.end_pos = Pos + self.DURATIONS[action]*Velocity
        self.action_tuple = (action, None)
        self.img = None
    
    def __eq__(self, __o: object) -> bool:
        ac1, img1 = self.action_tuple
        ac2, img2 = __o.action_tuple
        if ac1==ac2 and img1==img2:
            return True
        else:
            return False
    def __str__(self) -> str:
        if self.action == 0:
            action_name = "DoNothing"
        elif self.action == 1:
            action_name = "Take image"
        elif self.action == 2:
            action_name = "Analyse"
        elif self.action == 3:
            action_name = "Dump"
        else:
            raiseExceptions(f"NotValid Action {self.action}")

        return f"{action_name} img{str(self.action_tuple[1])}"

    def set_action(self, action):
        self.action = action
    
    def set_value(self, Value):
        self.Value = Value
    
    def set_action_tuple(self, action, img):
        self.action_tuple = (action, img)
    
    def get_action_from_tuple(self, n_targets):
        ac, img = self.action_tuple
        if ac == 0:
            return ac
        else:
            return int((ac-1)*n_targets + img)

def read_seed(seed_file, date_time):
    with open(seed_file, "r") as f:
        Seeding_dict = {}
        date = f"{date_time}"
        while True:
            line = f.readline().strip()
            if "Simulation" in line and date in line:
                print(f"Loading simulation {line}")
                while True:
                    line = f.readline().strip()
                    if ":" in line:
                        tokens = line.split()
                        Seeding_dict[tokens[0][:-1]] = int(tokens[1])
                    if "END" in line:
                        break
                return Seeding_dict
            if line == None:
                raiseExceptions(f"Seed file {seed_file} does not contain simulation {date}")

def merge_goals(Arbiter):
    goals = []
    for i in range(Arbiter.n_targets):
        max_goal = 0
        for voice in Arbiter.Voices:
            voice_goal = voice.Goal_ref.Initial_goals[i]
            if max_goal < voice_goal:
                max_goal = voice_goal
        goals.append(max_goal)
    return np.array(goals)

def alpha_function(n_targets):
    return np.array([i for i in range(n_targets)])
                
            
    