"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
import math
import pygame
from SimpleSatellite.envs.simulation.Base import SatelliteSim_Base as SatelliteSim
from time import sleep
import matplotlib.pyplot as plt
from copy import copy
import numpy as np
ACTION_TEXT = ["IDLE", "TAKING PICTURE...", "ANALYZING PICTURE...", "DUMPING PICTURE..."]
class SatelliteView:

    # Palette
    BLACK = (0, 0, 0)
    WHITE = (255, 255, 255)
    PURPLE = (128, 0, 255)
    ORANGE = (255, 128, 0)
    PURPLE_ORANGE = (192, 64, 127)
    DARK_BLUE = (0, 0, 128)
    WHITE_RED = (168, 132, 130)
    GREEN = (0, 255, 0)
    YELLOW = (255, 255, 0)
    RED = (255, 0, 0)
    GREY = (128, 128, 128)
    DARK_GREY = (64, 64, 64)
    LIGHT_YELLOW = (255, 255, 128)

    # config Main Window
    WIDTH, HEIGHT = 800, 1000
    PLANET_CENTER = (WIDTH / 2, WIDTH/ 2)
    PLANET_SIZE = WIDTH / 2
    SAT_SIZE = PLANET_SIZE / 40
    GOAL_SIZE = PLANET_SIZE / 15
    ORBIT_DISTANCE = PLANET_SIZE / 10
    HUD_WIDTH = 0.8*WIDTH
    OFFSET = 0.1*WIDTH
    OFFSET_H = 0.05*WIDTH
    IMAGE_SIZE = 0.05*WIDTH
    POWER_BAR_HEIGHT = 0.4*HEIGHT
    DIV_AGENT = 700


    # Config planners windows

    def __init__(self, sim: SatelliteSim):
        self.sim = sim
        self.image_width = min(SatelliteView.HUD_WIDTH / (1.2*sim.MEMORY_SIZE), SatelliteView.IMAGE_SIZE)
        self.space = (SatelliteView.HUD_WIDTH - self.image_width * (sim.MEMORY_SIZE))/(sim.MEMORY_SIZE-1)
        # self.Spacecraft = pygame.image.load("SimpleSatellite/envs/simulation/Spacecraft.png")
        # self.Spacecraft = pygame.transform.scale(self.Spacecraft, (int(SatelliteView.SAT_SIZE), int(SatelliteView.SAT_SIZE)))
        

        # font
        pygame.font.init()
        self.font = pygame.font.SysFont(None, int(SatelliteView.IMAGE_SIZE / 2))
        self.font_medium = pygame.font.SysFont(None, int(3*SatelliteView.IMAGE_SIZE/4))
        self.font_big = pygame.font.SysFont(None, int(SatelliteView.IMAGE_SIZE))
        self.text_digits = [self.font_medium.render(str(i+1), True, SatelliteView.WHITE) for i in
                            range(sim.n_targets)]
        self.text_goals = self.font.render("Open Goals", True, SatelliteView.WHITE)

        # Open a Main window
        self.screen = pygame.display.set_mode((SatelliteView.WIDTH, SatelliteView.HEIGHT))
        pygame.display.set_caption("Simple Satellite")

        # Planner windows
        self.planner_screens = []

    ###### MAIN FUNCTION ######
    def drawSim(self, sim, action_name=None):
        self.screen.fill(SatelliteView.BLACK)
        planetList = [(SatelliteView.PLANET_CENTER[0] - SatelliteView.PLANET_SIZE/ 2) ,
                      (SatelliteView.PLANET_CENTER[1] - SatelliteView.PLANET_SIZE/ 2),
                      SatelliteView.PLANET_SIZE, SatelliteView.PLANET_SIZE]
        # draw planet
        pygame.draw.ellipse(self.screen, SatelliteView.WHITE, planetList)
        # draw ground station arcs
        self.drawArcsAndTags(SatelliteView.PURPLE, sim.groundStations)
        # draw target arcs
        self.drawArcsAndTags(SatelliteView.ORANGE, sim.targets, tags="std")
        # draw opportunity
        if sim.opportunity:
            self.drawArcsAndTags(SatelliteView.GREEN, [[sim.pos-2., sim.pos+2.]], tags="O")
        # Draw Eclipse
        self.drawEclpise(sim) 
        # draw satellite
        self.drawSatellite(sim)
        # Draw images
        self.drawImages(sim)
        # draw satellite recovery time
        self.drawActionBar(sim, action_name)
        # Draw Power bar
        if sim.POWER_OPTION:
            self.drawPowerBar(sim)
        pygame.draw.line(self.screen, SatelliteView.WHITE, [0, SatelliteView.DIV_AGENT],[SatelliteView.WIDTH, SatelliteView.DIV_AGENT], width=2)
        pygame.draw.arc(self.screen, SatelliteView.BLACK, planetList, 0, 2 * math.pi, width=2)
        self.drawPosOrbit(sim.get_state())

    def quit(self):
        pygame.quit() 

    ###### DRAWING FUNCTIONS ######
    def drawArcsAndTags(self, color, arcs, tags=None, tolerance=0.1):
        min_max_tarcker = []
        
        for i, arc in enumerate(arcs):
            if color == SatelliteView.PURPLE:
                thickness = int(SatelliteView.PLANET_SIZE / 8)
            else:
                thickness = int(SatelliteView.PLANET_SIZE / 10)
            min_pos = max(0, arc[0])
            min_pos_rad = min_pos / SatelliteSim.CIRCUNFERENCE * 2 * math.pi
            max_pos = min(SatelliteSim.CIRCUNFERENCE, arc[1])
            max_pos_rad = max_pos / SatelliteSim.CIRCUNFERENCE * 2 * math.pi 
            match_range = False
            theta = (min_pos_rad + max_pos_rad) / 2
            for range in min_max_tarcker:
                if range["theta"] - tolerance <= theta <= range["theta"] + tolerance:
                    range["n"] += 1
                    match_range = True
                    range["theta"] = (theta + range["theta"])/2
                    thickness *= .7
                    break
            if tags is not None:
                radius = SatelliteView.PLANET_SIZE / 2
                if tags == "std":
                    tag = f"{i+1}"
                elif type(tags) == list:
                    tag = tags[i]
                else:
                    tag = tags
                r = radius
                r_end =  3*radius/4
                if not match_range:
                    min_max_tarcker.append({"theta": theta, "n": 1})
                else:
                    r_end -= range["n"]*radius/8

                pos = self.polar2cart([r, theta])
                pos_end = self.polar2cart([r_end, theta])
                self.drawTag(tag, pos, pos_tag=pos_end)
            self.drawArc(color, min_pos_rad, max_pos_rad, thickness=thickness) 



    def drawImages(self, sim):
        # draw images
        action, add_info = sim.last_action
        Slotfound = False
        for index, image in enumerate(sim.images):
            img_text = None
            if image > 0:
                # add info is the memory slot
                if sim.analysis[index]:
                    if sim.satellite_busy_time > 0 and add_info == index:
                            c1, c2 = SatelliteView.PURPLE, SatelliteView.WHITE
                            t = sim.satellite_busy_time/sim.DURATION_DUMP
                            panelColor = self.transitionColor(c1,c2,t)
                    else :
                        panelColor = SatelliteView.PURPLE
                    
                else:
                    if  action == SatelliteSim.ACTION_ANALYSE and sim.satellite_busy_time > 0 and add_info == index:
                        c1, c2 = SatelliteView.ORANGE, SatelliteView.PURPLE
                        t = sim.satellite_busy_time/sim.DURATION_ANALYSE
                        panelColor = self.transitionColor(c1,c2,t)
                    else:    
                        panelColor = SatelliteView.ORANGE
                img_text = self.text_digits[image-1]
            else:
                # add info is the img
                if sim.satellite_busy_time > 0 and action == SatelliteSim.ACTION_TAKE_IMAGE and (not Slotfound):
                    c1, c2 = SatelliteView.WHITE, SatelliteView.ORANGE
                    t = sim.satellite_busy_time/sim.DURATION_TAKE_IMAGE
                    panelColor = self.transitionColor(c1,c2,t)
                    img_text = self.text_digits[add_info-1]
                    Slotfound = True
                else:
                    panelColor = SatelliteView.WHITE
            pygame.draw.rect(self.screen, panelColor, [SatelliteView.OFFSET + index * (self.image_width + self.space),
                                                        SatelliteView.OFFSET_H, self.image_width,
                                                        SatelliteView.IMAGE_SIZE])
            if img_text is not None:
                x = SatelliteView.OFFSET + index * (self.image_width + self.space) + self.image_width *.5
                y = SatelliteView.OFFSET_H + SatelliteView.IMAGE_SIZE * .5
                img_rect = img_text.get_rect(center=(x,y))
                self.screen.blit(img_text, img_rect)
    
    
    
    def drawActionBar(self, sim, action_name):
        x_action_bar, y_action_bar = SatelliteView.OFFSET, 2.2 * SatelliteView.IMAGE_SIZE
        w_action_bar, h_action_bar = SatelliteView.HUD_WIDTH, SatelliteView.IMAGE_SIZE
        max_time = max(self.sim.DURATION_ANALYSE, self.sim.DURATION_DUMP, self.sim.DURATION_TAKE_IMAGE)
        pygame.draw.rect(self.screen, SatelliteView.WHITE, [x_action_bar, y_action_bar,
                                                            w_action_bar, h_action_bar])
        recoveryWidth = w_action_bar * sim.satellite_busy_time / max_time
        pygame.draw.rect(self.screen, SatelliteView.PURPLE, [x_action_bar, y_action_bar,
                                                            recoveryWidth, h_action_bar])
        # Draw action taken
        if action_name is None:
            action_name = ["IDLE", "TAKING IMAGE...", "DUMPING IMAGE...", "ANALYSING IMAGE..."][sim.Taking_action]
        Action_text_draw = self.font_big.render(action_name, True, SatelliteView.BLACK)
        Action_rect = Action_text_draw.get_rect(center=(x_action_bar+w_action_bar/2, y_action_bar+h_action_bar/2))
        self.screen.blit(Action_text_draw, Action_rect)

    def drawEclpise(self, sim):
        width = int(SatelliteView.ORBIT_DISTANCE + 6*SatelliteView.SAT_SIZE)
        radius = int(SatelliteView.PLANET_SIZE + width)

        light_range = sim.light_range
        for r in light_range:
            min_pos_rad = r[0]*np.pi/180
            max_pos_rad = r[1]*np.pi/180
            if min_pos_rad < max_pos_rad:
                self.drawArc(SatelliteView.LIGHT_YELLOW, min_pos_rad, max_pos_rad, width, radius=radius, borders=False)

        penumbre_range = sim.penumbre_range
        for r in penumbre_range:
            min_pos_rad = r[0]*np.pi/180
            max_pos_rad = r[1]*np.pi/180
            if min_pos_rad < max_pos_rad:
                self.drawArc(SatelliteView.GREY, min_pos_rad, max_pos_rad, width, radius=radius, borders=False)
        
        umbra_range = sim.umbra_range
        for r in umbra_range:
            min_pos_rad = r[0]*np.pi/180
            max_pos_rad = r[1]*np.pi/180
            if min_pos_rad < max_pos_rad:
                self.drawArc(SatelliteView.DARK_GREY, min_pos_rad, max_pos_rad, width, radius=radius, borders=False)
    
    def drawPosOrbit(self, obs):
        pos = obs['Pos']
        orb = obs['Orbit']
        lamba_w_r = 0.3
        lamba_h_r = (1-lamba_w_r)/2
        x_r = SatelliteView.OFFSET + SatelliteView.IMAGE_SIZE * 0.1 
        y_r = 3.5 * SatelliteView.IMAGE_SIZE
        w_r = SatelliteView.HUD_WIDTH*lamba_w_r
        h_r = SatelliteView.GOAL_SIZE
        arbiter_txt = self.font.render(f"Orbit = {orb}", True, SatelliteView.ORANGE)
        self.screen.blit(arbiter_txt, [x_r, y_r,
                                        .5*w_r, .5*h_r])
        pos_txt = self.font.render(f"Pos = {round(pos)}", True, SatelliteView.ORANGE)
        self.screen.blit(pos_txt, [x_r, y_r + h_r,
                                    .5*w_r, .5*h_r])
    
    def drawPowerBar(self, sim):
        # POwer Bar
        if sim.Power > 50:
            color = SatelliteView.GREEN
        elif sim.Power > 25:
            color = SatelliteView.YELLOW
        else:
            color = SatelliteView.RED
        OFFSET_y = SatelliteView.PLANET_CENTER[1] -  .5 * SatelliteView.POWER_BAR_HEIGHT
        x_a = SatelliteView.WIDTH - SatelliteView.IMAGE_SIZE - SatelliteView.OFFSET 
        y_a = OFFSET_y + SatelliteView.POWER_BAR_HEIGHT * (1 - (sim.Power/100))
        w_a = SatelliteView.IMAGE_SIZE
        h_a = SatelliteView.POWER_BAR_HEIGHT * (sim.Power/100)
        pygame.draw.rect(self.screen, color, [x_a, y_a,w_a, h_a])

        # power box
        pygame.draw.line(self.screen, SatelliteView.WHITE, (x_a, OFFSET_y), (x_a, OFFSET_y + SatelliteView.POWER_BAR_HEIGHT))
        pygame.draw.line(self.screen, SatelliteView.WHITE, (x_a + w_a, OFFSET_y), (x_a + w_a, OFFSET_y + SatelliteView.POWER_BAR_HEIGHT))

        # Percentage lines
        for i in range(0, 101, 25):
            y_a = OFFSET_y + SatelliteView.POWER_BAR_HEIGHT * (1 - (i/100))
            pygame.draw.line(self.screen, SatelliteView.WHITE, (x_a, y_a), (x_a + w_a, y_a))
            name = self.font.render(str(i), True, SatelliteView.WHITE)
            self.screen.blit(name, (x_a + w_a+2, y_a-1))
        # Power text
        name = self.font.render("Power", True, SatelliteView.WHITE)
        self.screen.blit(name, (x_a, y_a + SatelliteView.POWER_BAR_HEIGHT + 4))

    def drawSatellite(self, sim):
        if sim.check_light() > 0:
            sat_color = SatelliteView.BLACK
        else:
            sat_color = SatelliteView.WHITE
        pygame.draw.ellipse(self.screen, sat_color,
                            [(SatelliteView.PLANET_CENTER[0] - SatelliteView.SAT_SIZE/ 2)  + (
                                        SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.sin(
                                2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                             (SatelliteView.PLANET_CENTER[1] - SatelliteView.SAT_SIZE/ 2)  + (
                                         SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.cos(
                                 2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                             SatelliteView.SAT_SIZE, SatelliteView.SAT_SIZE], 0)
        pygame.draw.line(self.screen, sat_color,
                         (SatelliteView.PLANET_CENTER[0] + (
                                     SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.sin(
                             2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                          SatelliteView.PLANET_CENTER[1] + (
                                      SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.cos(
                              2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2)),
                         (SatelliteView.PLANET_CENTER[0] + (SatelliteView.PLANET_SIZE / 2) * math.sin(2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                          SatelliteView.PLANET_CENTER[1] + (SatelliteView.PLANET_SIZE / 2) * math.cos(2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2))
                         )

    ##################
    ## Helpers     ##
    ##################
    def transitionColor(self, c1, c2, t):
        return [o + (p - o)*(t) for p,o in zip(c1, c2)]
    
    def drawReward(self, reward):
        lamba_w_r = 0.3
        lamba_h_r = (1-lamba_w_r)/2
        x_r = SatelliteView.OFFSET + SatelliteView.GOAL_SIZE * 0.1 + SatelliteView.HUD_WIDTH*lamba_h_r
        y_r = SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE * 0.
        w_r = SatelliteView.HUD_WIDTH*lamba_w_r
        h_r = SatelliteView.GOAL_SIZE
        pygame.draw.rect(self.screen, SatelliteView.WHITE, [x_r, y_r,
                                                            w_r, h_r])
        reward_txt = self.font.render("Reward = "+str(round(reward,2)), True, SatelliteView.BLACK)
        Action_rect = reward_txt.get_rect(center=(x_r+.5*w_r, y_r+.5*h_r))
        self.screen.blit(reward_txt, Action_rect)
    
    def drawArc(self, color: pygame.Color, start: float, end: float, thickness: float, radius: float = None, borders: bool = True):
        if radius is None:
            radius = SatelliteView.PLANET_SIZE 
        
        x_num = int((end - start) / (2 * math.pi) * SatelliteSim.CIRCUNFERENCE)
        xpoints = [SatelliteView.PLANET_CENTER[0] + (radius) / 2 * math.sin(
            start + (end - start) * i / x_num + math.pi / 2) for i in range(x_num+1)]
        xpoints += [SatelliteView.PLANET_CENTER[0] + (radius- thickness) / 2 * math.sin(
            start + (end - start) * i / x_num + math.pi / 2) for i in range(x_num, -1, -1)]

        ypoints = [SatelliteView.PLANET_CENTER[1] + (radius) / 2 * math.cos(
            start + (end - start) * i / x_num + math.pi / 2) for i in range(x_num+1)]
        ypoints += [SatelliteView.PLANET_CENTER[1] + (radius- thickness) / 2 * math.cos(
            start + (end - start) * i / x_num + math.pi / 2) for i in range(x_num, -1, -1)]

        pygame.draw.polygon(self.screen, color, [(x, y) for x, y in zip(xpoints, ypoints)])
        if borders:
            pygame.draw.polygon(self.screen, SatelliteView.BLACK, [(x, y) for x, y in zip(xpoints, ypoints)], width=2)
           
    def drawTag(self, tag: str, pos, pos_tag: float = None):
        pygame.draw.line(self.screen, SatelliteView.BLACK, pos, pos_tag)
        tag_text = self.font.render(tag, True, SatelliteView.BLACK)
        tag_rect = pos_tag
        self.screen.blit(tag_text, tag_rect)

    def polar2cart(self, coord, center=None):
        r, theta = coord
        x = r * math.cos(theta)
        y = r * math.sin(theta)
        if center is not None:
            x += center[0]
            y = center[1] - y
        else:
            x += SatelliteView.PLANET_CENTER[0]
            y = SatelliteView.PLANET_CENTER[1] - y
        return x, y

        

################################################################################################################################
################################################################################################################################
# OLD FUNCTIONS
################################################################################################################################
################################################################################################################################

    # ##################
    # ## Draw Arbiter ##
    # ##################
    # def draw_arbiter(self, Voices, obs):
    #     self.draw_legend()

    #     n_voices = len(Voices)

    #     ### Draw timeline 
    #     line_w = SatelliteView.WIDTH - SatelliteView.OFFSET
    #     line_y = SatelliteView.DIV_AGENT + (SatelliteView.HEIGHT - SatelliteView.DIV_AGENT) * 0.8

    #     # Horizontal line
    #     pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y],
    #                         [SatelliteView.OFFSET/2 + line_w, line_y], width=2)
        
    #     # Vertical line
    #     pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y - SatelliteView.GOAL_SIZE*(n_voices+1)],
    #                         [SatelliteView.OFFSET/2, line_y], width=2)
        
    #     for i,v in enumerate(Voices):
    #         y = line_y - SatelliteView.GOAL_SIZE*(n_voices - i)
    #         # Voice name
    #         voice_txt = self.font.render(v.name, True, SatelliteView.WHITE)
    #         self.screen.blit(voice_txt, [SatelliteView.OFFSET/4 - SatelliteView.GOAL_SIZE*0.5, y + SatelliteView.GOAL_SIZE*0.5])
            
    #         # Voice plan
    #         self.draw_single_plan(v.full_plan, obs, line_w, y)

    # #############################
    # ## Draw Percentage of Goal ##
    # #############################
    # def draw_percentage_of_goals_completed(self, goals_completed, goals_total, planner_name, n_p, tot_p):
    #     # Draw percentage of goals completed
    #     percent_txt = self.font.render(planner_name + ": " + str(round(goals_completed/goals_total*100,2)) + "%", True, SatelliteView.WHITE)
    #     self.screen.blit(percent_txt, [SatelliteView.OFFSET/2 + (SatelliteView.OFFSET/2 + SatelliteView.HUD_WIDTH) * (n_p/tot_p), SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE*2])

    # #############################
    # ## Draw Replanning Signal  ##
    # #############################
    # def draw_Replanning_signal(self, PLanner_name:str):
    #     Signal = self.font.render(PLanner_name, True, SatelliteView.RED)
    #     self.screen.blit(Signal, [SatelliteView.OFFSET/2, SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE*0.5])

    # ##################
    # ## Draw Planner ##
    # ##################
    # def draw_planner(self, plan, obs, target_dump=None):
        
    #     self.draw_legend()
    #     # Draw timeline 
    #     line_w = SatelliteView.WIDTH - SatelliteView.OFFSET
    #     line_y = SatelliteView.DIV_AGENT + (SatelliteView.HEIGHT - SatelliteView.DIV_AGENT) * 0.6
    #     pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y],
    #                         [SatelliteView.OFFSET/2 + line_w, line_y], width=2)
    #     pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y - SatelliteView.GOAL_SIZE*3],
    #                         [SatelliteView.OFFSET/2, line_y], width=2)
    #     # Draw plan
    #     self.draw_single_plan(plan, obs, line_w, line_y) 

    #     # # Draw Dump images
    #     # st_y = SatelliteView.DIV_AGENT + (SatelliteView.HEIGHT - SatelliteView.DIV_AGENT) * 0.7
    #     # pygame.draw.rect(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, st_y, line_w, SatelliteView.GOAL_SIZE*2])
    #     # Goals = 'Image Dumped = '
    #     # for k,v in target_dump.items():
    #     #     Goals += str(k)+': '+str(v)+' | '
    #     # font_Goals = pygame.font.SysFont(None, int(SatelliteView.IMAGE_SIZE))
    #     # Goals_txt = font_Goals.render(Goals, True, SatelliteView.BLACK, )
    #     # self.screen.blit(Goals_txt, [SatelliteView.OFFSET/2, st_y+SatelliteView.GOAL_SIZE*0.5,
        #                             .5*line_w, .5*SatelliteView.GOAL_SIZE])
#    def draw_legend(self):
#         #* Draw legend Take image (orange), Analyze (orange-purple), and Dump (purple)
#         lamba_w_r = 1.0
#         lamba_h_r = (1-lamba_w_r)/2
#         x_r = SatelliteView.OFFSET + SatelliteView.GOAL_SIZE * 0.1 + SatelliteView.HUD_WIDTH*lamba_h_r
#         y_r = SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE * 0.
#         w_r = SatelliteView.HUD_WIDTH*lamba_w_r
#         h_r = SatelliteView.GOAL_SIZE
#         # legend rectangle
#         pygame.draw.rect(self.screen, SatelliteView.WHITE, [x_r, y_r,
#                                                             w_r, h_r])
#         # legend text
#         x_leg = copy(x_r)
#         pad = h_r*0.2
#         sq_l = h_r - 2*pad
#         pygame.draw.rect(self.screen, SatelliteView.ORANGE, [x_leg+pad, y_r+pad,
#                                                              sq_l, sq_l])
#         x_leg += 2*pad + sq_l
#         TP_txt = self.font.render("Take picture (TP)", True, SatelliteView.BLACK)
#         self.screen.blit(TP_txt, [x_leg, y_r+pad,
#                                   .3*w_r, .5*h_r])
#         x_leg += .25*w_r
#         pygame.draw.rect(self.screen, SatelliteView.PURPLE_ORANGE, [x_leg+pad, y_r+pad,
#                                                                     sq_l, sq_l])
#         x_leg += 2*pad + sq_l
#         AP_txt = self.font.render("Analyze picture (AN)", True, SatelliteView.BLACK)
#         self.screen.blit(AP_txt, [x_leg, y_r+pad,
#                                     .3*w_r, .5*h_r])
#         x_leg += .3*w_r
#         pygame.draw.rect(self.screen, SatelliteView.PURPLE, [x_leg+pad, y_r+pad,
#                                                                 sq_l, sq_l])    
#         x_leg += 2*pad + sq_l
#         DP_txt = self.font.render("Dump picture (DP)", True, SatelliteView.BLACK)
#         self.screen.blit(DP_txt, [x_leg, y_r+pad,
#                                     .3*w_r, .5*h_r])

#     def draw_single_plan(self, plan, obs, line_w, line_y):
#         # Draw plan
#         current_pos = obs['Pos'][0]+ 360*obs['Orbit'][0]
#         for i in range(len(plan)):
#             ac = plan[i][1]
#             if ac == SatelliteSim.ACTION_TAKE_IMAGE:
#                 act_dur = self.sim.DURATION_TAKE_IMAGE*self.sim.velocity
#                 color = SatelliteView.ORANGE
#             elif ac == SatelliteSim.ACTION_ANALYSE:
#                 act_dur = self.sim.DURATION_ANALYSE*self.sim.velocity
#                 color = SatelliteView.PURPLE_ORANGE
#             elif ac == SatelliteSim.ACTION_DUMP:
#                 act_dur = self.sim.DURATION_DUMP*self.sim.velocity
#                 color = SatelliteView.PURPLE
#             else:
#                 raise Exception("Unknown action")
#             action_begin = plan[i][0] 
#             action_end = action_begin + act_dur
#             if current_pos <= action_begin < current_pos + 360 or current_pos <= action_end < current_pos + 360:
#                 if action_begin < current_pos:
#                     action_begin = current_pos
#                 if action_end > current_pos + 360:
#                     action_end = current_pos + 360
#                 time_width = (action_end - action_begin) / 360 * line_w 
#                 x = SatelliteView.OFFSET/2 + (action_begin - current_pos) / 360 * line_w
#                 pygame.draw.rect(self.screen, color, [x, line_y , time_width, SatelliteView.GOAL_SIZE])