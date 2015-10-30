% Initial conditions of the matter fields to duplicate the answer to 5.2

IC.phi0   =  5;

% We want to duplicate 5.2, so we should set
%     dot(phi)^2 = 2V(phi)
% initially
IC.dphidt0  =  sqrt(2*potential(IC.phi0,param));
IC.t0       =1;
IC.a0       =1;

rho_phi0 = (IC.dphidt0)^2/2 + potential(IC.phi0,param);

% We keep the condition that we start with rho_m = X*rho_phi
param.C = rho_phi0 * IC.a0^3 / X;
