clc
clear all
close all

%% Parameters
Re = 6371 * 10^3;
GM = 398.6005 * 10^12;  
axis_a= [6629000 26560000 26544000 42164000 42164000]; % Satellites are [GOCE,GPS,MOLNIYA,GEO,MICHIBIKI]
eccentrity=[0.004 0.01 0.7 0 0.075];
perigee_arg  = degtorad([144.2 0 270 0 270]);
inclination_i = degtorad([96.6 55 63 0 41]);
ascending_node= degtorad([257.7 60.0 245 0 195]);

%% Cycle for 5 satellites
for sat_num=1:length(axis_a)
    a=axis_a(sat_num);
    e=eccentrity(sat_num);
    asc = ascending_node(sat_num);
    i = inclination_i(sat_num);
    per = perigee_arg(sat_num);
    n = sqrt(GM/(a^3));         % mean motion = average angular velocity [rad/s] 
    T0 = 2*pi*(1/n);            % one revolution             
    T=1:2*T0; %(fix(T0)) 
    %n=length(T);
    [position velocity] = kep2cart(T,per,asc,i,e,sat_num,a);
    [eposition evelocity]=cart2exfix(position, velocity, T);
    
    x=eposition(1,:);
    y=eposition(2,:);
    z=eposition(3,:);
    longitute=radtodeg(atan2(y,x));
    latitute=radtodeg(atan(z./sqrt(x.*x+y.*y)));
%     longitute=longitute/pi*180;
%     latitute=latitute/pi*180;

%% Plotting
% figure(1)
%f_1=plot3(eposition(1,:),eposition(2,:),eposition(3,:),'r','LineWidth',1.5);
%Earth_coast(3);
% hold on

% figure(2)
% f_2=plot(longitute(1:100:end),latitute(1:100:end),'*');
% hold on
% Earth_coast(2);
if sat_num == 1
    figure(1)
f_1=plot3(eposition(1,:),eposition(2,:),eposition(3,:),'r','LineWidth',1.5);
hold on
%     set(f_1,'Color','r');
%      set(f_2,'Color','r');
figure(2)
     f=plot(longitute(1:50:end),latitute(1:50:end),'*r');
     hold on
end
if sat_num == 2
        figure(1)
    f_1=plot3(eposition(1,:),eposition(2,:),eposition(3,:),'g','LineWidth',1.5);
hold on
%     set(f_1,'Color','g');
%     set(f_2,'Color','g');
figure(2)
f=plot(longitute(1:100:end),latitute(1:100:end),'*g');
     hold on
end
if sat_num == 3
    figure(1)
    f_1=plot3(eposition(1,:),eposition(2,:),eposition(3,:),'b','LineWidth',1.5);
hold on
%     set(f_1,'Color','b');
%     set(f_2,'Color','b');
figure(2)
f=plot(longitute(1:100:end),latitute(1:100:end),'*b');
     hold on
end
if sat_num == 4
    figure(1)
    f_1=plot3(eposition(1,:),eposition(2,:),eposition(3,:),'m','LineWidth',1.5);
hold on
%     set(f_1,'Color','m');
%     set(f_2,'Color','m');
figure(2)
f=plot(longitute(1:100:end),latitute(1:100:end),'*m');
     hold on
end
if sat_num == 5
    figure(1)
    f_1=plot3(eposition(1,:),eposition(2,:),eposition(3,:),'c','LineWidth', 1.5);
hold on
%     set(f_1,'Color','c');
%     set(f_2,'Color','c');
figure(2)
    f=plot(longitute(1:100:end),latitute(1:100:end),'*c');
     hold on
     Earth_coast(2);
end

% hold on


end

figure(1)
title('Earth-fixed system');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
grid off;

figure(2)
title('Earth ground tracks');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
grid off;
