% Plot of phi for 7.4

figure(1)
plot(T,phi);
%xlim[.6e-14,1e-14])
%ylim([-1.1])
title('\phi(t) during inflation (m = 1 x 10^{-16} Gev)')
xlabel('t (GeV^{-1})')
ylabel('\phi(t) (GeV)')

% Plot of rhophi for 7.4

figure(2)
loglog(T,rhophi);
xlim([1e-20,1e-14])
title('\rho_\phi(1) during inflation (m = 1 x 10^{16} GeV)')
xlabel('t (GeV^{-1})')
ylabel('\rho_\phi(t) (GeV^{4})')


% Plot of w for 7.4

figure(3)
plot(T,wphi);
%xlim([.85e-14,2e-14])
%ylim([0.001,.7])
title('w_\phi(t) during inflation (m = 1 x 10^{16} GeV)')
xlabel('t (GeV^{-1})')
ylabel('w_\phi(t)')

% Plot of deltaH for 7.4

figure(4)
plot(T,deltaH);
xlim([.01e-14,.3e-14])
title('\delta_H(t) during inflation (m = 1 x 10^{16} GeV)')
xlabel('t (GeV^{-1})')
ylabel('\delta_H(t)')

% Plot of lna for 7.4

figure(5)
plot(T,lna);
%ylim[110,111]);
%xlim[-33,-30])
title('lna(t) during inflation (m = 1 x 10^{16} GeV)')
xlabel('t (GeV^{-1})')
ylabel('lna(t)')
