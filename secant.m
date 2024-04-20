%this program calculates, using Secant method,
    %the root of f=x+cos(x) with initial guesses x0=-0.9 and x1=5;

clc;clear;close all;

x0=-0.9;%initial guess
x1=5; %second initial guess
tol=1e-10; %tolerance
f=@(x) x+cos(x); %function for which we want to find a root
%df=@(x) -3*x^2+sin(x); %f'
nmax=100; %max number of iterations
i=0; %set iteration counter
while (i<nmax && abs(f(x0))>tol) %while the num of iterations is less then nmax and |f(xn)|>tol 
    %x0=x0-(f(x0)/df(x0)); %do newt update
    i=i+1; %update iteration index
    x2=x0;
    x0=x1;
    x1=x1-(f(x1)/((f(x1)-f(x2))/(x1-x2))); %secant method

end
fprintf('\n Number of iterations: %d \n',i);
fprintf('\n Calculated root: %10.11f \n',x0);
fprintf('\n Residual: %10.11f \n',abs(f(x0)));