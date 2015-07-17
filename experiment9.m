function experiment9(trials)

    global w rect A1 B1 A2 B2 A3 B3 sub pay
    
    rng shuffle;
    
    Screen('Preference', 'SkipSyncTests', 0);
    FlushEvents;
    HideCursor;
    PsychDefaultSetup(1);
    
         
    % Check to prevent overwriting previous data 
%      A= exist([results_file_name '.mat'], 'file');
%      if A
%         writeover=input('Subject + Session number already exists, do you want to overwrite? 1=yes, 0=no ');
%      else
%         writeover=1;
%      end
%  
%  switch writeover
%     case 0
%         disp(' ')
%         disp('Try again then')
%     case 1
%         
    
    
    % Open the screen
    doublebuffer=1; %????
    screens = Screen('Screens'); %count the screen
    whichScreen = max(screens); %select the screen
    [w, rect] = Screen('OpenWindow', whichScreen, 0,[], 32, ...
        doublebuffer+1,[],[],kPsychNeedFastBackingStore); %??? 
    
    width = rect(3);
    height = rect(4);
    
    
    
    r = [0,0,400,290];
    
    rc = [0,0,420,310]; %choice rectangle
    
    point1 = CenterRectOnPoint(r, rect(3)*0.1667, rect(4)*0.8333); %drawingpoints on screen
    point2 = CenterRectOnPoint(r, rect(3)*0.5, rect(4)*0.8333); %drawingpoints on screen
    point3 = CenterRectOnPoint(r, rect(3)*0.8333, rect(4)*0.8333); %drawingpoints on screen
    point4 = CenterRectOnPoint(r, rect(3)*0.1667, rect(4)*0.5); %drawingpoints on screen
    point5 = CenterRectOnPoint(r, rect(3)*0.5, rect(4)*0.5); %drawingpoints on screen
    point6 = CenterRectOnPoint(r, rect(3)*0.8333, rect(4)*0.5); %drawingpoints on screen
    point7 = CenterRectOnPoint(r, rect(3)*0.1667, rect(4)*0.1667); %drawingpoints on screen
    point8 = CenterRectOnPoint(r, rect(3)*0.5, rect(4)*0.1667); %drawingpoints on screen
    point9 = CenterRectOnPoint(r, rect(3)*0.833, rect(4)*0.1667); %drawingpoints on screen
    
    
   
    
    %images
    
    A1 = imread('3.jpg','jpg');
     
    % Keyboard
    KbName('UnifyKeyNames');
    K1 = KbName('1');
    K2 = KbName('2');
    K3 = KbName('3');
    K4 = KbName('4');
    K5 = KbName('5');
    K6 = KbName('6');
    K7 = KbName('7');
    K8 = KbName('8');
    K9 = KbName('9');
    
        
    
        
    % Variables
        
    gray = 150;
    black = 0; 
    white = 255;
    brown = [102,51,0];
         
    
    action = NaN(trials,3);
    choice_on_time = NaN(trials,1);
    choice_off_time = NaN(trials,1);
    
    payoff_prob = [0.1:0.1:0.9];
    
     % Waiting screen
    Screen('FillRect', w, gray);
    Screen('TextSize', w, 30);
    
    DrawFormattedText(w, 'Press any key to begin the experiment.', 'center', 'center', black);
    
    Screen(w, 'Flip');
    KbWait;
   


    [w, rect] = Screen('OpenWindow', whichScreen, 0,[], 32, ...
        doublebuffer+1,[],[],kPsychNeedFastBackingStore);

    
    % Trial loop
       
    t0 = GetSecs;
    
    for trial = 1:trials  
        
                      
        % Draw stimuli
        
             
        pic1 = Screen('MakeTexture', w, A1);
        pic2 = Screen('MakeTexture', w, A1);
        pic3 = Screen('MakeTexture', w, A1);
        pic4 = Screen('MakeTexture', w, A1);
        pic5 = Screen('MakeTexture', w, A1);
        pic6 = Screen('MakeTexture', w, A1);
        pic7 = Screen('MakeTexture', w, A1);
        pic8 = Screen('MakeTexture', w, A1);
        pic9 = Screen('MakeTexture', w, A1);
        
        
       Screen('DrawTexture', w, pic1, [], point1);
       Screen('DrawTexture', w, pic2, [], point2);
       Screen('DrawTexture', w, pic3, [], point3);
       Screen('DrawTexture', w, pic4, [], point4);
       Screen('DrawTexture', w, pic5, [], point5);
       Screen('DrawTexture', w, pic6, [], point6);
       Screen('DrawTexture', w, pic7, [], point7);
       Screen('DrawTexture', w, pic8, [], point8);
       Screen('DrawTexture', w, pic9, [], point9);
       
        
        
        Screen('Flip', w);

              
        choice_on_time(trial,1) = GetSecs - t0;
