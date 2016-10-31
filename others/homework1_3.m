clc
clear all
%% the original parameters
% Satellite=[GOCE,GPS,MOLNIYA,GEO,MICHIBIKI];
semi_major_axis_a=[6629*10^3 26560*10^3 26554*10^3 42164*10^3 42164*10^3];
eccentricity_e=[0.004 0.01 0.7 0 0.075];
GM=398.6005*10^12;
%% calculate the Kelerian elements of GOCE,GPS,MOLNIYA,GEO,MICHIBIKI and draw the orbits
for ii=1:5
a=semi_major_axis_a(ii);
e=eccentricity_e(ii);
T0=2*pi*sqrt(a^3/GM);
n=sqrt(GM/a^3);
N=fix(T0);
t=1:N;
M=n*t;
E=kepler(M,e);
v=2*atan(sqrt((1+e)/(1-e))*tan(E/2));
r=a*(1-e*cos(E));
figure(1)
f=plot(r.*cos(v),r.*sin(v));
hold on
if ii==1
set(f,'Color','r');
end
if ii==2
set(f,'Color','g');
figure(2)
for jj=1:length(v)
if v(jj)<0
    v(jj)=v(jj)+2*pi;
end
end
subplot(2,1,1),plot(M,'r');
hold on
subplot(2,1,1),plot(E,'g');
hold on
subplot(2,1,1),plot(v,'b');
hold on
subplot(2,1,1),plot(v-M,'m');
hold on
title('M,E,v,v-M of the GPS setellite')
xlabel('time(s)'); 
ylabel('angle(rad)');
legend('M','E','v','v-M');
end
if ii==3
set(f,'Color','b');
figure(2)
for jj=1:length(v)
if v(jj)<0
    v(jj)=v(jj)+2*pi;
end
end
subplot(2,1,2),plot(M,'r');
hold on
subplot(2,1,2),plot(E,'g');
hold on
subplot(2,1,2),plot(v,'b');
hold on
subplot(2,1,2),plot(v-M,'m');
hold on
title('M,v,E,v-M of the Molniya setellite')
xlabel('time(s)'); 
ylabel('angle(rad)');
legend('M','E','v','v-M');
end
if ii==4
set(f,'Color','m');
end
if ii==5
set(f,'Color','c');
end
end
figure(1)
title(' Orbit of 5 Satellites in 2-D plane');
legend('GOCE','GPS','MOLNIYA','GEO','MICHIBIKI');
grid on;
xlabel('x(m)');
ylabel('y(m)');

