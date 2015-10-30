% Homework #4, problem #4,1 Physics 262 -- Program that evaluates distance
% modulus using HW#3 model(s). Program carries out numerical integration in
% order to calculate luminosity distance for each redshift value in the
% RiessGold.mat data file. For k>0 (positive curvature).

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
%for i=1:156
    z(i,1) = RiessGold(i,1);
    % z = RiessGold(i,1);
    a(i,1) = 1./(1+z(i,1));
    % a(i,1) = 1./(1+z(i,1));
    % a = 1./(1+z);
% end
    
    ainit = a(1,1);
    afin = a(156,1);
    aspan = [ainit,afin];
    par.a = a;
% Integrating conformal time (deta) function over range of z values
y1=newomegarkplus(a,par);
y2=newomegamkplus(a,par);
y3=newomegalkplus(a,par);
y4=newomegakplus(a,par);

% function [hmpc_ans] = HMpc(a,par)
% the value of Hubble's constant
% hmpc_ans = (((8 * pi * par.G)/(3 * (par.c)^2)) * par.rhoc0100.*(y1+y2+y3+y4)).^(1/2);

% y0=0;
% chi = quad(@deta, aspan, y0,[],par);
hmpc_ans1 = HMpc(a,par);
deta_ans1 = deta(a,par);
% y5 = HMpc(a,par);
% F = inline('1./((a.^(2)).*(hmpc_ans1))');
% F = inline('1./((a.^(2)).*hmpc_ans1))','a','hmpc_ans1');
% F = inline('deta_ans1','a','hmpc_ans1','par');
% F = inline('1./(a.^(2).*hmpc_ans1)')
% for i=1:156
% F = inline('1./(a.^(2))');
% chi = quad(F, ainit, afin);
% chi = quad(F,2,3);
% end
% chi = quad(@(x), deta(x,par), ainit, afin);
chi1 = chif(a,par)
% chi = quad(@(x) deta(x,par), ainit, afin);
% chi = quad(@x, deta(x,par), ainit, afin);
% chi = quad(@a, deta(a,par), ainit, afin);
% fdeta = feval('deta', a);
% chi = quad('deta','a',ainit, afin);
% chi = quad(@a, deta(a,par));
% chi = quad(@(a) deta(a,par), ainit, afin);
% chi = quad(@(a) 1./(a.^(2).*HMpc(a,par)), ainit, afin);
% chi = quad(@(a) deta_ans1, ainit, afin);
% chi = quad('deta(a,par)','a','par',ainit,afin);
% end
dist1 = dlum(a,par);
distm1 = distm(a,par);
% Plotting Omega_i(a) vs. log(a)
%a = logspace(-6,2);
%y1=newomegarkminus(a,par);
%y2=newomegamkminus(a,par);
%y3=newomegalkminus(a,par);
%y4=newomegakminus(a,par);
% y5=newomegakminus(a,par);
%semilogx(a,y1,'k-');
%hold on %
%semilogx(a,y2,'k:');
%semilogx(a,y3,'k-.');
%semilogx(a,y4,'k--');
% semilogx(a,y5,'k*');
%hold off
%ylim([-0.1,1]);
%xlabel('log(a)')
%ylabel('\Omega(a)')
%title('Semi-Log plot (\Omega_i vs log(a)) for Probs #4,5,7 of Hw #3 with neutrino background and curvature density \omega_{k,0} = -0.2 * \omega_{m,0} accounted for')
% legend('\Omega_r','\Omega_m','\Omega_{\Lambda}','\Omega_k_{(+2)}','\Omega_k_{(-2)}')
%legend('\Omega_r','\Omega_m','\Omega_{\Lambda}','\Omega_k_{(-2)}')



