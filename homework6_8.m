clc
clear all
%% the original parameters
semi_major_axis_a=[6629*10^3 26560*10^3 26554*10^3 42164*10^3 42164*10^3];
eccentricity_e=[0.004 0.01 0.7 0 0.075];
incination_i=[96.6 55 63 0 41];
right_ascension_omiga=[257.7 60 245 0 195];
perigee_w=[144.2 0 270 0 270];
  for ii=1:5
a=semi_major_axis_a(ii);
e=eccentricity_e(ii);
i=incination_i(ii)*pi/180;
omiga=right_ascension_omiga(ii)*pi/180;
w=perigee_w(ii)*pi/180;
GM=398.6005*10^12;
T0=2*pi*sqrt(a^3/GM);
N=fix(T0);
tt=1:2*N;
n=length(tt);
[r,v] = kep2orb(1:2*N,a,e,ii);
[rb vb]=CoordinateTrasform(r,v,a,e);
[position velocity] = kep2car(rb,vb,i,omiga,w);
omiga_E=2*pi/86164;
position_Earth(3,n)=0;
velocity_Earth(3,n)=0;
for jj=1:n
theta=omiga_E*jj;
R_E=rotmat(3,theta);
position_Earth(:,jj)=R_E*position(:,jj);
velocity_Earth(:,jj)=R_E*velocity(:,jj);
end
[longitute latitute]=longitute_latitute(position_Earth);
if ii==1
    figure(1)
plot3(position_Earth(1,:),position_Earth(2,:),position_Earth(3,:),'r','LineWidth',1.5);
hold on
figure(2)
plot(longitute(1:50:end),latitute(1:50:end),'*r');
hold on
end
if ii==2
    figure(1)
plot3(position_Earth(1,:),position_Earth(2,:),position_Earth(3,:),'g','LineWidth',1.5);
hold on
figure(2)
plot(longitute(1:100:end),latitute(1:100:end),'*g');
hold on
end
if ii==3
    figure(1)
plot3(position_Earth(1,:),position_Earth(2,:),position_Earth(3,:),'b','LineWidth',1.5);
hold on
figure(2)
plot(longitute(1:100:end),latitute(1:100:end),'*b');
hold on
end
if ii==4
    figure(1)
plot3(position_Earth(1,:),position_Earth(2,:),position_Earth(3,:),'*m');
hold on
figure(2)
plot(longitute(1:100:end),latitute(1:100:end),'*m');
hold on
end
if ii==5
    figure(1)
plot3(position_Earth(1,:),position_Earth(2,:),position_Earth(3,:),'c','LineWidth',1.5);
hold on
figure(2)
plot(longitute(1:100:end),latitute(1:100:end),'*c');
hold on
earth_coast(2);
end
  end
figure(1);
earth_coast(3);
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI'); 
hold off
title('3D projection');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
