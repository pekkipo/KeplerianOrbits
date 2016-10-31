function [R]=rotmat(axis,sita)
% this function can creat a rotate matrix based on axis and sita
% while the axis is the rotating axis and sita is the angle to rotate
if axis==1
    R=[ 1 0 0;
        0 cos(sita) sin(sita);
        0 -sin(sita) cos(sita);]
end
if axis==2
    R=[ cos(sita) 0 -sin(sita);
        0 1 0;
        sin(sita) 0 cos(sita);]
end
if axis==3
    R=[ cos(sita) sin(sita) 0;
        -sin(sita) cos(sita) 0
        0 0 1;]
end
end

