function experiment9(sub, condition, trials)

    global w
    
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
    
    points = {point1 point2 point3 point4 point5 point6 point7 point8 point9};
    
    cpoint1 = CenterRectOnPoint(rc, rect(3)*0.1667, rect(4)*0.8333); %drawingpoints on screen
    cpoint2 = CenterRectOnPoint(rc, rect(3)*0.5, rect(4)*0.8333); %drawingpoints on screen
    cpoint3 = CenterRectOnPoint(rc, rect(3)*0.8333, rect(4)*0.8333); %drawingpoints on screen
    cpoint4 = CenterRectOnPoint(rc, rect(3)*0.1667, rect(4)*0.5); %drawingpoints on screen
    cpoint5 = CenterRectOnPoint(rc, rect(3)*0.5, rect(4)*0.5); %drawingpoints on screen
    cpoint6 = CenterRectOnPoint(rc, rect(3)*0.8333, rect(4)*0.5); %drawingpoints on screen
    cpoint7 = CenterRectOnPoint(rc, rect(3)*0.1667, rect(4)*0.1667); %drawingpoints on screen
    cpoint8 = CenterRectOnPoint(rc, rect(3)*0.5, rect(4)*0.1667); %drawingpoints on screen
    cpoint9 = CenterRectOnPoint(rc, rect(3)*0.833, rect(4)*0.1667); %drawingpoints on screen
    
   
    
    %images
    
    x = Shuffle(1:276);
    x = x(1:9);
    
    A1 = imread(strcat('fractal',num2str(x(1)),'.jpg'),'jpg');
    A2 = imread(strcat('fractal',num2str(x(2)),'.jpg'),'jpg');
    A3 = imread(strcat('fractal',num2str(x(3)),'.jpg'),'jpg');
    A4 = imread(strcat('fractal',num2str(x(4)),'.jpg'),'jpg');
    A5 = imread(strcat('fractal',num2str(x(5)),'.jpg'),'jpg');
    A6 = imread(strcat('fractal',num2str(x(6)),'.jpg'),'jpg');
    A7 = imread(strcat('fractal',num2str(x(7)),'.jpg'),'jpg');
    A8 = imread(strcat('fractal',num2str(x(8)),'.jpg'),'jpg');
    A9 = imread(strcat('fractal',num2str(x(9)),'.jpg'),'jpg');
    
    
    
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
    pay = 0;
    
    if condition == 1
        pay1 = 10;
        pay2 = 0;
    else 
        pay1 = 15;
        pay2 = -5;
    end
    
    
    action = NaN(trials,1);
    choice_on_time = NaN(trials,1);
    choice_off_time = NaN(trials,1);
    pay = NaN(trials,1);
    
    pp = [0.1:0.1:0.9];
    pp = Shuffle(pp);
    
    payoff_prob = NaN(trials,9);
    payoff_prob(1,1:9) = pp;
    
    positions = NaN(trials,9);
    for i = 1:trials
        pp = [1:1:9];
        pp = Shuffle(pp);
        positions(i,:) = pp;
    end
    
     % Waiting screen
    Screen('FillRect', w, black);
    Screen('TextSize', w, 55);
    
    DrawFormattedText(w, 'Press any key to begin the experiment.', 'center', 'center', white);
    
    Screen(w, 'Flip');
    KbWait;
   



    
    % Trial loop
       
    t0 = GetSecs;
    
    for trial = 1:trials  
        
                      
        % Draw stimuli
        
        Screen('FillRect', w, black);     
        pic1 = Screen('MakeTexture', w, A1);
        pic2 = Screen('MakeTexture', w, A2);
        pic3 = Screen('MakeTexture', w, A3);
        pic4 = Screen('MakeTexture', w, A4);
        pic5 = Screen('MakeTexture', w, A5);
        pic6 = Screen('MakeTexture', w, A6);
        pic7 = Screen('MakeTexture', w, A7);
        pic8 = Screen('MakeTexture', w, A8);
        pic9 = Screen('MakeTexture', w, A9);
        
        
       Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
       
