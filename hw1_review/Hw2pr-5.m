function [] = Hw2pr_5() % This file performs calculations for PHY 262 HW2.4
% and HW2.5, 2004 (built out of the HW1 file)

warning off MATLAB:quad:MaxFcnCount;
% Integrals for the problem require a lot of dynamic range, which triggers
% spurious warnings. The above command turns off these spurious messages

par.G = 6.6742e-8; Newton's constant in cgs units
par.ainit = 1.e-8; % initial value of scale factor
par.afinal = 1; % final value of scale factor
a = logspace(log10(par,ainit).log10(par.afinal)); % create "a" values
aspan = [par.ainit,par.afinal]; % range of a values
par.a = a; % make a values easy to pass to functions

%%%%%% MODEL i %%%%%%
% Define parameters
par.rhoc0 = 1.879e-29 * 0.65^2;
par.rhom0 = 0.1*par.rhoc0;
par.rhor0 = 4.813e-34*(2.725/2.75)^4;
par.rhoL0 = 0.0*par.rhoc0;
par.rhok0 = par.rhoc0 - par.rhom0 - par.rhor0 - par.rhoL0;

%Calculate t(a) and Hinv values
y0 = 0;
t1 = deval(solution,a);
Hinv1 = Hinv(a,par);
par.t1 = t1; % make t1 easy to pass to functions

%%%%% MODEL ii %%%%%%
par.rhoc0 = 1.879e-29 * 0.65^2;
par.rhom0 = 2 * par.rhoc0;
par.rhor0 = 4.8135e-34 * (2.725/2.75)^4;
par.rhoL0 = 0.0 * par.rhoc0;
par.rhok0 = par.rhoc0 - par.rhom0 - par.rhor0 - par.rhoL0;

% Calculate t(a) and Hinv values
y0 = 0;
solution = ode45(@dtda,aspan,y0,[],par);
t2 = deval(solution,a);
Hinv2 = Hinv(a,par);
par.t2 = t2; % make t2 easy to pass to functions

%%%%%% MODEL iii %%%%%%%
% Define parameters
par.rhoc0 = 1.879e-29 * 0.65^2;
par.rhom0 = 0.3 * par.rhoc0;
par.rhor0 = 4.8135e-34 * (2.725/2.75)^4;
par.rhoL0 = 0.7 * par.rhoc0;
par.rhok0 = par.rhoc0 - par.rhom0 - par.rhor0 - par.rhoL0;

% Calculate t(a) and Hinv values
y0 = 0;
solution = ode45(@dtda,aspan,y0,[],par);
t3 = deval(solution,a);
Hinv3 = Hinv(a,par);
par.t3 = t3; % makes t3 easy to pass to functions

%%%% This plot is for Problem 2.4, 2004
semilogx(a,t1,/Hinv1,a,t2./Hinv2,a,t3./Hinv3)
% Note the use of "./" above as discussed in HW1, for the case of ".^"
xlabel('a')
ylabel('tH')
legend('model i','model ii','model iii')
pause % save or copy the first plot here as needed

%%%% Horizon distance for Problem 2.5 %%%%%
% Produce horizon distance for model 1
y0 = 0;
tspan = [0,t1(end)];
solution = ode45(@dldt1,tspan,y0,[],par);
dH1 = a. *deval(solution,t1);
% Produce horizon distance for model 2
y0 = 0;
tspan = [0,t2(end)];
solution = ode45(@dldt2,tspan,y0,[],par);
dH2 = a.*deval(solution,t2);
% Produce horizon distance for model 3
y0 = 0;
tspan = [0,t3(end)];
solution = ode45(@dldt3,tspan,y0,[],par);
dH3 = a.*deval(solution,t3);

%%%% This plot is for Problem 2.5 %%%%
semilogx(a,dH2./Hinv1,a,dH2./Hinv2,a,dH3./Hinv3)
xlabel('a')
ylabel('d_H\times H')
legend('model i','model ii','model iii')

function [ f ] = dldt1(t,lx,par)
% construct 1/a(t) for horizon integral (model 1)
f = 1./spline(par.t1,par.a,t); % spline is a MATLAB function for 
% interpolating

function [ f ] = dldt2(t,lx,par)
% construct 1/a(t) for horizon integral (model 2)
f = 1./spline(par.t2,par.a,t);

function [ f ] = dldt3(t,lx,par)
% construct 1/a(t) for horizon integral (model 3)
f = 1./spline(par.t3,par.a,t);

function [ f ] = dtda(a,t,par)
%DTDA (the integrand for problem 2.4)
xrho = Rho(a,par);
f =(a.*( (8*pi/3) * par.G .* xrho ).^(1/2) ).^(-1);
% MATLAB pre-defines the variable "pi" for you
% Usage of ".*" is similar to ".^" (discussed in HW 1 comment)

function [ tH ] = Hinv(a,par)
% Hinv returns H^(-1) as a funciton of a
xrho = Rho(a,par);
tH =(( (8*pi/3) * par.G .* xrho ).^(-1/2) ) );

function [ rho ] = Rhor( a,par )
%RHOR radiation density
rho = par.rhor0*a.^(-4);

function [ rho ] = Rhom( a,par )
%RHOM Matter density
rho = par.rhom0*a.^(-3);

function [ rho ] = RhoL( a,par )
%RHOM Cosmological Constant
rho = par.rhoL0*a.^(0);

function [ rho ] = Rhok( a,par )
%RHOK curvature "density"
rho = par.rhok0*a.^(-2);

function [ rho ] = Rho( a,par )
%RHO total density
rho = Rhor(a,par) + Rhom(a,par) + RhoL(a,par) + Rhok(a,par);

