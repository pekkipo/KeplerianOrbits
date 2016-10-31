function [topoposition topovelocity] = exfix2topo(eposition,evelocity)
% Left hand - Right handed
Q1=[-1 0 0;0 1 0;0 0 1];
% Wettzell coordinates
wettzell=[4075.53022*10^3 931.78130*10^3 4801.61819*10^3]';

n=length(eposition(1,:));
latitude_topo=atan2(wettzell(2),wettzell(1));
longitude_topo=atan(wettzell(3)/sqrt(wettzell(2)^2+wettzell(1)^2));
R2 = [cos((pi/2)-longitude_topo) 0 -sin((pi/2)-longitude_topo); 0 1 0; sin((pi/2)-longitude_topo) 0 cos((pi/2)-longitude_topo)];
R3 = [cos(latitude_topo) sin(latitude_topo) 0; -sin(latitude_topo) cos(latitude_topo) 0; 0 0 1];
R=Q1*R2*R3;
topoposition=R*(eposition-wettzell*ones(1,n));
topovelocity=R*(evelocity-wettzell*ones(1,n));

end

