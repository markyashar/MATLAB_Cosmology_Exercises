% Initial conditions of the matter fields.
% Here we try and get w --> -1 at late times.
IC.phi0   = 34.0;
IC.dphidt0   = -1E-7;
IC.t0   = 1;
IC.a0   = 1;

rho_phi0 = (IC.dphidt0)^2/2 + potential(IC.phi0,param);

% Keep condition that we start with rho_m = X*rho_phi
param.C = rho_phi0 * IC.a0^3 / X;