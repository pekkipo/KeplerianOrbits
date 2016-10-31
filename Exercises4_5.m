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
t=1:86400;
%% 5 satellites cycle
for sat_num=1:length(axis_a)
    a=axis_a(sat_num);
    e=eccentrity(sat_num);
    asc = ascending_node(sat_num);
    i = inclination_i(sat_num);
    per = perigee_arg(sat_num);
%% Function kep2cart
    [position,velocity, vel_magnitude] = kep2cart(t,per,asc,i,e,sat_num,a);

%% Plotting
figure(1)
%Earth_coast(3);
% Earth_coast(3);
% hold on
f_1=plot3(position(1,:),position(2,:),position(3,:));
hold on
figure(2)
f_2=plot(vel_magnitude);
hold on
figure(3)
%subplot(3,1,1);
f_3=plot(position(1,:),position(2,:));
hold on
figure(4)
%subplot(3,1,2);
f_4=plot(position(1,:),position(3,:));
hold on
figure(5)
%subplot(3,1,3);
f_5=plot(position(2,:),position(3,:));
hold on;

%% Plotting parameters
if sat_num == 1
    set(f_1,'Color','r');
    set(f_2,'Color','r');
    set(f_3,'Color','r');
    set(f_4,'Color','r');
    set(f_5,'Color','r');
end
if sat_num == 2
    set(f_1,'Color','g');
    set(f_2,'Color','g');
    set(f_3,'Color','g');
    set(f_4,'Color','g');
    set(f_5,'Color','g');
end
if sat_num == 3
    set(f_1,'Color','b');
    set(f_2,'Color','b');
    set(f_3,'Color','b');
    set(f_4,'Color','b');
    set(f_5,'Color','b');
end
if sat_num == 4
    set(f_1,'Color','m');
    set(f_2,'Color','m');
    set(f_3,'Color','m');
    set(f_4,'Color','m');
    set(f_5,'Color','m');
end
if sat_num == 5
    set(f_1,'Color','c');
    set(f_2,'Color','c');
    set(f_3,'Color','c');
    set(f_4,'Color','c');
    set(f_5,'Color','c');
end

%% Figures Parameters
figure(1)
title('Orbit of 5 Satellites in 3-D plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
grid off;

figure(2)
title('Satellites velocity');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('t(s)');
ylabel('V(m/s)');

figure(3)
%subplot(3,1,1);
title('2-D projection in x-y plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');

figure(4)
%subplot(3,1,2);
title('2-D projection in x-z plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('z(m)');

figure(5)
%subplot(3,1,3);
title('2-D projection in y-z plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('y(m)');
ylabel('z(m)');


end

