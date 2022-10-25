"""
copyright © 2022
University of Stratclyde
All rights reserved
Authors: Gonzalo Montesino Valle, Michael Cashmore
"""
import math
import pygame
from SimpleSatellite.envs.simulation.Simulation import SatelliteSim
from time import sleep
import matplotlib.pyplot as plt
from copy import copy

class SatelliteView:

    # Palette
    BLACK = (0, 0, 0)
    WHITE = (255, 255, 255)
    PURPLE = (128, 0, 255)
    ORANGE = (255, 128, 0)
    PURPLE_ORANGE = (192, 64, 127)
    WHITE_RED = (168, 132, 130)
    RED = (255, 0, 0)

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
        self.text_digits = [self.font.render(str(i+1), True, SatelliteView.WHITE) for i in
                            range(sim.n_targets)]
        self.text_goals = self.font.render("Open Goals", True, SatelliteView.WHITE)

        # Open a Main window
        self.screen = pygame.display.set_mode((SatelliteView.WIDTH, SatelliteView.HEIGHT))
        pygame.display.set_caption("Simple Satellite")

        # Planner windows
        self.planner_screens = []


    def drawArc(self, color: pygame.Color, start: float, end: float, thickness: float):

        xpoints = [SatelliteView.PLANET_CENTER[0] + (SatelliteView.PLANET_SIZE - thickness) / 2 * math.sin(
            start + (end - start) * i / 6.0 + math.pi / 2) for i in range(7)]
        xpoints += [SatelliteView.PLANET_CENTER[0] + (SatelliteView.PLANET_SIZE + 1) / 2 * math.sin(
            start + (end - start) * i / 6.0 + math.pi / 2) for i in range(6, -1, -1)]

        ypoints = [SatelliteView.PLANET_CENTER[1] + (SatelliteView.PLANET_SIZE - thickness) / 2 * math.cos(
            start + (end - start) * i / 6.0 + math.pi / 2) for i in range(7)]
        ypoints += [SatelliteView.PLANET_CENTER[1] + (SatelliteView.PLANET_SIZE + 1) / 2 * math.cos(
            start + (end - start) * i / 6.0 + math.pi / 2) for i in range(6, -1, -1)]

        pygame.draw.polygon(self.screen, color, [(x, y) for x, y in zip(xpoints, ypoints)])
        pygame.draw.polygon(self.screen, SatelliteView.BLACK, [(x, y) for x, y in zip(xpoints, ypoints)], width=2)

    def drawArcs(self, color, arcs, sim):
        for arc in arcs:
            min_pos = max(0, arc[0])
            min_pos_rad = min_pos / SatelliteSim.CIRCUNFERENCE * 2 * math.pi
            max_pos = min(SatelliteSim.CIRCUNFERENCE, arc[1])
            max_pos_rad = max_pos / SatelliteSim.CIRCUNFERENCE * 2 * math.pi 
            self.drawArc(color, min_pos_rad, max_pos_rad, int(SatelliteView.PLANET_SIZE / 16))

    def drawSim(self, sim: SatelliteSim, reward: float=None):

        self.screen.fill(SatelliteView.BLACK)
        planetList = [(SatelliteView.PLANET_CENTER[0] - SatelliteView.PLANET_SIZE/ 2) ,
                      (SatelliteView.PLANET_CENTER[1] - SatelliteView.PLANET_SIZE/ 2),
                      SatelliteView.PLANET_SIZE, SatelliteView.PLANET_SIZE]

        # draw planet
        pygame.draw.ellipse(self.screen, SatelliteView.WHITE, planetList)

        # draw ground station arcs
        self.drawArcs(SatelliteView.PURPLE, sim.groundStations, sim)
        
        # draw target arcs
        self.drawArcs(SatelliteView.ORANGE, sim.targets, sim)

        # draw satellite
        pygame.draw.ellipse(self.screen, SatelliteView.WHITE,
                            [(SatelliteView.PLANET_CENTER[0] - SatelliteView.SAT_SIZE/ 2)  + (
                                        SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.sin(
                                2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                             (SatelliteView.PLANET_CENTER[1] - SatelliteView.SAT_SIZE/ 2)  + (
                                         SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.cos(
                                 2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                             SatelliteView.SAT_SIZE, SatelliteView.SAT_SIZE], 0)
        pygame.draw.line(self.screen, SatelliteView.WHITE,
                         (SatelliteView.PLANET_CENTER[0] + (
                                     SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.sin(
                             2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                          SatelliteView.PLANET_CENTER[1] + (
                                      SatelliteView.PLANET_SIZE / 2 + SatelliteView.ORBIT_DISTANCE) * math.cos(
                              2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2)),
                         (SatelliteView.PLANET_CENTER[0] + (SatelliteView.PLANET_SIZE / 2) * math.sin(2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2),
                          SatelliteView.PLANET_CENTER[1] + (SatelliteView.PLANET_SIZE / 2) * math.cos(2*math.pi*sim.pos/SatelliteSim.CIRCUNFERENCE + math.pi / 2))
                         )

        # draw images
        
        for index, image in enumerate(sim.images):
            pygame.draw.rect(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET + index * (self.image_width + self.space),
                                                                SatelliteView.OFFSET_H, self.image_width,
                                                                SatelliteView.IMAGE_SIZE])
            if image > 0:
                panelColor = SatelliteView.BLACK
                if sim.analysis[index] and sim.satellite_busy_time > 0 \
                        and sim.last_action_tuple[0] == SatelliteSim.ACTION_ANALYSE \
                        and sim.last_action_tuple[1] == sim.images[index]:
                    panelColor = [o + (p - o)*(sim.satellite_busy_time/self.sim.DURATION_ANALYSE) for p,o in zip(SatelliteView.ORANGE, SatelliteView.PURPLE)]
                elif sim.analysis[index]:
                    panelColor = SatelliteView.PURPLE
                else:
                    panelColor = SatelliteView.ORANGE
                pygame.draw.rect(self.screen, panelColor,
                             [SatelliteView.OFFSET + index * (self.image_width + self.space) + self.image_width * 0.1,
                              SatelliteView.OFFSET_H * 1.1, self.image_width * 0.8,
                              SatelliteView.IMAGE_SIZE * 0.8])
                self.screen.blit(self.text_digits[image-1], (
                SatelliteView.OFFSET + index * (self.image_width + self.space)+ self.image_width * 0.2,
                SatelliteView.OFFSET_H * 1.2))

        # draw satellite recovery time
        max_time = max(self.sim.DURATION_ANALYSE, self.sim.DURATION_DUMP, self.sim.DURATION_TAKE_IMAGE)
        pygame.draw.rect(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET, 2.2 * SatelliteView.IMAGE_SIZE,
                                                            SatelliteView.HUD_WIDTH,
                                                            SatelliteView.IMAGE_SIZE])
        barWidth = SatelliteView.HUD_WIDTH * sim.satellite_busy_time / max_time
        pygame.draw.rect(self.screen, SatelliteView.PURPLE, [SatelliteView.OFFSET + SatelliteView.IMAGE_SIZE * 0.1,
                                                             2.3 * SatelliteView.IMAGE_SIZE, barWidth,
                                                             SatelliteView.IMAGE_SIZE * 0.8])
        # Draw action taken
        OFFSET_y = SatelliteView.PLANET_CENTER[1] -  SatelliteView.IMAGE_SIZE * 2.3 
        for index, act in enumerate(sim.ACTION_NAMES):
            x_a = SatelliteView.OFFSET 
            y_a = OFFSET_y + index * SatelliteView.IMAGE_SIZE * 1.2
            w_a = h_a = SatelliteView.IMAGE_SIZE
            if act == sim.ACTION_NAMES[sim.Taking_action]:
                c = SatelliteView.ORANGE
            else:
                c = SatelliteView.WHITE
            pygame.draw.rect(self.screen, c, [x_a, y_a,
                                              w_a, h_a])
            name = self.font.render(act, True, SatelliteView.WHITE)
            self.screen.blit(name, (x_a-w_a*.5, y_a+h_a*.4))

        # # draw single goals
        # if len(sim.goalRef.single_goals) >= 0:
        #     for index, target in enumerate(sim.goalRef.single_goals):
        #         pygame.draw.rect(self.screen, SatelliteView.ORANGE,
        #                      [SatelliteView.OFFSET + index * (SatelliteView.GOAL_SIZE * 1.1) + SatelliteView.GOAL_SIZE * 0.1,
        #                       SatelliteView.HEIGHT - SatelliteView.GOAL_SIZE * 5.1,
        #                       SatelliteView.GOAL_SIZE * 0.8, SatelliteView.GOAL_SIZE * 0.8])
        #         self.screen.blit(self.text_digits[target], (
        #                     SatelliteView.OFFSET + index * (SatelliteView.GOAL_SIZE * 1.1) + SatelliteView.GOAL_SIZE * 0.2,
        #                     SatelliteView.HEIGHT - SatelliteView.GOAL_SIZE * 5.0))

        # # draw campaigns
        # orbit = math.floor(sim.sim_time / self.sim.PERIOD)
        # if len(sim.goalRef.campaigns) >= 0:
        #     for index, c in enumerate(sim.goalRef.campaigns):
        #         pygame.draw.rect(self.screen, SatelliteView.WHITE,
        #                          [SatelliteView.OFFSET + SatelliteView.GOAL_SIZE * 0.1,
        #                           SatelliteView.HEIGHT - (1.2*SatelliteView.GOAL_SIZE) * (3.4 - index),
        #                           len(c.targets) * (1.1*SatelliteView.GOAL_SIZE), SatelliteView.GOAL_SIZE])
        #         for ti, t in enumerate(c.targets):
        #             color = SatelliteView.ORANGE
        #             if not c.campaign_started or t[1]+c.campaign_start_orbit > orbit:
        #                 color = SatelliteView.BLACK
        #             if c.targets_completed[ti]:
        #                 color = SatelliteView.PURPLE
        #             pygame.draw.rect(self.screen, color,
        #                          [SatelliteView.OFFSET + ti * (SatelliteView.GOAL_SIZE * 1.1) + SatelliteView.GOAL_SIZE * 0.2,
        #                           SatelliteView.HEIGHT - (1.2*SatelliteView.GOAL_SIZE) * (3.3-index),
        #                           SatelliteView.GOAL_SIZE * 0.8, SatelliteView.GOAL_SIZE * 0.8])
        #             self.screen.blit(self.text_digits[t[0]], (
        #                         SatelliteView.OFFSET + ti * (SatelliteView.GOAL_SIZE * 1.1) + SatelliteView.GOAL_SIZE * 0.3,
        #                         SatelliteView.HEIGHT - (1.2*SatelliteView.GOAL_SIZE) * (3.2-index)))
        pygame.draw.line(self.screen, SatelliteView.WHITE, [0, SatelliteView.DIV_AGENT],[SatelliteView.WIDTH, SatelliteView.DIV_AGENT], width=2)
        
    ############
    ## Reward ##
    ############
    def draw_reward(self, reward):
        lamba_w_r = 0.3
        lamba_h_r = (1-lamba_w_r)/2
        x_r = SatelliteView.OFFSET + SatelliteView.GOAL_SIZE * 0.1 + SatelliteView.HUD_WIDTH*lamba_h_r
        y_r = SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE * 0.
        w_r = SatelliteView.HUD_WIDTH*lamba_w_r
        h_r = SatelliteView.GOAL_SIZE
        pygame.draw.rect(self.screen, SatelliteView.WHITE, [x_r, y_r,
                                                            w_r, h_r])
        reward_txt = self.font.render("Reward = "+str(round(reward,2)), True, SatelliteView.BLACK)
        self.screen.blit(reward_txt, [x_r+.1*w_r, y_r+.25*h_r,
                                        .5*w_r, .5*h_r])

    ##################
    ## Draw Arbiter ##
    ##################
    def draw_arbiter(self, Voices, obs):
        self.draw_legend()

        n_voices = len(Voices)

        ### Draw timeline 
        line_w = SatelliteView.WIDTH - SatelliteView.OFFSET
        line_y = SatelliteView.DIV_AGENT + (SatelliteView.HEIGHT - SatelliteView.DIV_AGENT) * 0.8

        # Horizontal line
        pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y],
                            [SatelliteView.OFFSET/2 + line_w, line_y], width=2)
        
        # Vertical line
        pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y - SatelliteView.GOAL_SIZE*(n_voices+1)],
                            [SatelliteView.OFFSET/2, line_y], width=2)
        
        for i,v in enumerate(Voices):
            y = line_y - SatelliteView.GOAL_SIZE*(n_voices - i)
            # Voice name
            voice_txt = self.font.render(v.name, True, SatelliteView.WHITE)
            self.screen.blit(voice_txt, [SatelliteView.OFFSET/4 - SatelliteView.GOAL_SIZE*0.5, y + SatelliteView.GOAL_SIZE*0.5])
            
            # Voice plan
            self.draw_single_plan(v.full_plan, obs, line_w, y)

    #############################
    ## Draw Percentage of Goal ##
    #############################
    def draw_percentage_of_goals_completed(self, goals_completed, goals_total, planner_name, n_p, tot_p):
        # Draw percentage of goals completed
        percent_txt = self.font.render(planner_name + ": " + str(round(goals_completed/goals_total*100,2)) + "%", True, SatelliteView.WHITE)
        self.screen.blit(percent_txt, [SatelliteView.OFFSET/2 + (SatelliteView.OFFSET/2 + SatelliteView.HUD_WIDTH) * (n_p/tot_p), SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE*2])

    #############################
    ## Draw Replanning Signal  ##
    #############################
    def draw_Replanning_signal(self, PLanner_name:str):
        Signal = self.font.render(PLanner_name, True, SatelliteView.RED)
        self.screen.blit(Signal, [SatelliteView.OFFSET/2, SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE*0.5])

    ##################
    ## Draw Planner ##
    ##################
    def draw_planner(self, plan, obs, target_dump):
        
        self.draw_legend()
        # Draw timeline 
        line_w = SatelliteView.WIDTH - SatelliteView.OFFSET
        line_y = SatelliteView.DIV_AGENT + (SatelliteView.HEIGHT - SatelliteView.DIV_AGENT) * 0.6
        pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y],
                            [SatelliteView.OFFSET/2 + line_w, line_y], width=2)
        pygame.draw.line(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, line_y - SatelliteView.GOAL_SIZE*3],
                            [SatelliteView.OFFSET/2, line_y], width=2)
        # Draw plan
        self.draw_single_plan(plan, obs, line_w, line_y) 

        # Draw Dump images
        st_y = SatelliteView.DIV_AGENT + (SatelliteView.HEIGHT - SatelliteView.DIV_AGENT) * 0.7
        pygame.draw.rect(self.screen, SatelliteView.WHITE, [SatelliteView.OFFSET/2, st_y, line_w, SatelliteView.GOAL_SIZE*2])
        Goals = 'Image Dumped = '
        for k,v in target_dump.items():
            Goals += str(k)+': '+str(v)+' | '
        font_Goals = pygame.font.SysFont(None, int(SatelliteView.IMAGE_SIZE))
        Goals_txt = font_Goals.render(Goals, True, SatelliteView.BLACK, )
        self.screen.blit(Goals_txt, [SatelliteView.OFFSET/2, st_y+SatelliteView.GOAL_SIZE*0.5,
                                    .5*line_w, .5*SatelliteView.GOAL_SIZE])
    ##################
    ## Helpers     ##
    ##################
    def draw_pos(self, obs):
        current_pos = obs['Pos'][0]+ 360*obs['Orbit'][0]
        lamba_w_r = 0.3
        lamba_h_r = (1-lamba_w_r)/2
        x_r = SatelliteView.OFFSET + SatelliteView.IMAGE_SIZE * 0.1 
        y_r = 3.5 * SatelliteView.IMAGE_SIZE
        w_r = SatelliteView.HUD_WIDTH*lamba_w_r
        h_r = SatelliteView.GOAL_SIZE
        arbiter_txt = self.font.render("Orbit = "+str(obs['Orbit'][0]), True, SatelliteView.ORANGE)
        self.screen.blit(arbiter_txt, [x_r, y_r,
                                        .5*w_r, .5*h_r])
                                    
    
    def draw_legend(self):
        #* Draw legend Take image (orange), Analyze (orange-purple), and Dump (purple)
        lamba_w_r = 1.0
        lamba_h_r = (1-lamba_w_r)/2
        x_r = SatelliteView.OFFSET + SatelliteView.GOAL_SIZE * 0.1 + SatelliteView.HUD_WIDTH*lamba_h_r
        y_r = SatelliteView.DIV_AGENT + SatelliteView.GOAL_SIZE * 0.
        w_r = SatelliteView.HUD_WIDTH*lamba_w_r
        h_r = SatelliteView.GOAL_SIZE
        # legend rectangle
        pygame.draw.rect(self.screen, SatelliteView.WHITE, [x_r, y_r,
                                                            w_r, h_r])
        # legend text
        x_leg = copy(x_r)
        pad = h_r*0.2
        sq_l = h_r - 2*pad
        pygame.draw.rect(self.screen, SatelliteView.ORANGE, [x_leg+pad, y_r+pad,
                                                             sq_l, sq_l])
        x_leg += 2*pad + sq_l
        TP_txt = self.font.render("Take picture (TP)", True, SatelliteView.BLACK)
        self.screen.blit(TP_txt, [x_leg, y_r+pad,
                                  .3*w_r, .5*h_r])
        x_leg += .25*w_r
        pygame.draw.rect(self.screen, SatelliteView.PURPLE_ORANGE, [x_leg+pad, y_r+pad,
                                                                    sq_l, sq_l])
        x_leg += 2*pad + sq_l
        AP_txt = self.font.render("Analyze picture (AN)", True, SatelliteView.BLACK)
        self.screen.blit(AP_txt, [x_leg, y_r+pad,
                                    .3*w_r, .5*h_r])
        x_leg += .3*w_r
        pygame.draw.rect(self.screen, SatelliteView.PURPLE, [x_leg+pad, y_r+pad,
                                                                sq_l, sq_l])    
        x_leg += 2*pad + sq_l
        DP_txt = self.font.render("Dump picture (DP)", True, SatelliteView.BLACK)
        self.screen.blit(DP_txt, [x_leg, y_r+pad,
                                    .3*w_r, .5*h_r])

    def draw_single_plan(self, plan, obs, line_w, line_y):
        # Draw plan
        current_pos = obs['Pos'][0]+ 360*obs['Orbit'][0]
        for i in range(len(plan)):
            ac = plan[i][1]
            if ac == SatelliteSim.ACTION_TAKE_IMAGE:
                act_dur = self.sim.DURATION_TAKE_IMAGE*self.sim.velocity
                color = SatelliteView.ORANGE
            elif ac == SatelliteSim.ACTION_ANALYSE:
                act_dur = self.sim.DURATION_ANALYSE*self.sim.velocity
                color = SatelliteView.PURPLE_ORANGE
            elif ac == SatelliteSim.ACTION_DUMP:
                act_dur = self.sim.DURATION_DUMP*self.sim.velocity
                color = SatelliteView.PURPLE
            else:
                raise Exception("Unknown action")
            action_begin = plan[i][0] 
            action_end = action_begin + act_dur
            if current_pos <= action_begin < current_pos + 360 or current_pos <= action_end < current_pos + 360:
                if action_begin < current_pos:
                    action_begin = current_pos
                if action_end > current_pos + 360:
                    action_end = current_pos + 360
                time_width = (action_end - action_begin) / 360 * line_w 
                x = SatelliteView.OFFSET/2 + (action_begin - current_pos) / 360 * line_w
                pygame.draw.rect(self.screen, color, [x, line_y , time_width, SatelliteView.GOAL_SIZE])

    def quit(self):
        pygame.quit()
