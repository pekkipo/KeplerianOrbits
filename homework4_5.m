clc
clear all
%% the original parameters
semi_major_axis_a=[6629*10^3 26560*10^3 26554*10^3 42164*10^3 42164*10^3];
eccentricity_e=[0.004 0.01 0.7 0 0.075];
incination_i=[96.6 55 63 0 41];
right_ascension_omiga=[257.7 60 245 0 195];
perigee_w=[144.2 0 270 0 270];

%% calculate the position and velocity of GOCE,GPS,MOLNIYA,GEO,MICHIBIKI 
%in inertial system and draw the orbits 
for ii=1:5
a=semi_major_axis_a(ii);
e=eccentricity_e(ii);
i=incination_i(ii);
omiga=right_ascension_omiga(ii);
w=perigee_w(ii);
% calculate the r and v for a whole day
[r,v] = kep2orb(1:86400,a,e,ii);
[rb vb]=CoordinateTrasform(r,v,a,e);
position=rotmat(3,-omiga/180*pi)*rotmat(1,-i/180*pi)*rotmat(3,-w/180*pi)*rb;
velocity=rotmat(3,-omiga/180*pi)*rotmat(1,-i/180*pi)*rotmat(3,-w/180*pi)*vb;
V_magnitude=sqrt(velocity(1,:).*velocity(1,:)+velocity(2,:).*velocity(2,:)+velocity(3,:).*velocity(3,:));
figure(1)
f_1=plot3(position(1,:),position(2,:),position(3,:));
hold on
figure(2)
f_2=plot(position(1,:),position(2,:));
hold on
figure(3)
f_3=plot(position(1,:),position(3,:));
hold on
figure(4)
f_4=plot(position(2,:),position(3,:));
hold on;
figure(5)
f_5=plot(V_magnitude);
set(f_5,'linewidth',1.5);
hold on
if ii==1
set(f_1,'Color','r');
set(f_2,'Color','r');
set(f_3,'Color','r');
set(f_4,'Color','r');
set(f_5,'Color','r');
end
if ii==2
set(f_1,'Color','g');
set(f_2,'Color','g');
set(f_3,'Color','g');
set(f_4,'Color','g');
set(f_5,'Color','g');
end
if ii==3
set(f_1,'Color','b');
set(f_2,'Color','b');
set(f_3,'Color','b');
set(f_4,'Color','b');
set(f_5,'Color','b');
end
if ii==4
set(f_1,'Color','m');
set(f_2,'Color','m');
set(f_3,'Color','m');
set(f_4,'Color','m');
set(f_5,'Color','m');
end
if ii==5
set(f_1,'Color','c');
set(f_2,'Color','c');
set(f_3,'Color','c');
set(f_4,'Color','c');
set(f_5,'Color','c');
end
end
figure(1)
title(' Orbit of 5 Satellites in 3-D space');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
Earth_coast(3);
figure(2)
title(' Orbit of 5 Satellites in x-y plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
grid on;
figure(3)
title(' Orbit of 5 Satellites in x-z plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
grid on;
figure(4)
title(' Orbit of 5 Satellites in y-z plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('x(m)');
ylabel('y(m)');
grid on;
figure(5)
title(' Velocity of 5 Satellites ');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
xlabel('time(s)');
ylabel('m/s');
grid on;
