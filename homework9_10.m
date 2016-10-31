clc 
clear all
%% the original parameters
semi_major_axis_a=[6629*10^3 26560*10^3 26554*10^3 42164*10^3 42164*10^3];
eccentricity_e=[0.004 0.01 0.7 0 0.075];
incination_i=[96.6 55 63 0 41];
right_ascension_omiga=[257.7 60 245 0 195];
perigee_w=[144.2 0 270 0 270];
GM=398.6005*10^12;
%% calculate orbits in the topocentric system
for ii=1:5
a=semi_major_axis_a(ii);
e=eccentricity_e(ii);
i=incination_i(ii)*pi/180;
omiga=right_ascension_omiga(ii)*pi/180;
w=perigee_w(ii)*pi/180;
tt=1:1:86400;
n=length(tt);
[r,v] = kep2orb(tt,a,e,ii);
[rb vb]=CoordinateTrasform(r,v,a,e);
[position velocity] = kep2car(rb,vb,i,omiga,w);
[position_Earth velocity_Earth ] = cart2efix(position,velocity,tt);
[position_topo velocity_topo] =efix2topo(position_Earth,velocity_Earth);
x=position_topo(1,:);
y=position_topo(2,:);
z=position_topo(3,:);
A=atan2(y,x);
if A(A<0)<0
    A=A+2*pi;
end
A=A*180/pi;
Z=acosd(z./sqrt(x.^2+y.^2+z.^2));
E=90-Z;
% draw the curve
if ii==1
skyplot(A(1:50:end),E(1:50:end),'.r');
hold on;
end
if ii==2
skyplot(A(1:50:end),E(1:50:end),'.g');
hold on;
end
if ii==3
skyplot(A(1:50:end),E(1:50:end),'.b');
hold on;
end
if ii==4
skyplot(A(1:50:end),E(1:50:end),'.m');
hold on;
end
if ii==5
skyplot(A(1:50:end),E(1:50:end),'.c');
hold on;
end
end