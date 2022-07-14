class Action(object):
    def __init__(self, Value, action, voice) -> None:
        self.Value = Value
        self.action = action
        self.voice = voice

    def set_action(self, action):
        self.action = action
    
    def set_value(self, Value):
        self.Value = Value