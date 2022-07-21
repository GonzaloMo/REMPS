from logging import raiseExceptions
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from pyrsistent import s

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
        if ac < 2:
            return ac
        else:
            return int((ac-2)*n_targets + img + 1)

def read_seed(seed_file, date_time):
    with open(seed_file, "r") as f:
        Seeding_dict = {}
        date = f"{date_time}"
        while True:
            line = f.readline().strip()
            if "New Simulation" in line and date in line:
                print(f"Loading simulation {line}")
                while True:
                    line = f.readline().strip()
                    if ":" in line:
                        tokens = line.split()
                        Seeding_dict[tokens[0][:-1]] = int(tokens[1])
                    if "END" in line:
                        break
                return Seeding_dict
            if line == "":
                raiseExceptions(f"Seed file {seed_file} does not contain simulation {date}")
                
            
    