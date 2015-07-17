function learning_experiment_tracking(trials, bars, practice)

    global w rect A1 B1 A2 B2 A3 B3 sub pay
    
    rng shuffle;
    
    Screen('Preference', 'SkipSyncTests', 0);
    FlushEvents;
    HideCursor;
    PsychDefaultSetup(1);
    
         
    % Check to prevent overwriting previous data 
     A= exist([results_file_name '.mat'], 'file');
     if A
        writeover=input('Subject + Session number already exists, do you want to overwrite? 1=yes, 0=no ');
     else
        writeover=1;
     end
 
 switch writeover
    case 0
        disp(' ')
        disp('Try again then')
    case 1
        
    
    
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
    
    A1 = imread('3.png','png');
     
    % Keyboard
    KbName('UnifyKeyNames');
    L = KbName('LeftArrow');
    R = KbName('RightArrow');
        
    
        
    % Variables
        
    gray = 150;
    black = 0; 
    white = 255;
    brown = [102,51,0];
         
    
    action = NaN(trials,3);
    choice_on_time = NaN(trials,1);
    choice_off_time = NaN(trials,1);
    
    payoff_prob = [0.1:0.1:0.9];
    
 
    %status = Eyelink('initialize');
    
    % Waiting screen
    Screen('FillRect', w, gray);
    Screen('TextSize', w, 30);
    
    if practice == 1
      DrawFormattedText(w, 'Press any key to begin practice', 'center', 'center', black);
    else
        DrawFormattedText(w, 'Press any key to begin the experiment.', 'center', 'center', black);
    end
    Screen(w, 'Flip');
    KbWait;
    
    %TRACKING
    
    
%      el = EyelinkInitDefaults(w);
%       EyelinkInit(0);
    Screen('FillRect', w, gray);
    Screen('Flip', w);



    %Eyelink('Command', 'link_sample_data = LEFT,RIGHT,GAZE,AREA');
%     if practice == 1
%     etfilename = ['edata' num2str(sub)  'p.edf'];
%     else
%         etfilename = ['edata' num2str(sub) num2str(bars) '.edf'];
%     end
%     et_on_time = NaN(trials,1);
%     et_off_time = NaN(trials,1);
% 
%     createFile=1;
% 
%      if createFile
%         status=Eyelink('OpenFile',etfilename);
%         if status~=0
%             error('openfile error, status: ',status)
%         end
%      end
% 
%     if practice == 0
%       EyelinkDoTrackerSetup(el);
%     end
    %EyelinkDoDriftCorrection(el);

    %Screen('CloseAll');



    Screen('Preference', 'SkipSyncTests', 0);
    HideCursor;

    WaitSecs(0.1);

    [w, rect] = Screen('OpenWindow', whichScreen, 0,[], 32, ...
        doublebuffer+1,[],[],kPsychNeedFastBackingStore);

%     Eyelink('startrecording');
%     evt = Eyelink('newestfloatsample');
%     et0 = evt.time;
    
    
    % Trial loop
       
    t0 = GetSecs;
    
    for trial = 1:trials  
        
        % First stage
        
        % short break
        
        if practice ~= 1
        
            if trial == (trials/3) + 1 || trial == (2*trials/3) + 1
                Screen('FillRect', w, gray);
                Screen('TextSize', w, 30);
                DrawFormattedText(w, 'You can take a short break. Press left or right to continue', 'center', 'center', black);
                Screen(w, 'Flip');
                KbWait;                       
            end
        end
                
        % Fixation screen
        Screen(w, 'FillRect', black);
        Screen('TextSize', w, 60);
        DrawFormattedText(w, '+', 'center', 'center', white);
        Screen(w, 'Flip');
        
%         if track == 1
%         %the following section gets eyeposition data from the eye
%             %tracker and makes the subject stare at the cross for 2 s
%             timeonfix=0;
%             fixstart=GetSecs;
%             while timeonfix<1
%                 evt = Eyelink('newestfloatsample');
%                 if evt.gx(1)<0.4*rect(3) || evt.gx(1)>0.6*rect(3) || evt.gy(1)<0.35*rect(4) || evt.gy(1)>0.65*rect(4)
%                     fixstart=GetSecs;
%                 end
%                 timeonfix=GetSecs-fixstart;
%             end
%         else
        WaitSecs(1); 
