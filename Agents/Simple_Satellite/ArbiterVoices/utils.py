class Action(object):
    def __init__(self, Value, action) -> None:
        self.Value = Value
        self.action = action

    def set_action(self, action):
        self.action = action
    
    def set_value(self, Value):
        self.Value = Value