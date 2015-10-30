% This function computes the energy density of dark matter today based upon
% the value of m and the value of T when R(T) = 1, which is Teq.

%rhodarkmatter(a) = rho0*a^-3
% rhodarkmatter(T) = rho0*(T/T0)^3
% rho0 = rhodarkmatter(Teq)*(T0/Teq)^3
% rhodarkmatter(Teq) = m*n(Teq) for nonrelativistic matter

% Thus, rho0 = m*n(Teq)*(T0/Teq)^3

function y = modrho(Teq,par)

y = par.m*n(Teq,par)*(par.T0./(Teq)).^3;
