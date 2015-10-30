global param;
global IC;
% Parameters of the cosmology
param.lambda = 8;
param.beta   = 33.8;
param.v0     = 1;
param.delta  = 0.005;
param.chi    = 1;

% param.C     = 1E-7;
X = 3/(param.lambda^2 - 3);

% Set the initial conditions
initial_cond_5_2;
% initial_cond_lambda;

timeRange   = [1 1e60];
initialCond = [IC.a0 IC.phi0 IC.dphidt0];
options = ['Refine', 10];

% Solve the differential equations
[T,Y] = ode45(@evolveUniverse, timeRange, initialCond, options);

% Calculate the energy density and the pressure
rho_phi = Y(:,3).^2/2 + potential(Y(:,2),param);
P_phi   = Y(:,3).^2/2  - potential(Y(:,2),param);

rho_matter = param.C./(Y(:,1).^3);

w = P_phi ./ rho_phi;

figure(1);
semilogx(T,w);

xlabel('time');
ylabel('w');
title('Eqn of state of \phi');

figure(2);
% semilogx(T, Y(:,2));
semilogx(T, param.C ./ (Y(:,1).^3));
% loglog(T, param.C ./ (Y(:,1).^3));

xlabel('time');
ylabel('\phi(t)');
title('\phi versus time');

figure(3);
loglog(T,rho_matter, 'r');
hold on
loglog(T,rho_phi,'b');
hold off
xlabel('time');
ylabel('\rho');
title('Energy density versus time');
legend('\rho_{matter}','\rho_{\phi}');

figure(4);
semilogx(T,potential(param.C ./ (Y(:,1).^3), param));

xlabel('time');
ylabel('V(\phi)');
title('Potential as a function of time');