function [ position_Earth velocity_Earth ] = cart2efix(position,velocity,tt)
%   cart2efix function is a function that transforms position and velocity
%   under the space-fixed system to the Earth-fixed system
%   The input parameters are the position and velocity under the Earth-fixed 
%   system. tt is the period of the satellite.
%   here the earth rotate should be considered to do the coordinates
%   translation
n=length(tt);
omiga_E=2*pi/86164;
position_Earth(3,n)=0;
velocity_Earth(3,n)=0;
for jj=1:n
theta=omiga_E*jj;
R_E=rotmat(3,theta);
position_Earth(:,jj)=R_E*position(:,jj);
velocity_Earth(:,jj)=R_E*velocity(:,jj);
end
end

