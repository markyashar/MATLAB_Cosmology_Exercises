% Homework #3, problem #7 Physics 262 -- plots of Omega_k(a) with
% neutrino background and curvature density (omega_(k,0) = +/- 0.2*omega_(m.0)
% taken into account.

%Define parameters
par.rhoc0 =  4.46e3; % present critical density   
par.rhom0 = 0.28 * par.rhoc0; % present mass density
% par.rhor0 = 0.260; % present radiation density  
par.rhor0 = 0.454; % present radiation density with neutrino background now taken into account (MeV/m^3)
par.rhoL0 = 0.72 * par.rhoc0; % present cosmological constant density
par.rhokplus0 = 0.2 * par.rhom0; % curvature density has now been included
par.rhokminus0 = -0.2 * par.rhom0; % curvature density has now been included
par.rhoc0100 = 1.053e4; %  value critical density would have if H = 100 km/s/Mpc (units: MeV/m^3)

% Plotting Omega_i(a) 
a = logspace(-6,2);
y1=newomegarkplus(a,par);
y2=newomegamkplus(a,par);
% y3=newomegalkplus(a,par);
% y4=newomegakplus(a,par);
% y5=newomegakminus(a,par);
semilogx(a,y1,'k-');
hold on 
semilogx(a,y2,'k:');
hold off
% semilogx(a,y3,'k-.');
% semilogx(a,y4,'k--');
% semilogx(a,y5,'k*');
% hold off
ylim([-0.1,1]);
xlabel('log(a)')
ylabel('\Omega_k(a)')
title('Semi-Log plot (\Omega_k(a) vs log(a)) for Prob. #3.7 with neutrino background and \omega_{k,0} = +/- 0.2 * \omega_{m,0} accounted for')
legend('\Omega_k_{(+2)}','\Omega_k_{(-2)}')




