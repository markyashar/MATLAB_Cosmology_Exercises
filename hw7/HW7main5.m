% HW 7.5

par.G = (1.2211e19)^(-2);   % G in GeV^-2
par.T0 = 2.7/(1.1605e13);   % Temperature today in Gev

% par.m = 1e16;    % mass in GeV for problem 7.4

par.m = 5e11;     % mass in GeV for problem 7.5

par.a0 = 1e-50;   % arbitrary initial value for the scale factor


% ODE solver to solve for phi and phidot as a function of time

[T,Y] = ode45(@(t,y) HW7ode(t,y,par),[0 100*(par.m)^-1],[1e20 0]);

phi = Y(:,1);

phidot = Y(:,2);

rhophi = rho(phi,phidot,par);

pphi = p(phi,phidot,par);

wphi = (pphi)./(rhophi);

deltaH = delta(phi,phidot,par);


% integrating to find a(t)

length(T);

lna(1) = log(par.a0);

for i = 1:(length(T)-1)
    lna(i+1) = lna(i) + H(phi(i+1),phidot(i+1),par).*(T(i+1) - T(i));
end

% Plot of phi for 7.5

figure(1)
plot(T,phi);
%xlim[.6e-14,1e-14])
%ylim([-1.1])
title('\phi(t) during inflation (m = 5 x 10^{11} Gev)')
xlabel('t (GeV^{-1})')
ylabel('\phi(t) (GeV)')

% Plot of rhophi for 7.5

figure(2)
loglog(T,rhophi);
% plot(T,rhophi);
xlim([1e-20,2e-10])
% ylim([1e65,1e72])
title('\rho_\phi(t) during inflation (m = 5 x 10^{11} GeV)')
xlabel('t (GeV^{-1})')
ylabel('\rho_\phi(t) (GeV^{4})')


% Plot of w for 7.5

figure(3)
plot(T,wphi);
%xlim([.85e-14,2e-14])
%ylim([0.001,.7])
title('w_\phi(t) during inflation (m = 5 x 10^{11} GeV)')
xlabel('t (GeV^{-1})')
ylabel('w_\phi(t)')

% Plot of deltaH for 7.5

figure(4)
plot(T,deltaH);
xlim([.01e-10,.6e-10])
title('\delta_H(t) during inflation (m = 5 x 10^{11} GeV)')
xlabel('t (GeV^{-1})')
ylabel('\delta_H(t)')

% Plot of lna for 7.5

figure(5)
plot(T,lna);
% ylim([110,111]);
% xlim([-33,-30]);
title('lna(t) during inflation (m = 5 x 10^{11} GeV)')
xlabel('t (GeV^{-1})')
ylabel('lna(t)')
