clear
% load -ascii RiessGold.mat
load -ascii RiessGoldz
load -ascii RiessGoldmu
load -ascii RiessGoldsigma
load -ascii RiessGolds
% Main program here begins by loading in the Riess
% Gold data.
a = 1./(1 + RiessGoldz); % Input parameters are defined here
sigma = RiessGoldsigma;
mudata = RiessGoldmu;

omega.m0 = 0.118;  % Input vectors are defined here.
omega.lam0 = 0.304;
omega.r0 = 4.002e-5;
omega.k0 = 0; % these 2 possible omega_k,0 values are to differentiate
% between the canonical model (omega_k = 0) for problem #2, and the 
% variable omega_k model for problems #4 and 5.
% omega.k0 = (0.65)^2 - omega.m0 - omega.lam0 - omega.r0;
omega.kabsolute = 3.336e-4*sqrt(abs(omega.k0));

chicanon = ChiSquared(a,mudata,sigma,omega); % Calling ChiSquared(...)
% here gives us an un-altered chi^2 value.
[muoff,chioff] = ChiMini(a,mudata,sigma,omega); % Calling ChiMin(...) here
% gives us a minimized chi^2 value; the mu_offset value makes this
% minimization possible. Both functions go down roughly the same path ...

chicanon
muoff
chioff

% This is the main file towards the path of evaluating chi-squared. In 
% order to try to keep things straight, we have chosen to segment this
% problem into many steps.

