function opt_gamain=gamain_Zcoefficients(y)
K=100;
E_r=1;
h=8.5e-3;
c=3e8;

% d=6.797e-3; %33% size reduction
d=37.5e-3; %20% size reduction
% d0=10.2986e-3;.. 10.3
d0=30e-3;
%% THE CHARACTERISTIC IMPEDANCE OF THE UNIFORM TL
 Z0=123.045 ;% wres=9
% Z0=42.478;% wres=2.355
% Z0=48.08;% wres=1.95
%% The Frequency Range:UWB range

fmin=0.8e9;
fmax=0.9e9;
deltaf=0.01e9; % arbitary increament and it is prefered to be small
f=fmin:deltaf:fmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for jj=1:1:length(f) 
    
    abcd=[1 0;0 1];
    
   abcd0=[1 0;0 1];
   for i=1:K
       X=((i-0.5)/(K));
       
       % Z(z) at the i'th section: the characterstics impedance of each
       % section (it is not normalized) ln(Z(z)/Z0)= c0 + ?[an  cos((2?nz )/d)+bn sin((2?nz )/d)]
       Zz=Z0*exp(y(1)*cos(2*pi*0*X)+y(2)*cos(2*pi*1*X)+y(3)*cos(2*pi*2*X)+y(4)*cos(2*pi*3*X)+y(5)*cos(2*pi*4*X)+y(6)*cos(2*pi*5*X)+y(7)*cos(2*pi*6*X)+y(8)*cos(2*pi*7*X)+y(9)*cos(2*pi*8*X)+y(10)*cos(2*pi*9*X)+y(11)*cos(2*pi*10*X));
       %%Finding W according to microstrip formalues
       Az=(Zz/60)*sqrt((E_r+1)/2)+((E_r-1)/(E_r+1))*(0.23+0.11/E_r);
       Bz=(377*pi)/(2*Zz*sqrt(E_r));
       Width=(8*exp(Az)*h)/(exp(2*Az)-2);
       if  Width>0 && Width<(2*h)
           W=Width;
       else
           W=(2*h/pi)*(Bz-1-log(2*Bz-1)+((E_r-1)/(2*E_r))*(log(Bz-1)+0.39-0.61/E_r));
       end
       % The value of the effective permettivity at each section:
       E_effz=(E_r+1)/2+((E_r-1)/2)*(1/sqrt(1+12*h/W));
       
       
       A=cos(2*pi*d*f(jj)*sqrt(E_effz)/(c*K));
       D=cos(2*pi*d*f(jj)*sqrt(E_effz)/(c*K));
       B=1i*(Zz)*sin(2*pi*d*f(jj)*sqrt(E_effz)/(c*K));
       C=1i*((Zz)^-1)*sin(2*pi*d*f(jj)*sqrt(E_effz)/(c*K));
       A0=cos(2*pi*d0*f(jj)*sqrt(E_effz)/c);
       D0=cos(2*pi*d0*f(jj)*sqrt(E_effz)/c);
       B0=1i*(Z0)*sin(2*pi*d0*f(jj)*sqrt(E_effz)/c);
       C0=1i*((Z0)^-1)*sin(2*pi*d0*f(jj)*sqrt(E_effz)/c);
       
       abcd01=[A0 B0;C0 D0];
       abcd0=abcd0*abcd01;
       abcd1=[A B;C D];
       
       abcd=abcd*abcd1;
       
       
       
       
   end
   
        error(jj)=0.25*((abs(abcd(1,1)-abcd0(1,1)))^2+(Z0^-2)*(abs(abcd(1,2)-abcd0(1,2)))^2+(Z0^2)*(abs(abcd(2,1)-abcd0(2,1)))^2+(abs(abcd(2,2)-abcd0(2,2)))^2); 
        error1=0;
        error1=error(jj)+error1;
        error=sqrt((1/(length(f))*error1));
%  Zin=(abcd(1,1)*Zl+abcd(1,2))/(abcd(2,1)*Zl+abcd(2,2));
% 
% gamma=(Zin-Zs)/(Zin+Zs);
%   
% error(jj)= abs(gamma)^2;

end
 
opt_gamain=max(error);

 


