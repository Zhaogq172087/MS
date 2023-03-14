% clc
% close all
% clear all

addpath('D:\soft\malab2020\bin\hfss_matlab_vbs_array16_edge\equation 5');
%% VARIABLES FOR THE SAKE OF PROGRAMMING
Z1=[];
X1=[];
W1=[];

K=150;
E_r=1;
h=8.5e-3;
c=3e8;

% d=6.797e-3; %33% size reduction
d0=37.5e-3; %20% size reduction
% d0=10.2986e-3;.. 10.3
d=30e-3;
%% THE CHARACTERISTIC IMPEDANCE OF THE UNIFORM TL
 Z0=123.045 ;% wres=9
% Z0=42.478;% wres=2.355
% Z0=48.08;% wres=1.95
%% PLACE YOUR Cn's HERE
%% wres=9, k=100, delta 0.01
%   C=[     0.0183   -0.0026   -0.0149    0.0069   -0.0008   -0.0092   -0.0021    0.0011    0.0034    0.0038   -0.0030]; % error= .1467
%  C=[           0.0136    0.0063    0.0018   -0.0035   -0.0086   -0.0019    0.0049    0.0001   -0.0037   -0.0016   -0.0074]; % error= 0.1467
%% wres=9, k=100, delta 0.05
% C=[        0.0188    0.0116    0.0086    0.0099   -0.0051   -0.0014   -0.0001   -0.0129   -0.0095   -0.0078   -0.0121]; % error= .1477 
% C=[           0.0118    0.0060    0.0059   -0.0026   -0.0015    0.0003   -0.0014    0.0005   -0.0069   -0.0044   -0.0074]; % error= 0.1467
%% wres=9, k=150, delta 0.01
 C=[        0.1002    0.0254    0.0194    0.0324   -0.0403    0.0110    0.0278   -0.0436   -0.0261   -0.0358   -0.0706]; % error= .1477, nice shape to try
%  C=[           0.0305    0.0002    0.0030    0.0003   -0.0121    0.0039    0.0081   -0.0032   -0.0130   -0.0096   -0.0081]; % error= 0.1477
%% wres=9, k=150, delta 0.05
%   C=[       0.0214    0.0046   -0.0103   -0.0080    0.0013   -0.0032   -0.0020    0.0081    0.0095   -0.0052   -0.0154]; % error= .1467 
%  C=[         0.0177    0.0030    0.0013   -0.0024   -0.0028   -0.0012    0.0060    0.0011   -0.0040   -0.0059   -0.0128]; % error= 0.1467
% THE NOTE AT THE END OF THE CODE   
   
for X=0:0.01:1  % IT HAS THE SAME PROCEDURE THAT WE CHOSE IT FOR 5O SECTION THE IDEA HERE WE HAVE FOUND C'S SO WE CAN DIVIDE IT TO ANY NO OF SECTIONS AS HERE 100., YOU HAVE TO KNOW THAT Z FOLLOW THE PREVIOUS CCONSTRAINTS
     X1=[X1 X];
      Z=Z0*exp(C(1,1)*cos(2*pi*0*X)+C(1,2)*cos(2*pi*1*X)+C(1,3)*cos(2*pi*2*X)+C(1,4)*cos(2*pi*3*X)+C(1,5)*cos(2*pi*4*X)+...
      C(1,6)*cos(2*pi*5*X)+C(1,7)*cos(2*pi*6*X)+C(1,8)*cos(2*pi*7*X)+C(1,9)*cos(2*pi*8*X)+C(1,10)*cos(2*pi*9*X)+C(1,11)*cos(2*pi*10*X));
      Z1=[Z1 Z];
      A=(Z/60)*sqrt((E_r+1)/2)+((E_r-1)/(E_r+1))*(0.23+0.11/E_r); 
      B=(377*pi)/(2*Z*sqrt(E_r));
     
      Width=(8*h*exp(A))/(exp(2*A)-2);
    if Width>0 && Width<(2*h)
       W=Width;
    else
       W=(2*h/pi)*(B-1-log(2*B-1)+((E_r-1)/(2*E_r))*(log(B-1)+0.39-0.61/E_r));
    end
 W1=[W1 W];% put the resulting widht in array to facillate the plot
end
 W1;
 Z1; 
%  figure
%  bar(X1,W1,'b')
% 
% bar(X1,(W1./2)*1e3)% *e3 cuz we note that the width plot with mm
% hold on% holds the plot and the current color and linestyle so that subsequent plotting commands will not reset the color and linestyle.
% bar(X1,(-W1./2)*1e3)
%  bar(X1,-W1)
% % figure
% subplot(2,1,1)
% plot(X1,Z1/Z0 ,'b')
% ylabel('Z(z) /Z0')
% xlabel('z/d')
% hold on
% bar(X1,W1,'b')
 
figure;
plot(X1,(W1./2)*1e3,'b');hold all
plot(X1,(-W1./2)*1e3,'b')
pos=X1*d*1e3;
Wr=0.5*W1*1e3;
fileName='1.xls';
% Names = {'postion';'width'};
T=table(Wr',pos');
writetable(T,fileName);
winopen(fileName);
