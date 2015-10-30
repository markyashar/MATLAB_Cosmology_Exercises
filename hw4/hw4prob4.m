% Homework #4, problem #4,4 Physics 262

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

% Setting up array of distance modulus data values from RiessGold.mat file
    z(i,1) = RiessGold(i,1); 
    a(i,1) = 1./(1+z(i,1));
    ainit = a(1,1);
    afin = a(156,1);
    aspan = [ainit,afin];
    par.a = a;
    dmu = RiessGold(:,2);
    par.dmu = dmu;
    sigma = RiessGold(:,3)
    % par.sigma = sigma;
    % end
    % par.mu = mu;
% Integrating conformal time (deta) function over range of z values
% for j=1:156
% o1=lomegal(a(i,1),par);
% o2=lomegam(a(i,1),par);
% o3=lomegar(a(i,1),par);
somegam = [0.01 0.03 0.05 0.07 0.09 0.11 0.13 0.15 0.17 0.19 0.21 0.25];
somegal = [0.25 0.26 0.27 0.28 0.29 0.30 0.31 0.32 0.33 0.34 0.35 0.36];
% global somegam somegal;
hmpck0_ansprob4 = HMpck04(somegam,somegal,par);
detak0_ansprob4 = detak04(a(i,1),somegam, somegal,par);
% chi1 = chif(a,par)
dist1k0_ansprob4 = dlumk04(a(i,1),par);
distm1k0_ansprob4 = distmk04(a(i,1),somegam, somegal, par);
%for i=1:156
% chi2 = fchisqko(a,par); 
for i=1:156
chisq = ((dmu - distmk04(a(i,1),par)).^2)./(sigma.^2);
end
surf(somegam, somegal, chisq);
% end



