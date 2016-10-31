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

for sat_num=1:length(axis_a)
    a=axis_a(sat_num);
    e=eccentrity(sat_num);
    asc = ascending_node(sat_num);
    i = inclination_i(sat_num);
    per = perigee_arg(sat_num);
    T =1:1:86400;
    n=length(T);

[position velocity] = kep2cart(T,per,asc,i,e,sat_num,a);
[eposition evelocity] = cart2exfix(position,velocity,T);
[topoposition topovelocity] =exfix2topo(eposition,evelocity);

x=topoposition(1,:);
y=topoposition(2,:);
z=topoposition(3,:);

A=atan2(y,x);
if A(A<0)<0
    A=A+2*pi;
end
A=A*180/pi;
Z=acosd(z./sqrt(x.^2+y.^2+z.^2));
E=90-Z;

figure(1)


if sat_num == 1
    skyplot(A(1:50:end),E(1:50:end),'.r');
    hold on
end
if sat_num == 2
    skyplot(A(1:50:end),E(1:50:end),'.g');
    hold on
end
if sat_num == 3
    skyplot(A(1:50:end),E(1:50:end),'.b');
    hold on
end
if sat_num == 4
    skyplot(A(1:50:end),E(1:50:end),'.m');
    hold on
end
if sat_num == 5
    skyplot(A(1:50:end),E(1:50:end),'.c');
    hold on
end

figure(1);
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI'); 
hold on
title('Topocentric coordinate system');
end