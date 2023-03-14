clc
close all
clear all

for ii=1:20
%% The initial values of the Fourier coeffecients: between -1 and 1( a + (b-a).*rand)
y0=[-1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2 -1+rand*2];

%% The lower & upper bounds of the Fourier coeffecients:
yub=[ 1 1 1 1 1 1 1 1 1 1 1];
ylb=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];

%% To Increase the number of iterations and/or reduce the tolerance:
options = optimset('MaxFunEvals',100000,'maxiter',1000,'TolFun',1e-20,'TolCon',1e-20,'TolX',1e-20);
%options = optimoptions( 'fmincon','MaxFunEvals',100000,'maxiter',500,'TolFun',1e-20,'TolCon',1e-20,'TolX',1e-20);
%to change the defult algorithm (interior point)
%options.Algorithm = 'sqp';% or options = optimoptions( 'fmincon','Algorithm','sqp','MaxFunEvals',100000,'maxiter',500,'TolFun',1e-20,'TolCon',1e-20,'TolX',1e-20);
% Use the 'interior-point' algorithm first.
% For help if the minimization fails, see When the Solver Fails or When the Solver Might Have Succeeded.
% To run an optimization again to obtain more speed on small- to medium-sized problems, try 'sqp' next, and 'active-set' last.
% Use 'trust-region-reflective' when applicable. Your problem must have: objective function includes gradient, only bounds, or only linear equality constraints (but not both).
% 
%options = optimoptions(
%'fmincon','Algorithm','trust-region-reflective','MaxFunEvals',100000,'maxiter',500,'TolFun',1e-20,'TolCon',1e-20,'TolX',1e-20);
%ic ouldnt use it cuz its setting different so you have to be aware about
%the algorithm you are going to use
%MaxFunEvals positive integer :Maximum number of function evaluations allowed./maxiter :Maximum number of iterations allowed.
%TolFun:positive scalar,Termination tolerance( is a threshold which, if crossed, stops the iterations of a solver) on the function value/Tolx:Termination tolerance on x, the current poin

%% The optimization function:
[y,fval,exitflag,output]=fmincon(@gamain_Zcoefficients,y0,[],[],[],[],ylb,yub,@constraints_Zz,options)
%[x,fval,exitflag] = fmincon(...) returns a value exitflag that describes the exit condition of fmincon.
%C_n obejective function
%[x,fval,exitflag,output] = fmincon(...) returns a structure output with information about the optimization
%fval mimimum value required , here error Note   Because Optimization Toolbox™ functions only accept inputs of type double, user-supplied objective and nonlinear constraint functions must return outputs of type double.
%% To save the error & The optimized Fourier coeffecients:
 %format shortE %Floating point format with 5 digits 
 error(ii)=fval;
 Cns(ii,1:11)=y;% coefficents C0 to C10 for each ii=fval=error
 
 %you can use min(errot) to get the required optimum one among hte error
 %matrix , and you can use find(error==min(error)) to get the postion of
 %that error to get it corresonding coefficents :)  ,,Cns(#,:)
fval; % so just the above for letting the user understand that fval is the error to be optimized and cns is the optimized coefficents
y;
end

