function [position velocity] = kep2car(rb,vb,i,omiga,w)
%   kep2car is a function that transferms Kelplerian elements to the
%   position and velocity in an inertial(space-fixed) system.
%   The input parameter rb is radius,vb is the true anomaly and i, omiga,w
%   are the inclination, right ascension node and the argument of the
%   perigee
position=rotmat(3,-omiga)*rotmat(1,-i)*rotmat(3,-w)*rb;
velocity=rotmat(3,-omiga)*rotmat(1,-i)*rotmat(3,-w)*vb;
end

