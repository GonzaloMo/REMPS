from logging import raiseExceptions


class Action(object):
    def __init__(self, action, voice) -> None:
        self.Value = 0
        self.action = action
        self.voice = voice
        self.action_tuple = (action, None)
    
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