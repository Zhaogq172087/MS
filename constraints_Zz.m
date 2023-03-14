function  [c,ceq]=constraints_Zz(y)
K=100;
for i=1:(K)
         X=((i-0.5)/(K));             
    Z(i)=exp(y(1)*cos(2*pi*0*X)+y(2)*cos(2*pi*1*X)+y(3)*cos(2*pi*2*X)+y(4)*cos(2*pi*3*X)+y(5)*cos(2*pi*4*X)+y(6)*cos(2*pi*5*X)+y(7)*cos(2*pi*6*X)+y(8)*cos(2*pi*7*X)+y(9)*cos(2*pi*8*X)+y(10)*cos(2*pi*9*X)+y(11)*cos(2*pi*10*X));
;%NORMALIZED IMPEDANCE
end
%% THE TWO CONSTRAINTS ARE TRANSLATED HERE
 % Reasonable fabrication. max(X) is the largest element in X  cuz z is variable that is why we have to choose the max and min values an
%   c=[max(Z)-2.393;0.2799-min(Z)]; % Wmax=10 mm, Wmin=0.3 mm
c=[max(Z)-2.645;1-min(Z)]; % Wmax=9 mm, Wmin=0.3 mm, wres=1.9,zo=123.045
%   c=[max(Z)-2.755;1-min(Z)]; % Wmax=1 mm, Wmin=0.3 mm wres=2.355,zo=42.478

%  c=[max(Z)-2.434;1-min(Z)]; % Wmax=1 mm, Wmin=0.3 mm wres=1.95,zo=48.08


ceq=[sum(y)];% Zmzx=117.04 , Zmin=9.55 (For Fc=3.1GHz,ROC,d=10mm) , Zc=70.71..course, as the ¯ Zmax is increased or specially ¯ Zmin
%is reduced, the resulted error decreases...and the smallest allowable
%width in pcb fabrication is 0.3 and MAX IS 15 mm
end

