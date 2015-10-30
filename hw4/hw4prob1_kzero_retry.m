% Homework #4, problem #4,1 Physics 262 -- retry: Program that evaluates distance
% modulus using HW#3 model(s) for k>0 (positive curvature) only.Program 
% carries out numerical integration in order to calculate luminosity distance
% for each redshift value in the RiessGold.mat data file. 

% load -ascii RiessGold.mat;
load -ascii RiessGold.mat;
a = 1./(1+RiessGold.z);
% Define parameters (Same as used in HW#3.7 and some additional ones for
% this particular problem).
par.g = 6.673e-11; % Newton's Gravitational Const in mks units
par.c = 2.998e8 ; % speed of light in mks units
par.H0 = 100; % 100km/sec/Mpc
par.h0 = 65 ; % H_0 = 65km/sec/Mpc
par.lh0 = 0.65 ; % h_0 = 0.65
par.rhoc0 =  4.46e3; % present critical density   
par.rhom0 = 0.28 * par.rhoc0; % present mass density
par.rhor0 = 0.454; % present radiation density with neutrino background now taken into account (MeV/m^3)
par.rhoL0 = 0.72 * par.rhoc0; % present cosmological constant density
par.rhokplus0 = 0.2 * par.rhom0; % curvature density has now been included
par.rhokminus0 = -0.2 * par.rhom0; % curvature density has now been included
par.rhoc0100 = 1.053e4; %  value critical density would have if H = 100 km/s/Mpc (units: MeV/m^3)

% Setting up array of redshift data values from RiessGold.mat file

    % z = RiessGold(i,1);
    % a = 1./(1+z);
    ainit = a(1,1);
    afin = a(156,1);
    aspan = [ainit,afin];
    par.a = a;

% Integrating conformal time (deta) function over range of z values
% y1=lomegakplus(a,par);
y2=lomegam(a,par);
y3=lomegal(a,par);
y4=lomegar(a,par);

% y1=newomegarkplus(a,par);
% y2=newomegamkplus(a,par);
% y3=newomegalkplus(a,par);
% y4=newomegakplus(a,par);
hmpc_ans1 = HMpc(a,par);
deta_ans1 = deta(a,par);
for i = 1:156
chi1 = chif(a,par);
% dist1 = dlum(a,par);
dist1 = chi1(a,par)./a(i,1);
distm1 = distm(a,par);
end



