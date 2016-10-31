function [position_topo velocity_topo] =efix2topo(position_Earth,velocity_Earth)
% this function is used to transform position and velocity in an
% earth-fixed system into position and velcity in a topocentric system
% centered at the station Wellzell
% Q translates the left-hand coordinate system to right-hand system
Q=[-1 0 0;0 1 0;0 0 1];
% the coordinate of Wellzell
rw=[4075.53022*10^3 931.78130*10^3 4801.61819*10^3]';
n=length(position_Earth(1,:));
lamta_w=atan2(rw(2),rw(1));
phi_w=atan(rw(3)/sqrt(rw(2)^2+rw(1)^2));
% rotate matrix
Rt=Q*rotmat(2,pi/2-phi_w)*rotmat(3,lamta_w);
position_topo=Rt*(position_Earth-rw*ones(1,n));
velocity_topo=Rt*(velocity_Earth-rw*ones(1,n));
end