%         end
        
        % Draw indicators
        
        Screen(w, 'FillRect', black); 
        
        
        position(trial,1) = round(rand); %randomizing images positions
        
        type = position(trial,1);
        
        if bars == 1 
            [bLind, pLind, bRind, pRind] = drawind(type,a(trial,1));

            Screen('FillRect', w, blue, bLind);
            Screen('FillRect', w, purple, pLind);
            Screen('FillRect', w, blue, bRind);
            Screen('FillRect', w, purple, pRind);
        end
            
        % Draw stimuli
        
        
        
        
                 
        picL = drawimage(type,1);
        picR = drawimage(1-type,1);
        
        Screen('DrawTexture', w, picL, [], Lpoint);
        Screen('DrawTexture', w, picR, [], Rpoint);
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
        
        if down_key == L 
            Screen('DrawTexture', w, picL, [], Lpoint);
            Screen('DrawTexture', w, picR, [], Rpoint);
            Screen('FrameRect',w,white,Lchoice);
            if bars == 1 
              [bLind, pLind, bRind, pRind] = drawind(type,a(trial,1));
              Screen('FillRect', w, blue, bLind);
              Screen('FillRect', w, purple, pLind);
              Screen('FillRect', w, blue, bRind);
              Screen('FillRect', w, purple, pRind);
            end
           Screen('Flip',w);
           
       elseif down_key == R
           
           Screen('DrawTexture', w, picL, [], Lpoint);
           Screen('DrawTexture', w, picR, [], Rpoint);
           Screen('FrameRect',w,white,Rchoice);
            if bars == 1 
              [bLind, pLind, bRind, pRind] = drawind(type,a(trial,1));
              Screen('FillRect', w, blue, bLind);
              Screen('FillRect', w, purple, pLind);
              Screen('FillRect', w, blue, bRind);
              Screen('FillRect', w, purple, pRind);
            end
           Screen('Flip',w);
        end
        
        
        % second stage transition randomization
        
        r = rand;
        if action(trial,1) == 0
            if  r < a(trial,1)
                state(trial,1) = 2;
            else state(trial,1) = 3;
            end
        else 
            if  r > a(trial,1)
                state(trial,1) = 2;
            else state(trial,1) = 3;
            end
        end
        
        
        
        WaitSecs(1); 
        
        % state 2 (blue state) and 3 (purple state)
        
        

        if state(trial,1) == 2
            
            
            % Fixation screen
            Screen(w, 'FillRect', black);
            Screen('TextSize', w, 60);
            DrawFormattedText(w, '+', 'center', 'center', white);
            Screen(w, 'Flip');
%              if track == 1
%                 %the following section gets eyeposition data from the eye
%                     %tracker and makes the subject stare at the cross for 2 s
%                     timeonfix=0;
%                     fixstart=GetSecs;
%                     while timeonfix<1
%                         evt = Eyelink('newestfloatsample');
%                         if evt.gx(1)<0.4*rect(3) || evt.gx(1)>0.6*rect(3) || evt.gy(1)<0.35*rect(4) || evt.gy(1)>0.65*rect(4)
%                             fixstart=GetSecs;
%                         end
%                         timeonfix=GetSecs-fixstart;
%                     end
%                 else
                WaitSecs(1); 
%             end

            %choice screen
            Screen(w, 'FillRect', black); 

            position(trial,2) = round(rand); %randomizing images positions
            type = position(trial,2);
            

            picL = drawimage(type,2);
            picR = drawimage(1-type,2);

            
            Screen('DrawTexture', w, picL, [], Lpoint);
            Screen('DrawTexture', w, picR, [], Rpoint);
            Screen('Flip', w);

            choice_on_time(trial,2) = GetSecs - t0;
%             evt = Eyelink('newestfloatsample');
%             et_on_time(trial,2) = evt.time - et0;
        
            key_is_down = 0;
            FlushEvents;
            oldenablekeys = RestrictKeysForKbCheck([L,R]);

            while key_is_down==0
                    [key_is_down, secs, key_code] = KbCheck(-3);
            end

            choice_off_time(trial,2) = GetSecs - t0;
