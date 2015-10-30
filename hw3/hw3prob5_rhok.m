% Homework #3, Problem #7, Physics 262

%Define parameters
par.rhoc0 =  4.46e3; % present critical density (units: MeV/m^3)   
par.rhom0 = 0.28 * par.rhoc0; % present matter density 
% par.rhor0 = 0.260; % present radiation density  (MeV/m^3)
par.rhor0 = 0.454 ; % present radiation density (MeV/m^3), now taking neutrino background into account
par.rhoL0 = 0.72 * par.rhoc0; % present cosmological constant density
par.rhokplus0 = 0.2 * par.rhom0; % curvature density has now been included
par.rhokminus0 = -0.2 * par.rhom0; % curvature density has now been included
par.rhoc0100 = 1.053e4; %  value critical density would have if H = 100 km/s/Mpc (units: Mev/m^3)

% Plotting omega_k(a) (problem 3.7) (using value of critical density as if H = 100 km/s/Mpc). 
a = logspace(-6,2); 
% y1= lomegar(a,par);
% y2= lomegam(a,par);
% y3= lomegal(a,par);
y1 = lomegakplus(a,par);
y2 = lomegakminus(a,par);
a = logspace(-6,2);
% loglog(a,y1,'k-');
% hold on
% loglog(a,y2,'k:');
% hold on
% loglog(a,y3,'k-.');
loglog(a,y1,'k-');
hold on
loglog(a,y2,'k:');
%plot values
xlabel('log(a)')
ylabel('log(\omega_k(a) )')
title('Log-Log Plot (log(\omega_k) vs. log(a)) for Probs #3.7 with neutrino background and curvature density \omega_{k,0} = +/-  0.2 * \omega_{m,0} accounted for ')
legend('\omega_k_{(+2)}','\omega_k_{(-2)}')