%         evt = Eyelink('newestfloatsample');
%         et_on_time(trial,1) = evt.time - et0;
        
        key_is_down = 0;
        FlushEvents;
        [key_is_down, secs, key_code] = KbCheck;
        
        while key_code(L) == 0 && key_code(R) == 0
                [key_is_down, secs, key_code] = KbCheck;
        end
        
        choice_off_time(trial,1) = GetSecs - t0;
%         evt = Eyelink('newestfloatsample');
%         et_off_time(trial,1) = evt.time - et0;
        down_key = find(key_code,1);
        
        if (down_key==L && type == 0) || (down_key==R && type == 1)
            action(trial,1)=0;
        elseif (down_key==L && type == 1) || (down_key==R && type == 0)
            action(trial,1)=1;
        end
%         
%         if down_key == L 
%             Screen('DrawTexture', w, picL, [], Lpoint);
%             Screen('DrawTexture', w, picR, [], Rpoint);
%             Screen('FrameRect',w,white,Lchoice);
%             if bars == 1 
%               [bLind, pLind, bRind, pRind] = drawind(type,a(trial,1));
%               Screen('FillRect', w, blue, bLind);
%               Screen('FillRect', w, purple, pLind);
%               Screen('FillRect', w, blue, bRind);
%               Screen('FillRect', w, purple, pRind);
%             end
%            Screen('Flip',w);
%            
%        elseif down_key == R
%            
%            Screen('DrawTexture', w, picL, [], Lpoint);
%            Screen('DrawTexture', w, picR, [], Rpoint);
%            Screen('FrameRect',w,white,Rchoice);
%             if bars == 1 
%               [bLind, pLind, bRind, pRind] = drawind(type,a(trial,1));
%               Screen('FillRect', w, blue, bLind);
%               Screen('FillRect', w, purple, pLind);
%               Screen('FillRect', w, blue, bRind);
%               Screen('FillRect', w, purple, pRind);
%             end
%            Screen('Flip',w);
%         end
%         
%         
    
    end
    
    RestrictKeysForKbCheck([]);
    
    %saving data
    two_stage_task_data = struct;
    two_stage_task_data.subject = sub; %*ones(trials,1);
    two_stage_task_data.position = position;
    two_stage_task_data.action = action;
    two_stage_task_data.on = choice_on_time;
    two_stage_task_data.off = choice_off_time;
%     two_stage_task_data.eton = et_on_time;
%     two_stage_task_data.etoff = et_off_time;
    two_stage_task_data.rt = choice_off_time-choice_on_time;
    two_stage_task_data.transition_prob = a;
    two_stage_task_data.payoff_prob = payoff_prob;
    two_stage_task_data.payoff = payoff;
    two_stage_task_data.state = state;
%      two_stage_task_data.et0 = et0;
    save(results_file_name, 'two_stage_task_data', '-v6');
    
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%turn off eyetracking
%         Eyelink('stoprecording');
            
        
%     Eyelink('closefile');
%     status = Eyelink('receivefile',etfilename);
%     Eyelink('shutdown');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Payoff screen
    
    payoff_sum = sum(nansum(payoff)); 
    Screen(w, 'FillRect', gray);
    Screen('TextSize', w, 30);
    DrawFormattedText(w, 'This part is complete. Your payoff in points in all rounds:', 'center', 'center', black);
    DrawFormattedText(w,  num2str(payoff_sum), 'center', rect(4)*0.6, black);
    DrawFormattedText(w, 'Press any key to quit', 'center', rect(4)*0.8, black);
    Screen(w, 'Flip');
    WaitSecs(1);
    KbWait;
    
    if practice == 0
       pay = pay + payoff_sum/20;
    end
    
    Screen('Close',w);
    Screen('CloseAll');
    FlushEvents;
   % jheapcl;
    
 end
 
