function[r, v, M, E]=kep2orb(t,a,e,sat_num)
%% Original parameters
Re = 6371 * 10^3;
GM = 398.6005 * 10^12;  
n = sqrt(GM/(a^3));         % mean motion = average angular velocity [rad/s] 
T0 = 2*pi*(1/n);            % one revolution
%t = 1:T0;                   % points for one revolution, if commented
%there is a drop in a plot, but Excercise 4 and 5 works well due to
%defining of t within the script as 1:86400, Ex6-8 affected if this
%uncommented
M = n*t;                    % mean anomaly
%% Michibiki has different mean anomaly:
if sat_num==5
 M=M+pi/6;
end
E(1,length(M))=0;  %Element E from 1st row and last column of M

%% Calculating E by iteration
%                                                                     for ii=1:length(M) %Real iterations
%                                                                     E0 = M(ii);
%                                                                     deltaE=((M(ii)+(e*sin(E0))-E0))/(1-(e*cos(E0)));
%                                                                     while abs(deltaE > 10^(-6))
%                                                                          E1 = E0+deltaE;
%                                                                          deltaE=((M(ii)+(e*sin(E1))-E1))/(1-(e*cos(E1)));
%                                                                          E0=E1;
%                                                                     end
%                                                                     E(ii)=E0;
%                                                                     end

for ii=1:length(M)
        E0=M(ii);
        E1=M(ii)+e*sin(E0);
        while abs(E1-E0)>10^(-6)  %% to make sure this function is not a infinite loop
          E0=E1;
          E1=M(ii)+e*sin(E0);
        end
        E(ii)=E1;
        end
%                                                                     
% E0 = M;
% E = M + e*sin(E0);
% while abs(E-E0 > 10^(-6))
%      E0 = E1
%      E = M + e*sin(E0);
% end

%% Calculating radius and true anomaly
r = a*(1-e*cos(E));
v = 2*atan((sqrt((1+e)/(1-e)))*tan(E/2));
end
