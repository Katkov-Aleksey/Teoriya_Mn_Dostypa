clear all;
close all;
clc;


P = [0.4 0.6;0.1 0.9]

ptr0 = 1;
ptr1 = 0;


exp = 100;
time = 30;
state0 = zeros(1,time);
state1 = zeros(1,time);
i = 1;
while i < exp 
currstate = 0;    
t = 1;
while t <= time
    
  prob = rand;
  
  if currstate == 0
  if (prob < P(1,1))
      currstate = 0;
      state0(t) = state0(t) + 1;
  end;
  if (prob > P(1,1))
       currstate = 1;
       state1(t) = state1(t) + 1;
  end;
  else
  if (prob < P(2,2))
      currstate = 1;
      state1(t) = state1(t) + 1;
  end;
  if (prob > P(2,2))
      currstate = 0;
      state0(t) = state0(t) + 1;
  end;
  end;
  if (i == 1)
pt0 = P(1,1)*ptr0+P(2,1)*ptr1;
pt1 = (P(1,2)*ptr0)+(P(2,2)*ptr1);
ptr0 = pt0;
ptr1 = pt1;
ver2(t) = pt0;
  end;
  t = t + 1;  
end;
i = i + 1;
end;
for g = 1 : time
    state0(g) = state0(g)/exp;
end;
tt = 0:1:time;
hold on
plot(tt,[1 state0])
plot(tt,[1 ver2])



