from typing import Dict
from gym import spaces, Env
from Agents.AgentPDDL import PDDLAgent
from Utils.GridWorld import Gridworld
from copy import copy
import numpy as np
import random
from Reward_functions import Reward_function

class NonDeterministicActionOutcomes_Env(Env):
    metadata = {'render.modes': ['humsan']}               
        
    def __init__(self, n_plan_states = 10, verbose=False, debug=False, render_type = 'PYGAME',  Reward_type='Eval', env_type='Train'):

        super().__init__() 
        '''Set Parameters '''
        self.debug = debug  # restart or not once done
        self.verbose = verbose # to show the environment or not
        self.problem_type = 'NDOA'
        self.render_opt = False

        ''' initialize world '''
        self.gridworld = Gridworld(problem_type='NDOA', debug=debug, verbose=verbose, render_type =render_type)
        self.num_steps = 0
        

        '''Define actions'''
        self.actions = [0, 1, 2, 3]
        self.num_action = len(self.actions)
        self.action_dict = {'North': 0, 'South': 1, 'West': 2, 'East': 3} 
        self.action_list = ['North', 'South', 'West', 'East']
        self.action_pos_dict = {0:[0,-1], 1:[0,1], 2:[-1, 0], 3:[1,0]}      

        '''Define action and action space'''
        self.action_space = spaces.Discrete(len(self.actions))
        self.action_shape = len(self.actions)

        ''' set observation space '''
        self.obs_shape = [self.gridworld.grid_size, self.gridworld.grid_size]  # observation space shape
        self.obs_max = 4
        self.observation_space = spaces.Box(low=0, high=self.obs_max, shape=self.obs_shape, dtype=np.float32)
        self.Reward_type = Reward_type


        ''' Initialize Planner'''
        if env_type == 'Train':
            env_type += problem_type
        plan_name = env_type+"_"+Reward_type+'_np'+str(n_plan_states)
        self.PDDL = PDDLAgent(plan_name, write_output=verbose, debug=debug)
        self.plan_pointer = 0
        self.n_plan_states=n_plan_states


        ''' set observation space '''
        state_shape = (self.gridworld.grid_size, self.gridworld.grid_size)
        pos_shape = (2,)
        plan_state_shape = (n_plan_states, *pos_shape)
        
        self.observation_space = spaces.Dict({'State': spaces.Box(low=0, high=4, shape=state_shape),
                                            'Plan': spaces.Box(low=0, high=self.gridworld.grid_size, shape=plan_state_shape)})     

        ''' set Reward type'''
        self._Reward = Reward_function[Reward_type]

    def reset(self):
        '''Initialize parameters'''
        self.tot_reward = 0
        ''' Initialize Agent Map'''
        self.num_steps = 0
        self.Map = self.gridworld.Creat_New_map(problem_type = self.problem_type)
        self.pos = self.gridworld.start_pos
        self.start_pos = self.gridworld.start_pos
        self.goal_pos = self.gridworld.goal_pos
        self.path = [np.array(self.pos.copy())]

        '''Initialize and create Plan Map'''
        self.Map_plan = self.gridworld.Spawn_Obstacles(self.Map.copy(), for_plan=True)
        self.replan(self.Map_plan)

        observation = {'State': copy(self.Map), 'Plan': self.plan_states}
        # For the reward function
        self.number_of_achieved_plan_states = 0
        self.plan_state_achieved = []
        return observation

    def step(self, action):
        self.num_steps +=1
        done, valid_action = self._update_pos(action)
        self.valid_action = valid_action
        obs = copy(self.Map)
        self.done = done
        self._in_full_plan(self.pos)
        if self.check_if_in_plan_state(obs):
            self.number_of_achieved_plan_states += 1
            
        reward = self._Reward(self, obs, valid_action)
        self._get_plan_states(obs) 
        observation = {'State': obs, 'Plan': self.plan_states}   
        self.tot_reward += reward     
        return observation, reward, done, {}

    def _update_pos(self, action):
        obs = copy(self.Map)
        old_pos = copy(self.pos)
        RandV = random.random()
        done = False
        if (self.problem_type == 'Train_env' or self.problem_type == 'Test_1') and (RandV  < .1):
            pos = []
            obs[old_pos[0]][old_pos[1]] = 0
            for i in range(2):
                maxposC = min(self.gridworld.grid_size-2,old_pos[i]+2)
                minposC = max(1,old_pos[i]-2)
                pos.append(random.randint(minposC, maxposC))
            pos = np.array(pos)
            self.current_action = 'Random'

        else:
            # Take action
            action = int(action)
            self.current_action = self.action_list[action]
            dpos = self.action_pos_dict[action]
            pos = list(np.array(self.pos) + np.array(dpos)) 

        
        # if action is valid then update state
        valid_action = self._check_if_possible(pos)
        if valid_action:
            obs[self.pos[0]][self.pos[1]] = 0 
            obs[pos[0]][pos[1]] = 1
            obs[self.pos[0]][self.pos[1]] = 0 
            obs[pos[0]][pos[1]] = 1
            self.pos = pos
            self.path.append(np.array(pos.copy()))
        else:
            return True, valid_action
        if (list(pos)==self.goal_pos):
            return True, valid_action
        
        self.path.append(np.array(pos))
        self.Map = copy(obs) 
        if self.num_steps >100:
            done = True
            valid_action = False
        return done, valid_action

    def _check_if_possible(self, pos):
        x, y = pos
        if self.Map[x][y] > 2 or x<0 or y<0:
            return False
        else:
            return True

    ########################################### Planning funtions ###########################################
    def replan(self, obs):
        self.plan_pointer = 0
        self._get_plan(obs)
        self._obtain_achievable_plan_state()
        self._get_plan_states(obs) 

    def _get_plan(self, obs):
        self.PDDL.generatePlan(self, obs)
        full_plan = []
        self.plan_states = []
        plan_len = len(self.PDDL.plan)
        for i in range(plan_len):
            action, plan_obs, n_plan_obs = self.PDDL.getNextStep()
            full_plan.append(plan_obs)
        if full_plan == []:
            # if failed to Create a plan restart the enviroment
            obs = self.reset()
        else:
            if self.problem_type == 'Test_3':
                index = random.randint(1,len(full_plan)-2)
                full_plan.pop(index)
            if self.problem_type == 'Train_env':
                Rand_pos = random.random()
                if Rand_pos<.1:
                    index = random.randint(1,len(full_plan)-1)
                    full_plan.pop(index)
            full_plan += [n_plan_obs,n_plan_obs]
            self.full_plan = full_plan 
            self.remaining_plan = self.full_plan.copy()
        

    def _get_plan_states(self, state):
        state_match = False
        state_pos = np.array(np.where(state==1))
        n_of_states = 0
        plan = []
        i = 0
        rm_plan_len = len(self.remaining_plan)
        state_pos = np.reshape(state_pos, (2,))
        for i in range(rm_plan_len-1):
            plan_pos, next_plan_pos = self.remaining_plan[i:i+2]
            next_plan_state = np.array(next_plan_pos)

            if n_of_states<self.n_plan_states:
                # change variable once we reach the first match state
                if (state_pos == plan_pos).all():
                    state_match = True
                    remaining_plan = self.remaining_plan[i:]
                    self.full_plan_marker = copy(plan_pos)
                # from first match state until number of plan states
                if state_match:
                    n_of_states += 1
                    plan.append(next_plan_state)
            i+=1
        
        # if current state does not match any of the state in the plan do not chage plan_states
        if not state_match:
            return
        else:
            self.remaining_plan = remaining_plan
            if len(plan)<self.n_plan_states and not plan == []:
                last_state = plan[-1]
                for i in range(len(plan), self.n_plan_states):
                    plan.append(last_state)
            self.plan_states = copy(np.array(plan))
                
    def check_if_in_plan_state(self,state):
        state_pos = np.array(np.where(state==1))
        for plan_s in self.plan_states:
            pos_plan = np.array(plan_s)
            state_pos = np.reshape(state_pos, (2,))
            if (state_pos == pos_plan).all():
                return True
        else:
            return False

    def _in_full_plan(self,state):
        state = list(state)
        if state in self.full_plan and not state in self.plan_state_achieved:
            self.plan_state_achieved.append(state)
        
    def _obtain_achievable_plan_state(self):
        full_plan = self.full_plan.copy()
        self.full_plan_achievable = []
        O_loc = np.where(self.Map.copy()==4)
        obstc_loc = [[x, y] for x, y in zip(O_loc[0], O_loc[1])]
        for plan_state in full_plan:
            if not plan_state in obstc_loc:
                self.full_plan_achievable.append(plan_state)
        
    ###################################### Render #################################################################
    def render(self):
        print("    (",self.current_action,")  ")
        path = [np.array(ps) for ps in self.full_plan]
        path_done = self.path.copy()
        Map = self.Map.copy()
        print('Reward = ', self.tot_reward)
        print('Step = ', self.num_steps)
        print('Pos = ', self.pos)
        print('Plan = ', self.plan_states)
        self.gridworld.full_Render(Map, path=path, path_done=path_done, path_width=3)
        
    def path_from_state(self):
        plan = []
        for state in self.full_plan:
            pre_pos = np.where(state[1] == 1)
            pos = np.array([pre_pos[0][0], pre_pos[1][0]])
            plan.append(pos)
        return plan