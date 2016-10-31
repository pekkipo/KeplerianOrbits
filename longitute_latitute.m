function [longitute latitute]=longitute_latitute(position)
x=position(1,:);
y=position(2,:);
z=position(3,:);
longitute=atan2(y,x);
latitute=atan(z./sqrt(x.*x+y.*y));
longitute=longitute/pi*180;
latitute=latitute/pi*180;
end

