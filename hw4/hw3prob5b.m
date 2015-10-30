% Homework #3, problem #4,5,7 Physics 262 -- plots of Omega_i(a) with
% neutrino background and curvature density (omega_(k,0) = -0.2*omega_(m.0)) taken into account

%Define parameters
par.rhoc0 =  4.46e3; % present critical density   
par.rhom0 = 0.28 * par.rhoc0; % present mass density
% par.rhor0 = 0.260; % present radiation density  
par.rhor0 = 0.454; % present radiation density with neutrino background now taken into account (MeV/m^3)
par.rhoL0 = 0.72 * par.rhoc0; % present cosmological constant density
par.rhokplus0 = 0.2 * par.rhom0; % curvature density has now been included
par.rhokminus0 = -0.2 * par.rhom0; % curvature density has now been included
par.rhoc0100 = 1.053e4; %  value critical density would have if H = 100 km/s/Mpc (units: MeV/m^3)

% Plotting Omega_i(a) vs. log(a)
a = logspace(-6,2);
y1=newomegarkminus(a,par);
y2=newomegamkminus(a,par);
y3=newomegalkminus(a,par);
y4=newomegakminus(a,par);
% y5=newomegakminus(a,par);
semilogx(a,y1,'k-');
hold on %
semilogx(a,y2,'k:');
semilogx(a,y3,'k-.');
semilogx(a,y4,'k--');
% semilogx(a,y5,'k*');
hold off
ylim([-0.1,1]);
xlabel('log(a)')
ylabel('\Omega(a)')
title('Semi-Log plot (\Omega_i vs log(a)) for Probs #4,5,7 of Hw #3 with neutrino background and curvature density \omega_{k,0} = -0.2 * \omega_{m,0} accounted for')
% legend('\Omega_r','\Omega_m','\Omega_{\Lambda}','\Omega_k_{(+2)}','\Omega_k_{(-2)}')
legend('\Omega_r','\Omega_m','\Omega_{\Lambda}','\Omega_k_{(-2)}')



