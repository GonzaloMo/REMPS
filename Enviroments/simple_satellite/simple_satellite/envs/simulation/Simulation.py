import math
from numpy import random
from simulation.GoalReferee import GoalReferee
class SatelliteSim:

    MAX_ORBITS = 30

    CIRCUNFERENCE = 360
    ACTION_THRESHOLD = 6

    MEMORY_SIZE = 10

    ACTION_TAKE_IMAGE = 0
    ACTION_DUMP = 1
    ACTION_ANALYSE = 2

    DURATION_TAKE_IMAGE = 2
    DURATION_DUMP = 19
    DURATION_ANALYSE = 49

    def __init__(self, period=600):

        self.sim_time = 0
        self.PERIOD = period
        self.dt = period/SatelliteSim.CIRCUNFERENCE
        self.velocity = SatelliteSim.CIRCUNFERENCE/period

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = None

        # planet position
        self.groundStations = []
        self.targets = []

        # memory state
        self.memory_level = 0
        self.images = [-1] * self.MEMORY_SIZE
        self.analysis = [False] * self.MEMORY_SIZE
        self.satellite_busy_time = 0
        self.busy=0

        # goals
        self.goalRef = GoalReferee()

    def update(self, action):
        done = False

        # update time variables
        self.sim_time += self.dt
        self.pos += self.velocity*self.dt

        # update orbit position
        if self.pos > SatelliteSim.CIRCUNFERENCE:
            self.pos -=  SatelliteSim.CIRCUNFERENCE
            self.orbit += 1

        if self.satellite_busy_time > 0:
            self.satellite_busy_time = self.satellite_busy_time - self.dt

        # Check if simulation ends
        if self.orbit>=SatelliteSim.MAX_ORBITS:
            done = True

        # update state
        if not action==3:
            self.apply_action(action)
            state = self.get_state()
            return state, done

    def apply_action(self, action):   

        # check if busy or the satellite does nothing 
        if self.satellite_busy_time > 0 or action==3 or action==None:
            self.busy=1
            return 
        
        # Take picture action
        if action == SatelliteSim.ACTION_TAKE_IMAGE:
            for index in range(len(self.targets)):
                ind_mem = self.memory_level
                if self.targets[index][0] < self.pos < self.targets[index][1] and self.memory_level<SatelliteSim.MEMORY_SIZE:
                    self.satellite_busy_time = SatelliteSim.DURATION_TAKE_IMAGE
                    self.images[ind_mem] = index
                    self.memory_level += 1
                    self.last_action = action
                    break
            return
        
        # Analyse picture
        if action == SatelliteSim.ACTION_ANALYSE:
            self.satellite_busy_time = SatelliteSim.DURATION_ANALYSE
            for index in range(len(self.analysis)):
                if not self.analysis[index]:
                    if random.random() > 0.0:
                        self.analysis[index] = True
                    else:
                        self.analysis[index] = False
                        self.images[index] = -1
                        self.memory_level -= 1
                    self.last_action = action
                    return
        
        # Dump picture
        if action == SatelliteSim.ACTION_DUMP:
            # check if it is above the ground station and if their is any analysed image
            picture_to_dump = None
            if any([gs[0]-SatelliteSim.ACTION_THRESHOLD < self.pos < gs[1]+SatelliteSim.ACTION_THRESHOLD for gs in self.groundStations]) and any(self.analysis) :
                self.satellite_busy_time = SatelliteSim.DURATION_DUMP
                # Check all the images except the last one
                for index in range(len(self.analysis)-1):
                    if not self.analysis[index+1] and self.analysis[index]:
                        picture_to_dump=index
                        break
                if self.analysis[-1] == True:
                    picture_to_dump = index+1
                # Look at the first and last picture false
                if picture_to_dump:
                    self.analysis[picture_to_dump] = False
                    self.images[picture_to_dump] = -1
                    self.memory_level -= 1
                    self.last_action = action
                    # score the goal value
                    self.goalRef.evaluateDump(self.orbit, self.images[index])
                    return


    def action_is_posible(self):
        # check if busy or the satellite does nothing 
        if self.satellite_busy_time > 0:
            self.busy=1
            return False
        
        # Check if Take picture action is possible
        for index in range(len(self.targets)):
            # Checks if memory space is available and that the satellite is above target
            if self.targets[index][0] < self.pos < self.targets[index][1] and self.memory_level<SatelliteSim.MEMORY_SIZE:
                print("Take pic")
                return True
        
        # Check if Analyse picture action is possible
        for index in range(len(self.images)):
            if not self.analysis[index] and self.images[index]>-.1:
                print("Analysis")
                return True
        
        # Check if Dump picture action is possible
        # check if it is above the ground station and if their is any analysed image
        if any([gs[0]-SatelliteSim.ACTION_THRESHOLD < self.pos < gs[1]+SatelliteSim.ACTION_THRESHOLD for gs in self.groundStations]):
            if any(self.analysis):
                print("Dump")
                return True

        # No action is possible    
        return False

    def reset(self):
        self.sim_time = 0

        # satellite state
        self.pos = 0
        self.orbit = 0
        self.last_action = None

        # memory state
        self.memory_level = 0
        self.images = [-1] * self.MEMORY_SIZE
        self.analysis = [False] * self.MEMORY_SIZE
        self.satellite_busy_time = 0

        # Generate Targets
        self.initRandomTargets(int(round(random.normal(8,4))))

        # Generate Ground Stations
        self.initRandomStations(int(max(1,round(random.normal(3,2)))))

    def initRandomStations(self, amount):
        self.groundStations = []
        for i in range(amount):
            s = random.random()*(SatelliteSim.CIRCUNFERENCE-15)
            self.groundStations.append((s, s+15))

    def initRandomTargets(self, amount):
        self.targets = []
        for i in range(amount):
            s = random.random()*(SatelliteSim.CIRCUNFERENCE-5)
            self.targets.append((s, s+5))

    def get_state(self):
        state = [self.sim_time, self.pos, self.busy, self.memory_level, 
                *self.images, *self.analysis, *self.targets, *self.groundStations]
        return state
        
    def time2angle(self, time):
        delta_t = time - math.floor(time/self.PERIOD) * self.PERIOD
        return self.velocity*delta_t
    
    def angle2time(self, angle):
        T = self.orbit*self.PERIOD
        t = T + angle / self.velocity

