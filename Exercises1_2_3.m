clc
clear all
close all

%% Parameters
Re = 6371 * 10^3;
GM = 398.6005 * 10^12;      
axis_a= [6629000 26560000 26544000 42164000 42164000]; % Satellites are [GOCE,GPS,MOLNIYA,GEO,MICHIBIKI]
eccentrity=[0.004 0.01 0.7 0 0.075];
t = 1:86000;  
%% Cycle for satellites
for sat_num=1:length(axis_a)
    a=axis_a(sat_num);
    e=eccentrity(sat_num);

    [r,v, M, E] = kep2orb(t,a,e,sat_num) 
%% Plotting the orbits and anomalies
figure(1)
f=plot(r.*cos(v),r.*sin(v));
hold on
if sat_num==1
    set(f,'Color','r');
end
if sat_num==2
    set(f,'Color','g');
    figure(2)                       % M, v, E, v-M of the GPS satellite
    subplot(2,1,1);
    plot(M, 'r');
    hold on
    plot(E,'g');
    hold on
    for k = 1:length(v)
        if v(k)< 0;
       v(k) = v(k)+ 2*pi;
            end
        end
    plot(v, 'b');
    hold on
    plot(v-M, 'm');
    hold on
    title('M,E,v,v-M of the GPS satellite')
    xlabel('time(s)'); 
    ylabel('angle(rad)');
    legend('M','E','v','v-M');
    axis([0 45000 0-2 8]);
end

if sat_num==3
    set(f,'Color','b');
    figure(2)                      % M, v, E, v-M of the Molniya satellite
    subplot(2,1,2);
    plot(M, 'r');
    hold on
    plot(E,'g');
    hold on
    for k = 1:length(v)
        if v(k)< 0;
            v(k) = v(k)+ 2*pi;
            end
        end
    plot(v, 'b');
    hold on 
    plot(v-M, 'm');
    title('M,v,E,v-M of the Molniya satellite');
    xlabel('time(s)'); 
    ylabel('angle(rad)');
    legend('M','E','v','v-M');
    axis([0 45000 0-2 8]);
end

if sat_num==4
    set(f,'Color','m');
end

if sat_num==5
    set(f,'Color','c');
end

figure(1)
title('Orbit of 5 Satellites in 2-D plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
grid on;

end
