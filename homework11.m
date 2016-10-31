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
A=atan2(y,x);
if A(A<0)<0
    A=A+2*pi;
end
tt=tt/3600;
t_visible=E>0;
visible=E(E>0);
% draw the curve
if ii==1
subplot(5,1,ii),fill(tt,t_visible,'r');
axis([0 24 0 1]);
set(gca,'xtick',0:1:24);
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
xlabel('time(h)');
ylabel('visibility');
legend('GOCE');
title('The visibility of the satellites');
end
if ii==2
subplot(5,1,ii),fill(tt,t_visible,'g');
axis([0 24 0 1]);
set(gca,'xtick',0:1:24);
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
xlabel('time(h)');
ylabel('visibility');
legend('GPS');
end
if ii==3
subplot(5,1,ii),fill(tt,t_visible,'b');
axis([0 24 0 1]);
set(gca,'xtick',0:1:24);
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
xlabel('time(h)');
ylabel('visibility');
legend('MOLNIYA');
end
if ii==4
y1=zeros(1,length(tt));
y2=ones(1,length(tt));
subplot(5,1,ii),fill([tt,fliplr(tt)],[y1,fliplr(y2)],'m');
axis([0 24 0 1]);
set(gca,'xtick',0:1:24);
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
xlabel('time(h)');
ylabel('visibility');
legend('GEO');
end
if ii==5
subplot(5,1,ii),fill(tt,t_visible,'c');
axis([0 24 0 1]);
set(gca,'xtick',0:1:24);
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});
xlabel('time(h)');
ylabel('visibility');
legend('MICHIBIKI');
end
end