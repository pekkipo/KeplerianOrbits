function [rb vb]=CoordinateTrasform(r,v,a,e)
GM=398.6005*10^12;
rb_x=r.*cos(v);
rb_y=r.*sin(v);
rb_z=r.*0;
rb=[rb_x;rb_y;rb_z];
vb_x=sqrt(GM/(a*(1-e^2)))*(-sin(v));
vb_y=sqrt(GM/(a*(1-e^2)))*(e+cos(v));
vb_z=sqrt(GM/(a*(1-e^2)))*zeros(1,length(v));
vb=[vb_x;vb_y;vb_z];
end