%             evt = Eyelink('newestfloatsample');
%             et_off_time(trial,2) = evt.time - et0;
            
            down_key = find(key_code,1);

            if (down_key==L && type == 0) || (down_key==R && type == 1)
                action(trial,2)=0;
                if rand <  payoff_prob(trial,1)
                    payoff(trial,1) = 1;
                else payoff(trial,1) = 0;
                end
            elseif (down_key==L && type == 1) || (down_key==R && type == 0)
                action(trial,2)=1;
                if rand <  payoff_prob(trial,2)
                    payoff(trial,1) = 1;
                else payoff(trial,1) = 0;
                end
            end
            
            if down_key == L 
                Screen('DrawTexture', w, picL, [], Lpoint);
                Screen('DrawTexture', w, picR, [], Rpoint);
                Screen('FrameRect',w,white,Lchoice);
                Screen('Flip',w);
               WaitSecs(0.5);
           elseif down_key == R
               Screen('DrawTexture', w, picL, [], Lpoint);
               Screen('DrawTexture', w, picR, [], Rpoint);
               Screen('FrameRect',w,white,Rchoice);
               Screen('Flip',w);
               WaitSecs(0.5);
           end
            
            
            % choice - payoff screen
            
            
            picD = drawimage(action(trial,2),2);
            
            Screen('DrawTexture', w, picD, [], Mpoint);
            if payoff(trial,1) == 1
                DrawFormattedText(w, '+1 point', 'center', rect(4)*0.8, white);
            else
                DrawFormattedText(w, '0 points', 'center', rect(4)*0.8, white);
            end
            
            Screen('Flip', w);
            WaitSecs(1);

            
        else 
            
             % Fixation screen
            Screen(w, 'FillRect', black);
            Screen('TextSize', w, 60);
            DrawFormattedText(w, '+', 'center', 'center', white);
            Screen(w, 'Flip');
%             if track == 1
%                 %the following section gets eyeposition data from the eye
%                     %tracker and makes the subject stare at the cross for 2 s
%                     timeonfix=0;
%                     fixstart=GetSecs;
%                     while timeonfix<1
%                         evt = Eyelink('newestfloatsample');
%                         if evt.gx(1)<0.4*rect(3) || evt.gx(1)>0.6*rect(3) || evt.gy(1)<0.35*rect(4) || evt.gy(1)>0.65*rect(4)
%                             fixstart=GetSecs;
%                         end
%                         timeonfix=GetSecs-fixstart;
%                     end
%                 else
                WaitSecs(1); 
%             end
            
            %choice screen
            
            Screen(w, 'FillRect', black); 

            position(trial,3) = round(rand); %randomizing images positions
            type = position(trial,3);
            

            

            picL = drawimage(type,3);
            picR = drawimage(1-type,3);

            
            Screen('DrawTexture', w, picL, [], Lpoint);
            Screen('DrawTexture', w, picR, [], Rpoint);
            Screen('Flip', w);

            choice_on_time(trial,3) = GetSecs - t0;
%             evt = Eyelink('newestfloatsample');
%             et_on_time(trial,3) = evt.time - et0;
            
            key_is_down = 0;
            FlushEvents;
            oldenablekeys = RestrictKeysForKbCheck([L,R]);

            while key_is_down==0
                    [key_is_down, secs, key_code] = KbCheck(-3);
            end

            choice_off_time(trial,3) = GetSecs - t0;
%             evt = Eyelink('newestfloatsample');
%             et_off_time(trial,3) = evt.time - et0;
            
            down_key = find(key_code,1);

            if (down_key==L && type == 0) || (down_key==R && type == 1)
                action(trial,3)=0;
                if rand <  payoff_prob(trial,3)
                    payoff(trial,2) = 1;
                else payoff(trial,2) = 0;
                end
            elseif (down_key==L && type == 1) || (down_key==R && type == 0)
                action(trial,3)=1;
                if rand <  payoff_prob(trial,4)
                    payoff(trial,2) = 1;
                else payoff(trial,2) = 0;
                end
            end
            
            if down_key == L
                Screen('DrawTexture', w, picL, [], Lpoint);
                Screen('DrawTexture', w, picR, [], Rpoint);
                Screen('FrameRect',w,white,Lchoice);
                Screen('Flip',w);
                WaitSecs(0.5);
           elseif down_key == R
               Screen('DrawTexture', w, picL, [], Lpoint);
               Screen('DrawTexture', w, picR, [], Rpoint);
               Screen('FrameRect',w,white,Rchoice);
               Screen('Flip',w);
               WaitSecs(0.5);
           end
            
            picD = drawimage(action(trial,3),3);
            Screen('DrawTexture', w, picD, [], Mpoint);
            if payoff(trial,2) == 1
                DrawFormattedText(w, '+1 point', 'center', rect(4)*0.8, white);
            else
                DrawFormattedText(w, '0 points', 'center', rect(4)*0.8, white);
            end
            
            Screen('Flip', w);
            WaitSecs(1);

            

        end
        
        for i = 1:4
            payoff_prob(trial+1,i) = payoff_prob(trial,i) + 0.025*randn;
            if (payoff_prob(trial+1,i) < 0.25) || (payoff_prob(trial+1,i) > 0.75)
                payoff_prob(trial+1,i) = payoff_prob(trial,i);
            end
        end
    
    
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
 
