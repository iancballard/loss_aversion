function start

global sub 

sub = input('Subject number: ');

conditions = Shuffle(1:2);

experiment9(sub,conditions(1),100);
experiment9(sub,conditions(2),100);

end

