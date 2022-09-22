T = 200;

a = 0.2;
b = 0.005;
c = 0.3;
d = 0.003;
R0 = 100;
F0 = 30;
T0 = [0,T];

if T == 100
    Searching_path = [];
    for E =  1:0.1:6.4
        RF=@(t,y)[a*y(1) - b*y(1)*y(2) - E;-c*y(2)+ d*y(1)*y(2)];
        [t,y]=ode45(RF,T0,[R0,F0]);

        if size(t,1)<=200 & y(size(t,1),1) <1 & y(size(t,1),1) >= 0
            Searching_path = [Searching_path;[E,size(y,1),y(size(y,1),:)]];
        end
    end
    disp('The value of E is')
    disp(E);
    % Figure 1: The number of R or F vs Time
    subplot(1,2,1);
    plot(t,y(:,1),'-',t,y(:,2),'-*');
    legend('R', 'F')
    xlabel('Time');
    ylabel('Number');
    grid on 
    % Figure 2: The number of F vs R
    subplot(1,2,2);
    plot(y(:,1),y(:,2))
    xlabel('R');
    ylabel('F');
    grid on
elseif T == 200
    LY = [];
    range_left = 0;
    range_right = 0;
    accuracy1 = 0.1;
    for E = 0:accuracy1:5
        RF=@(t,y)[a*y(1) - b*y(1)*y(2) - E;-c*y(2)+ d*y(1)*y(2)];
        [t,y]=ode45(RF,T0,[R0,F0]);
        LY = [LY;[E,size(y,1),y(size(y,1),1)]];
        if size(y,1) == 189 & y(size(y,1),1)<= 31.9
            range_left = E;
        end
        if size(y,1) <= 213 & y(size(y,1),1)<= 16
            range_right = E;
        end
    end

    range1 = [range_left,range_right];
    accuracy2 = 0.0001;
    for E = range_left:accuracy2:range_right
        RF=@(t,y)[a*y(1) - b*y(1)*y(2) - E;-c*y(2)+ d*y(1)*y(2)];
        [t,y]=ode45(RF,T0,[R0,F0]);
        LY = [LY;[E,size(y,1),y(size(y,1),1)]];
        if size(y,1) == 197 & y(size(y,1),1) > 1.31
            range2_left2 = E;
        end
        if size(y,1) == 197 & y(size(y,1),1) >=0
            range2_right2 = E;
        end
    end

    range2 = [range2_left2, range2_right2];

    Searching_path = [];
    for E =  range2_left2:0.0001:range2_right2
        RF=@(t,y)[a*y(1) - b*y(1)*y(2) - E;-c*y(2)+ d*y(1)*y(2)];
        [t,y]=ode45(RF,T0,[R0,F0]);

        if size(t,1)<=200 & y(size(t,1),1) <1 & y(size(t,1),1) >= 0
            Searching_path = [Searching_path;[E,size(y,1),y(size(y,1),:)]];
        end
    end
    disp('The value of E is')
    disp(E);
    % Figure 1: The number of R or F vs Time
    subplot(1,2,1);
    plot(t,y(:,1),'-',t,y(:,2),'-*');
    legend('R', 'F')
    xlabel('Time');
    ylabel('Number');
    grid on 
    % Figure 2: The number of F vs R
    subplot(1,2,2);
    plot(y(:,1),y(:,2))
    xlabel('R');
    ylabel('F');
    grid on
end
