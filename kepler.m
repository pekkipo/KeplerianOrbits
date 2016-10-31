function E=kepler(M,e)
    %% This function is to solve the equation for E based on M=E-e*sinE using iteration,
%% E1=M+e*sin(E0) with initial value E0=M, while E1-E0 is larger than 10^(-6)  
        E(1:length(M))=0;
        for ii=1:length(M)
        E0=M(ii);
        E1=M(ii)+e*sin(E0);
        while abs(E1-E0)>10^(-6)  %% to make sure this function is not a infinite loop
          E0=E1;
          E1=M(ii)+e*sin(E0);
        end
        E(ii)=E1;
        end
        end

