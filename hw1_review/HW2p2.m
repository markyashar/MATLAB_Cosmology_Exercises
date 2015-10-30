function [] = HW2p2()
% This file performs calculations for PHY 262 HW2.2, 2004  (built of the
% HW 1 file). It produces two more plots like the one we produced for 
% HW 1.2 using the parameters (including the rho_k(a) curve with the
% others): Omega_m(a=1) = 0.1 (plot i), 2 (plot ii) and 
% Omega_omega(a=1) = 0 (plot i), 0 (plot ii). The scale factor should range
% over the interval (10^-2,1) for these plots.

% Define parameters for first model
par.rhoc0 = 1.879e-29 * 0.65^2;
par.rhom0 = 0.1*par.rhoc0;
par.rhor0 = 4.8135e-34 * (2-725/2.75)^4;
par.rhoL0 = 0.0*par.rhoc0;
par.rhok0 = par.rhoc0 - par.rhom0 - par.rhor0 - par.rhoL0

% Plotting rho(a) (problem 2.2, 2004). Note that the various Rho_ifunctions
% are defined at the end of this file
a = logspace(-2,0); % create "a" values for x axis
loglog(a,Rhor(a,par),a,Rhom(a,par),a,RhoL(a,par),a,Rho(a,par),a,abs(Rhok(a,par)))
% plot values
xlabel('a')
ylabel('\rho') % matlab uses many (but not all) LaTeX codes
legend('\rho_r','\rho_m', '\rho_{\Lambda}','\rho_{TOT}','|\rho_k|')

pause % (press a key to continue. % Before continuing you can save
% (or copy and paste) the figure

%Define parameters for second model
par.rhoc0 = 1.879e-29 * 0.65^2;
par.rhom0 = 2*par.rhoc0;
par.rhor0 = 4.8135e-34*(2.725/2.75)^4;
par.rhoL0 = 0.0 * par.rhoc0;
par.rhok0 = par.rhoc0 - par.rhom0 - par.rhor0 - par.rhoL0

% Plotting rho(a) (problem 2.2, 2004)
% Note that the various Rho_i functions are defined at the end of this
% file
a = logspace(-2,0); % create "a" values for x axis
loglog(a,Rhor(a,par),a,Rhom(a,par),a,RhoL(a,par),a,Rho(a,par),a,abs(Rhok(a,par))) %plot values
xlabel('a')
ylabel('\rho') %matlab uses many (but not all) LaTeX codes
legend('\rho_r','\rho_m','\rho_{\Lambda}','\rho_{TOT}','|\rho_k|')

function [ rho ] = Rhor( a,par )
%RHOR radiation density
rho = par.rhor0*a.^(-4);

function [ rho ] = Rhom( a,par )
%RHOM Matter density
rho = par.rhom0*a.^(-3);

function [ rho ] = RhoL( a,par )
%RHOL cosmological constant
rho = par.rhoL0*a.^(0);

function [ rho ] = Rhok( a,par )
%RHOK curvature "density"
rho = par.rhok0*a.^(-2);

function [ rho ] = Rho( a,par )
%RHO total density
rho = Rhor(a,par) + Rhom(a,par) + RhoL(a,par) + Rhok(a,par);
