par.Gf = 1.1664e-11;  % Fermi constant in MeV^-2
par.G = 6.7065e-45;  % Newton's constant in MeV^-2
par.gstar = 100; % gstar as given in HW #6

par.m = 20358.8441;   % the value of m in Mev ; don't know where this comes from ...

mass = par.m
% current density of dark matter (experimental) = 0.24*rhoCrit) in MeV^4

par.rho0 = 8.2125888e-36;

par.T0 = 2.3266e-10;   % current temp in MeV

par.sigma = par.Gf^2.*par.m^2; % cross section (units: MeV^-2)

Teq = fzero(@(T) Rminus(T,par), 1000); % Solve for T at which R(T) = 1

rho0model = modrho(Teq,par); % Solve for Rho0 dark matter in this model

deltarho0 = rho0model - par.rho0 % Difference between model and observation

error = deltarho0./par.rho0   % error in model

fid = fopen('HW7.1.txt', 'wt');
fprintf(fid, '%1.3e\n', mass);
fprintf(fid, '%1.3e\n', rho0model);
fprintf(fid, '%1.3e\n', error);
