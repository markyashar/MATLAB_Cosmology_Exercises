% Homework #4, problem #4,2 Physics 262 -- Program evaluates chi^2
% for canoncial model (w_k = 0) from HW#3.

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
    z(:,1) = RiessGold(:,1); 
    a(:,1) = 1./(1+z(:,1));
    ainit = a(1,1);
    afin = a(156,1);
    aspan = [ainit,afin];
    par.a = a;
    dmu = RiessGold(:,2);
    par.dmu = dmu;
    sigma = RiessGold(:,3);
    % par.sigma = sigma;
    % end
    % par.mu = mu;
% Integrating conformal time (deta) function over range of z values
% for j=1:156
o1=lomegal(a(:,1),par);
o2=lomegam(a(:,1),par);
o3=lomegar(a(:,1),par);
hmpck0_ans1 = HMpck0(a(:,1),par);
detak0_ans1 = detak0(a(:,1),par);
% chi1 = chif(a,par)
for i=1:156;
% dist1k0 = dlumk0(a(i,1),par);
dlumk0_ans1 = (quad(@(x) detak0(x,par),a(i,1),1)./(a(i,1)));
end
for j=1:156
% distm1k0 = distmk0(a(i,1),par);
dmk0_ans1 = 5*log10(dlumk0(a(j,1),par)) + 25;
end
%for i=1:156
% chi2 = fchisqko(a,par); 
for k=1:156
chisq = ((dmu - distmk0(a(k,1),par)).^2)./(sigma.^2);
end
% end


