    clear all;
    close all;
    clc;

    p1 = 0.4;
    p0 = 0.8;

    P = [0.1 0.4 0.5;0.2 0.1 0.7;0.3 0.4 0.3]

    exp = 1;
    time = 100000;
    state0 = 0;
    state1 = 0;
    state2 = 0;
    i = 1;
    while i <= exp
        currstate = 0;
        t = 0;
        while t <= time


            t = t + 1;
            prob = rand;

            if (t>time)
                break;
            end;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if currstate == 0
                if (prob < P(1,1))
                    currstate = 0;
                    state0 = state0 + 1;
                    continue;
                end;
                if (prob > P(1,1)&& prob < (P(1,1)+P(1,2)))
                    currstate = 1;
                    state1 = state1 + 1;
                    continue;
                end;
                if (prob >= (P(1,1)+P(1,2)))
                    currstate = 2;
                    state2 = state2 + 1;
                    continue;
                end;
            end;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if currstate == 1
                if (prob < P(2,1))
                    currstate = 0;
                    state0 = state0 + 1;
                    continue;
                end;
                if (prob > P(2,1)&& prob < (P(2,1)+P(2,2)))
                    currstate = 1;
                    state1 = state1 + 1;
                    continue;
                end;
                if (prob >= (P(2,1)+P(2,2)))
                    currstate = 2;
                    state2 = state2 + 1;
                    continue;
                end;
            end;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if currstate == 2
                if (prob < P(3,1))
                    currstate = 0;
                    state0 = state0 + 1;
                    continue;
                end;
                if (prob > P(3,1)&& prob < (P(3,1)+P(3,2)))
                    currstate = 1;
                    state1 = state1 + 1;
                    continue;
                end;
                if (prob >= (P(3,1)+P(3,2)))
                    currstate = 2;
                    state2 = state2 + 1;
                    continue;
                end;
            end;
        end;
        i = i + 1;
    end;


    A = (P' - eye(3));
    A(3,1:3) = ones(1,3);
    B = zeros(3,1);
    B(3,1) = 1;
    X = A^(-1)*B

    state0 = state0/time
    state1 = state1/time
    state2 = state2/time


