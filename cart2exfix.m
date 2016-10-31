function [eposition, evelocity] = cart2exfix(position, velocity, T)
rotating_rate = (2*pi)/86164;
for k = 1:length(T)
    theta = (rotating_rate)*k;
    R3_theta = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1]
    eposition(:,k)=R3_theta*position(:,k);
    evelocity(:,k)=R3_theta*velocity(:,k);
end
    

end

