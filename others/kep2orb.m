function [r,v] = kep2orb(t,a,e,ii)
%%Kep2orb: Computate the polar coordinates r(radius)and v(true anomaly)
%  based on input orbital elements
% GM is the Geocentric gravitational constant
% R_Earth is the Earth radius
% n is the mean motion
% T0 is the time of one revolution
% v is the true anomaly which has a equation
% tan(v/2)=sqrt((1+e)/(1-e))*tan(E/2)
% r is the polar coordinates radius with
%equation r=a(1-e.sinE)
% ii is the corresponding satellite
GM=398.6005*10^12;
n=sqrt(GM/a^3);
M=n*t;
if ii==5
 M=M+pi/6;   
end
E=kepler(M,e);
v=2*atan(sqrt((1+e)/(1-e))*tan(E/2));
r=a*(1-e*cos(E));
end

