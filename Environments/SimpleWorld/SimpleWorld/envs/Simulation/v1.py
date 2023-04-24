from time import sleep
from copy import copy
import numpy as np
import pygame
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


    def __init__(self, grid_size=10):
        
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
        self.init_render = True

    ############  Create Map Helpers ###########################################     
    def CreateFullMap(self, n_obstacle):
        Map = self.Create_empty_map()
        Map, start_pos, goal_pos = self.Generate_init_and_Goal(Map)
        Map = self.Generate_Obstacles(Map, n_obstacle)
        return Map, start_pos, goal_pos
    
    def Create_empty_map(self):
        '''Create Initial Map  only exterior walls'''
        Map = np.zeros([self.grid_size, self.grid_size], dtype=np.int8)
        return Map
    
    def Generate_init_and_Goal(self, Map):
        start_pos = [0,0]
        goal_pos = list(np.random.randint(int(self.grid_size/2), high=self.grid_size, size=2))
        Map[start_pos[0]][start_pos[1]] = self.positionTag
        Map[goal_pos[0]][goal_pos[1]] = self.goalPositionTag
        return Map, start_pos, goal_pos
    
    def Generate_Obstacles(self, Map, number_of_obstacle): 
        obstacle_loc = np.where(Map==self.obstacleTag)
        current_pos = np.reshape(np.array(np.where(Map==self.positionTag)), (2,))
        goal_pos = np.reshape(np.array(np.where(Map==self.goalPositionTag)), (2,))
        # Remove all obstacles if any
        if not list(obstacle_loc[0]) == []:
            Map = self.Create_empty_map()
            Map[current_pos[0]][current_pos[1]] = self.positionTag
            Map[goal_pos[0]][goal_pos[1]] = self.goalPositionTag
        danger_map = copy(Map)
        n_obstacle = 0
        failed_pos = 0
        while n_obstacle < number_of_obstacle:
            Map, danger_map, placed = self._Spawn_single_obstacle(Map, danger_map)
            if placed:
                self.full_Render(danger_map, render_type="PYGAME", last_color="red")
                pygame.display.flip()
                sleep(.1)
                n_obstacle +=1
                failed_pos = 0
            else:
                failed_pos += 1
                if failed_pos > 100:
                    free_pos = self._check_obstacle_placement(danger_map)
                    if free_pos == []:
                        break
                    else:
                        n_obstacle +=1
                        failed_pos = 0
        self.danger_map = danger_map
        return Map
    
    def _Spawn_single_obstacle(self, Map, danger_map):
        x = random.randint(0, self.grid_size-1)
        y = random.randint(0, self.grid_size-1)
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
                return Map, danger_map, True
        return Map, danger_map, False
    
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
                if y < 0 or y > self.grid_size-1 or x < 0 or x > self.grid_size-1:
                    if not wall_counted:
                        count_dangerous += 1
                        wall_counted = True
                else:
                    # obstacle
                    if danger_map[x][y]==self.obstacleTag or danger_map[x][y]==self.obstacleTag+1:
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
                            self._make_neighbours_dangerous((x,y))

    def _check_location(self, pos, Map):
        x = pos[0]
        y = pos[1]
        #for loc in obs_loc:
        if Map[x][y] != 0:
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

    def _check_obstacle_placement(self, Map):
        for x in range(self.grid_size):
            for y in range(self.grid_size):
                if Map[x][y] == self.obstacleTag or Map[x][y] == self.obstacleTag+1:
                    if self._check_dangerous((x,y), Map)<2:
                        return [x,y]
        return []

    ######### RENDER ################################
    def full_Render(self, Map, path=None, path_done=None, path_width=3, pathcolor=['b'], render_type='ASCII', last_color="green"):        
        Display_x, Display_y = np.shape(Map)
        if render_type == 'PYGAME':
            if self.init_render: 
                pygame.init()
                self.screen = pygame.display.set_mode(((Display_y*2)*Gridworld.Scale, (Display_x*2)*Gridworld.Scale))
                self.init_render = False
            self.Render_Map(Map, last_color=last_color)
            # self.render_pos(pos)
            
            if path:
                # print('Plan')
                self.render_path(path, width=path_width)
            if path_done:
                # print('Path done')
                self.render_path(path_done, colorname=pathcolor)
        else:
            print(Map.T)
            print('')

    def Render_Map(self, Map, last_color="green"):
        block_size = Gridworld.block_size*Gridworld.Scale
        self.screen.fill(Gridworld.white)        
        for i in range(self.grid_size):
            for j in range(self.grid_size):
                if Map[i][j]==self.goalPositionTag:
                    pygame.draw.rect(self.screen, Gridworld.green, (i*block_size, j*block_size, block_size, block_size))
                elif Map[i][j]==self.obstacleTag:
                    pygame.draw.circle(self.screen, Gridworld.grey, ((i*block_size)+Gridworld.Scale, (j*block_size)+Gridworld.Scale), int(Gridworld.Scale))
                elif Map[i][j]==self.positionTag:
                    pygame.draw.circle(self.screen, Gridworld.blue, ((i*block_size)+Gridworld.Scale, (j*block_size)+Gridworld.Scale), int(Gridworld.Scale))
                elif Map[i][j]==4:
                    if last_color == "red":
                        color= Gridworld.red
                    else:
                        color = Gridworld.green
                    pygame.draw.circle(self.screen, color, ((i*block_size)+Gridworld.Scale, (j*block_size)+Gridworld.Scale), int(Gridworld.Scale))
                pygame.draw.rect(self.screen, Gridworld.black, (i*block_size, j*block_size, block_size, block_size), width=1)
                
    def render_path(self, path, colorname=['r'], width=2):
        
        block_size = Gridworld.block_size*Gridworld.Scale
        for i in range(len(path)):
            if len(colorname) == 1:
                c = Gridworld.colorPallet[colorname[0]]
            else:
                c = Gridworld.colorPallet[colorname[i+1]]

            # pygame.draw.line(self.screen, c, (np.array(path[i])*block_size)+Gridworld.Scale, (np.array(path[i+1])*block_size)+Gridworld.Scale, width=width)
            x,y = path[i]
            pygame.draw.circle(self.screen, c, ((x*block_size)+Gridworld.Scale, (y*block_size)+Gridworld.Scale), int(Gridworld.Scale*.3))
        # x,y = path[-1]
        # pygame.draw.circle(self.screen, c, ((x*block_size)+Gridworld.Scale, (y*block_size)+Gridworld.Scale), int(Gridworld.Scale*.3))
    
    def circleState(self, state):
        block_size = Gridworld.block_size*Gridworld.Scale
        x, y = state
        c = Gridworld.red
        pygame.draw.circle(self.screen, c, ((x*block_size)+Gridworld.Scale, (y*block_size)+Gridworld.Scale), int(Gridworld.Scale), width=3)

    def close(self):
        pygame.QUIT
        return