%        Screen('DrawTexture', w, pic2, [], point2);
%        Screen('DrawTexture', w, pic3, [], point3);
%        Screen('DrawTexture', w, pic4, [], point4);
%        Screen('DrawTexture', w, pic5, [], point5);
%        Screen('DrawTexture', w, pic6, [], point6);
%        Screen('DrawTexture', w, pic7, [], point7);
%        Screen('DrawTexture', w, pic8, [], point8);
%        Screen('DrawTexture', w, pic9, [], point9);
       
        
        
        Screen('Flip', w);

              
        choice_on_time(trial,1) = GetSecs - t0;

        key_is_down = 0;
        FlushEvents;
        [key_is_down, secs, key_code] = KbCheck;
        
        while key_code(K1) == 0 && key_code(K2) == 0 && key_code(K3) == 0 && key_code(K4) == 0 && key_code(K5) == 0 && key_code(K6) == 0 && key_code(K7) == 0 && key_code(K8) == 0 && key_code(K9) == 0
                [key_is_down, secs, key_code] = KbCheck;
        end
        
        choice_off_time(trial,1) = GetSecs - t0;

        down_key = find(key_code,1);
        
        r = rand;
        
        if (down_key==K1)
            action(trial,1)=find(positions(trial,:)==1);
            if payoff_prob(trial,find(positions(trial,:)==1)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K2)
            action(trial,1)=find(positions(trial,:)==2);
            if payoff_prob(trial,find(positions(trial,:)==2)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K3)
            action(trial,1)=find(positions(trial,:)==3);
            if payoff_prob(trial,find(positions(trial,:)==3)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K4)
            action(trial,1)=find(positions(trial,:)==4);
            if payoff_prob(trial,find(positions(trial,:)==4)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K5)
            action(trial,1)=find(positions(trial,:)==5);
            if payoff_prob(trial,find(positions(trial,:)==5)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K6)
            action(trial,1)=find(positions(trial,:)==6);
            if payoff_prob(trial,find(positions(trial,:)==6)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K7)
            action(trial,1)=find(positions(trial,:)==7);
            if payoff_prob(trial,find(positions(trial,:)==7)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K8)
            action(trial,1)=find(positions(trial,:)==8);
            if payoff_prob(trial,find(positions(trial,:)==8)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        elseif (down_key==K9)
            action(trial,1)=find(positions(trial,:)==9);
            if payoff_prob(trial,find(positions(trial,:)==9)) < r
                pay(trial,1) = pay1;
            else
                pay(trial,1) = pay2;
            end
        end
%         
        if down_key == K1 
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint1);
           Screen('Flip',w);
        
        elseif down_key == K2 
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint2);
           Screen('Flip',w);
           
       elseif down_key == K3 
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint3);
           Screen('Flip',w);
           
           elseif down_key == K4 
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint4);
           Screen('Flip',w);
           
           elseif down_key == K5 
          
           Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint5);
           Screen('Flip',w);
           
           elseif down_key == K6
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint6);
           Screen('Flip',w);
           
           elseif down_key == K7
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint7);
           Screen('Flip',w);
           
            elseif down_key == K8
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint8);
           Screen('Flip',w);
           
            elseif down_key == K9
          
            Screen('DrawTexture', w, pic1, [], points{positions(trial,1)});
       Screen('DrawTexture', w, pic2, [], points{positions(trial,2)});
       Screen('DrawTexture', w, pic3, [], points{positions(trial,3)});
       Screen('DrawTexture', w, pic4, [], points{positions(trial,4)});
       Screen('DrawTexture', w, pic5, [], points{positions(trial,5)});
       Screen('DrawTexture', w, pic6, [], points{positions(trial,6)});
       Screen('DrawTexture', w, pic7, [], points{positions(trial,7)});
       Screen('DrawTexture', w, pic8, [], points{positions(trial,8)});
       Screen('DrawTexture', w, pic9, [], points{positions(trial,9)});
           Screen('FrameRect',w,white,cpoint9);
           Screen('Flip',w);
        end
        
       WaitSecs(0.7);  
       
       
    Screen('TextSize', w, 55);
    DrawFormattedText(w, 'Your payoff is', 'center', rect(4)*0.5, white);
    DrawFormattedText(w,  num2str(pay(trial,1)), 'center', rect(4)*0.6, white);
%     DrawFormattedText(w, 'Your total is', 'center', rect(4)*0.65, white);
%     DrawFormattedText(w,  num2str(sum(pay(1:trial,1))), 'center', rect(4)*0.75, white);
    Screen(w, 'Flip');
    WaitSecs(0.7);
    
    
    for i = 1:9
            payoff_prob(trial+1,i) = payoff_prob(trial,i) + 0.025*randn;
            if (payoff_prob(trial+1,i) < 0.1) || (payoff_prob(trial+1,i) > 0.9)
                payoff_prob(trial+1,i) = payoff_prob(trial,i);
            end
    end
    
    end
    
    RestrictKeysForKbCheck([]);
    
    %saving data
    data = struct;
    data.subject = sub; %*ones(trials,1);
   
    data.action = action;
    data.on = choice_on_time;
    data.off = choice_off_time;
    data.pay = pay;
    data.rt = choice_off_time-choice_on_time;
    data.positions = positions;
    data.payoff_prob = payoff_prob;
    %two_stage_task_data.payoff = payoff;
    save(strcat('sub',num2str(sub),'con',num2str(condition),'.mat'), 'data', '-v6');
    
    % Payoff screen
    
    payoff_sum = sum(pay); 
    Screen(w, 'FillRect', black);
    Screen('TextSize', w, 55);
    DrawFormattedText(w, 'This part is complete. Your payoff in points in all rounds:', 'center', 'center', white);
    DrawFormattedText(w,  num2str(payoff_sum), 'center', rect(4)*0.6, white);
    DrawFormattedText(w, 'Press any key to quit', 'center', rect(4)*0.8, white);
    Screen(w, 'Flip');
    WaitSecs(1);
    KbWait;
    
    
    Screen('Close',w);
    Screen('CloseAll');
    FlushEvents;
   % jheapcl;
    
 end
 
