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
    global dmu;
    global a;
    sigma = RiessGold(:,3);
    par.sigma = sigma;
    global sigma;
    % par.sigma = sigma;
    % par.sigma = sigma;
    % end
    % par.mu = mu;
% Integrating conformal time (deta) function over range of z values
% for j=1:156
% par.rhoL0 = 0.72 * par.rhoc0; % present cosmological constant density
% par.rhoc0100 = 1.053e4; %  value critical density would have if H = 100 km/s/Mpc (units: MeV/m^3)
% for i = 1:156
y1=lomegal(a(i,1),par);
% par.rhoL0 = 0.72 * par.rhoc0; % present cosmological constant density
% par.rhoc0100 = 1.053e4; %  value critical density would have if H = 100 km/s/Mpc (units: MeV/m^3)
% par.lomegal = lomegal;
y2=lomegam(a(i,1),par);
y3=lomegar(a(i,1),par);
% par.lomegal = lomegal;
% par.lomegam = lomegam;
% par.lomegar = lomegar;
hmpck0_ans1 = HMpck0(a(i,1),par);
% par.HMpck0 = HMpck0
detak0_ans1 = detak0(a(i,1),par);
% chi1 = chif(a,par)
dist1k0 = dlumk0(a(i,1),par);
% par.dlumk0 = dlumk0
distm1k0 = distmk0(a(i,1),par);
% end
% par.distmk0 = distmk0; 
%for i=1:156
% chi2 = fchisqko(a,par); 
%for i=1:156
% chisq = ((dmu - distmk0(a(i,1),par)).^2)./(sigma.^2);
%end
% for i = 1:156
% chisqoff = ((dmu - distmk0(a(i,1),par) + muoff).^2)./(sigma.^2);
% end
% a(:,1) = 1./(1+z(:,1));
% for i = 1:156
% muoff = 1;
% muoff = fminsearch(@(x) chisqoff(x,par), 0);
% muoff = fminsearch(@(x) chisqoff(x,par), 0);
% chisqoff = ((dmu - distmk0(a(:,1),par) + muoff).^2)./(par.sigma.^2);
muoff = fminsearch(@(x) chisqoff(x,par), 0);
% chisqoff1_ans = chisqoff(x,par);
% for i = 1:156
%muoff = fminsearch(@(x) chisqoff(x,par), 0);
% muoff = fminsearch(@(x) chisqoff(x,par), 0);
%muoff1_ans = muoff;
% chisqoff1_ans = chisqoff(x,par);
% par.muoff = muoff   
% chisqoff = ((dmu - distmk0(a(i,1),par)).^2)./(sigma.^2);    
% muoff = fminsearch(@(x) chisqoff(x,par), 0);
% par.muoff = muoff
chisqfinal = chisqoff(muoff,par);
% end


