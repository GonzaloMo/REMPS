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

def read_seed(seed_file, sim_num):
    import yaml
    with open(seed_file, "r") as f:
        docs = yaml.load_all(f, Loader=yaml.FullLoader)
        for doc in docs:
            for k,v in doc.items():
                if sim_num in k:
                    return v

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

def alpha_function(obs, arbiter):
    n_voices = len(arbiter.Voices)
    alpha_g = [0,0,0]
    for i, v in enumerate(arbiter.Voices):
        goals = np.sum(v.Goal_ref.goals)/np.sum(v.Goal_ref.Initial_goals)
        alpha_g[1][i] = goals
    alpha = np.argsort(alpha_g) + 1
    return alpha



                
            
    