function [] = hw1()
% This file performs calculations for HW1 for P262 in 2004.

% Define parameters
par.rhoc0 = 1.879e-29 * 0.65^2;
par.rhom0 = 0.3 * par.rhoc0;
par.rhor0 = 4.8135e-34 * (2.725/2.75)^4;
par.rhoL0 = 0.7 * par.rhoc0;
% par.rhok0 = par.rhoc0 - par.rhom0 - par.rhor0 - par.rhoL0
par.rhok0 = 0
% a ";" at the end of a command supresses printing to the screen 
% the absence of a ";" in the above line causes the entire data structure
% "par" ti be printed

% Plotting rho(aP (problem 1.2 -- 2004)
% Note that the following Rho_i functions are defined at the end of this
% file (?)

a = logspace(-6,0); % create "a" values for x axis
loglog(a,Rhor(a,par),a,Rhom(a,par),a,RhoL(a,par),a,Rho(a,par)) %plot values
xlabel('a')
ylabel('\rho') % matlab uses many (but not all) LaTex codes
legend('\rho_r','\rho_m', '\rho_{\Lambda}','\rho_{TOT}')

%functions

function[ rho ] = Rhor( a,par )
%RHOR radiation density
rho = par.rhor0*a.^(-4);
%******* very important ******
% writing ".^" instead of "^" is special MATLAB code 
% that allows you to pass vector arguments to the function to return a
% vector which is the function evaluated at each element of the input
% vector. Otherwise, MATLAB will try some other kind of vector math.

function [ rho ] = Rhom( a,par )
%RHOM matter density
rho = par.rhom0*a.^(-3);

function [ rho ] = RhoL( a,par )
%RHOL cosmological constant
rho = par.rhoL0*a.^(0);

function [ rho ] = Rhok( a,par )
% RHOk curvature "density"
rho = par.rhok0*a.^(-2);

function [ rho ] = Rho ( a,par )
%RHO total density
rho = Rhor(a,par) + Rhom(a,par) + Rhom(a,par) + RhoL(a,par) + Rhok(a,par);