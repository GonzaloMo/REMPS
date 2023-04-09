from time import sleep
from copy import copy
import numpy as np
import pygame
from Agents.AgentPDDL import PDDLAgent
import random
import math

class Gridworld:
    block_size = 2
    Scale = 20

    # define colors
    black = (0, 0, 0)
    light_blue = (102, 255, 255)
    red = (255, 0, 0)
    light_red = (255, 153, 153)
    green = (0, 255, 0)
    blue = (0, 0, 255)
    grey = (192, 192, 192)
    white = (255, 255, 255)
    colorPallet = {'k': black, 'r':red, 'b':blue}

    freeSpaceTag = 0
    positionTag = 1
    goalPositionTag = 2
    obstacleTag = 3


    def __init__(self, grid_size=10, problem_type='Train_env', debug=False, verbose=False, render_type = 'ASCII'):
        
        """

        problem_type variable can be:
            - Test_1: Non-deterministic action outcomes
            - Test_2: Unachievable plan state
            - Test_3: Missing action 
            - Train_env: Combined Environment
        """

        '''Set Parameters '''
        self._seed = 0
        self.grid_size = grid_size
        self.debug = debug  # restart or not once done
        self.verbose = verbose
        self.init_render = True
        self.render_type = render_type

    ############  Create new Scenario ###########################################     
    def Create_empty_map(self):
        '''Create Initial Map  only exterior walls'''
        Map = np.zeros([self.grid_size, self.grid_size], dtype=np.int8)
        return Map
    
    def Generate_init_and_Goal(self, Map):
        self.start_pos = [1,1]
        self.pos = copy(self.start_pos)
        self.goal_pos = list(np.random.randint(int(self.grid_size/2), high=self.grid_size-1, size=2))
        Map[self.start_pos[0]][self.start_pos[1]] = self.positionTag
        Map[self.goal_pos[0]][self.goal_pos[1]] = self.goalPositionTag
        return Map
    
    def Generate_Obstacles(self, Map, number_of_obstacle): 
        obstacle_loc = np.where(Map==self.obstacleTag)
        current_pos = np.reshape(np.array(np.where(Map==self.positionTag)), (2,))
        goal_pos = np.reshape(np.array(np.where(Map==self.goalpositionTag)), (2,))
        # Remove all obstacles if any
        if not list(obstacle_loc[0]) == []:
            #print('true')
            Map = self.Create_empty_map()
            Map[current_pos[0]][current_pos[1]] = self.positionTag
            Map[goal_pos[0]][goal_pos[1]] = self.goalpositionTag
        danger_map = copy(Map)
        for i in range(number_of_obstacle):
            Map,danger_map = self._Spawn_single_obstacle(Map, danger_map)
        return Map
    
    def _Spawn_single_obstacle(self, Map, danger_map):
        x = random.randint(1, self.grid_size-2)
        y = random.randint(1, self.grid_size-2)
        obst_loc = (x, y)
        match = self._check_location(obst_loc, Map)
        if not match: # it is not placed above any other object
            danger = self._check_dangerous(obst_loc, danger_map)
            if danger<2: # valid danger level
                if danger == 0:
                    # non dangerous obstacle
                    danger_map[obst_loc[0]][obst_loc[1]] = self.obstacleTag
                else:
                    danger_map[obst_loc[0]][obst_loc[1]] = self.obstacleTag + 1
                    # set all neighnours as dangerous recursively
                    self.temp_danger_Map = copy(danger_map)
                    self._make_neighbours_dangerous(obst_loc)
                    danger_map = copy(self.temp_danger_Map)
                Map[obst_loc[0]][obst_loc[1]] = self.obstacleTag
        return Map, danger_map
    
    def _check_dangerous(self, pos, danger_map):
        # adjacent dangerous cells
        count_dangerous = 0
        # check neighbours
        p_list = [-1, 0 , 1]
        wall_counted = False
        for i in p_list: 
            x = pos[0] + i
            for j in p_list: 
                y = pos[1] + j
                # walls are dangerous
                if danger_map[x][y] == 3 and not wall_counted:
                    count_dangerous += 1
                    wall_counted = True
                # obstacle
                if danger_map[x][y]==5:
                    count_dangerous += 1
                if count_dangerous>1:
                    return count_dangerous
        # return 0 or 1
        return count_dangerous
    
    def _make_neighbours_dangerous(self, pos):       
        # check neighbours
        p_list = [-1, 0 , 1]
        for i in p_list: 
            x = pos[0] + i
            if 0 <= x < self.grid_size:
                for j in p_list: 
                    y = pos[1] + j
                    if 0 <= y < self.grid_size:
                        if self.temp_danger_Map[x][y]==self.obstacleTag:
                            self.temp_danger_Map[x][y] = self.obstacleTag+1
                            self._make_neighbours_dangerous( (x,y))

    
    def _check_location(self, pos, Map):
        x = pos[0]
        y = pos[1]
        #for loc in obs_loc:
        if Map[x][y]>.5:
            return True
        return False

    

    def Spawn_secondary(self, Map):
        number_of_obstacle = random.randint(1, 4) 
        for i in range(number_of_obstacle):
            Map = self._Spawn_single_opportunity(Map)
        return Map

    def _Spawn_single_opportunity(self, Map):
        x = random.randint(1, self.grid_size-2)
        y = random.randint(1, self.grid_size-2)
        opp_loc = (x, y)
        match = self._check_location(opp_loc, Map)
        if not match:
            Map[x][y] = 2
        return Map

    ######### RENDER ################################
    def full_Render(self, Map, path=None, path_done=None, path_width=3, pathcolor=['b']):
        pos_pre = np.array(np.where(Map == 1))
        pos = [pos_pre[0][0],pos_pre[1][0]]
        
        Display_x, Display_y = np.shape(Map)
        if self.render_type == 'PYGAME':
            if self.init_render: 
                pygame.init()
                self.screen = pygame.display.set_mode(((Display_y*2)*Gridworld.Scale, (Display_x*2)*Gridworld.Scale))
                self.init_render = False
            self.Render_Map(Map)
            self.render_pos(pos)
            
            if path:
                print('Plan')
                self.render_path(path, width=path_width)
            if path_done:
                print('Path done')
                self.render_path(path_done, colorname=pathcolor)
        else:
            print(Map.T)
            print('')

    def Render_Map(self, Map):
        block_size = Gridworld.block_size*Gridworld.Scale
        self.screen.fill(Gridworld.white)        
        for i in range(self.grid_size):
            for j in range(self.grid_size):

                if self.start_pos == [i,j]:
                    pygame.draw.rect(self.screen, Gridworld.light_blue, (i*block_size, j*block_size, block_size, block_size))
                elif self.goal_pos==[i,j]:
                    pygame.draw.rect(self.screen, Gridworld.green, (i*block_size, j*block_size, block_size, block_size))
                elif Map[i][j]==self.obstacleTag:
                    pygame.draw.circle(self.screen, Gridworld.grey, ((i*block_size)+Gridworld.Scale, (j*block_size)+Gridworld.Scale), int(Gridworld.Scale))
                elif Map[i][j]==2:
                    pygame.draw.circle(self.screen, Gridworld.green, ((i*block_size)+Gridworld.Scale, (j*block_size)+Gridworld.Scale), int(Gridworld.Scale))
                pygame.draw.rect(self.screen, Gridworld.black, (i*block_size, j*block_size, block_size, block_size), width=1)
                
    def render_pos(self, pos):
        block_size = Gridworld.block_size*Gridworld.Scale
        pygame.draw.circle(self.screen, Gridworld.blue, ((pos[0]*block_size)+Gridworld.Scale, (pos[1]*block_size)+Gridworld.Scale), int(0.75*Gridworld.Scale))            

    def render_path(self, path, colorname=['r'], width=2):
        
        block_size = Gridworld.block_size*Gridworld.Scale
        for i in range(len(path)-1):
            if len(colorname) == 1:
                c = Gridworld.colorPallet[colorname[0]]
            else:
                c = Gridworld.colorPallet[colorname[i+1]]

            pygame.draw.line(self.screen, c, (path[i]*block_size)+Gridworld.Scale, (path[i+1]*block_size)+Gridworld.Scale, width=width)
            x,y = path[i]
            pygame.draw.circle(self.screen, c, ((x*block_size)+Gridworld.Scale, (y*block_size)+Gridworld.Scale), int(Gridworld.Scale*.3))
    
    def circleState(self, state):
        block_size = Gridworld.block_size*Gridworld.Scale
        x, y = state
        c = Gridworld.red
        pygame.draw.circle(self.screen, c, ((x*block_size)+Gridworld.Scale, (y*block_size)+Gridworld.Scale), int(Gridworld.Scale), width=3)

    def close(self):
        pygame.QUIT
        return
