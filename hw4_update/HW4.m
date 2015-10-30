% This file performs calcualtions for PHY 262 HW2

% Define parameters
% Tcmb = 2.75;
clear
Tcmb = 2.75;
% Tcmb = 2.7;
par.h0 = 0.65;
par.h0 = 2*0.65;
par.rhoc0 = 1.879e-29 * (par.h0)^2;
par.rhom0 = 0.28*par.rhoc0;
par.rhor0 = 4.8135e-34*(2.725/Tcmb)^4;
par.rhoL0 = 0.72*par.rhoc0;
par.rhok0 = 0 ;
par.rhok0 = -0.2*par.rhom0;
par.H100invMpc = 1/2997.9; % value of H^-1 in Mpc if h=1 (from K&T p503)
load -ascii RiessGolds
load -ascii RiessGoldz
load -ascii RiessGoldsigma
load -ascii RiessGoldmu
a = 1./(1+RiessGoldz);
par.Omega_mFid = .28;
par.Omega_m_sig = .1;

par.rhor0 = (1 + 0.68132)*par.rhor0; % add in neutrinos

par.rhoc0_100 = 1.8791e-29;
% par.rhoc0 = par.rhoc0/par.rhoc0_100;
par.omega_c0 = par.rhoc0/par.rhoc0_100;
par.omega_m0 = par.rhom0/par.rhoc0_100;
par.omega_r0 = par.rhor0/par.rhoc0_100;
par.omega_L0 = par.rhoL0/par.rhoc0_100;
par.omega_k0 = par.rhok0/par.rhoc0_100;

par.omega_m0 = par.omega_m0*2;

par.omega_m_min = .01;
par.omega_m_max = .25;
par.omega_mN = 20;
par.omega_L_min = .25;
par.omega_L_max = .36;
par.omega_LN = 20;
par.omega_m0Grid = linspace(par.omega_m_min,par.omega_m_max,par.omega_mN);
par.omega_L0Grid = linspace(par.omega_L_min,par.omega_L_max,par.omega_LN);

par.RG = RiessGolds;
par.RG.sigma = RiessGoldsigma';
par.RG.mu = RiessGoldmu';
for im = 1:length(par.omega_m0Grid)
    im
    par.omega_m0 = par.omega_m0Grid(im);
    for iL = 1:length(par.omega_L0Grid)
        par.omega_L0 = par.omega_L0Grid(iL);
        % par.omega_k0 = par.h0^2 - par.omega_m0 - par.omega_L0;
        par.omega_k0 = 0;
        Omegak = par.omega_k0/par.h0^2;
        Omegam = par.omega_m0/par.h0^2;
        OmegaL = par.omega_L0/par.h0^2;
        [Omegak, Omegam, OmegaL]
        chisqOmega_m = ((Omegam - par.Omega_mFid)/par.Omega_m_sig)^2;
        % chisqOmega_m = 0;
        try
            dLtheory = dLum(a,par);
            par.muTheory = 5*log10(dLtheory)+25;
            muoff = fminsearch(@(x) chisq(x,par), 0);
            chisqfinal(im,iL) = chisq(muoff,par)+chisqOmega_m;
            []
        catch
            chisqfinal(im,iL) = 1.e5;
        end
    end
end
P = exp(-chisqfinal);
N = max(max(P));
PN = P/N;
surf(par.omega_m0Grid,par.omega_L0Grid,PN);
surf(par.omega_m0Grid,par.omega_L0Grid,PN)
% contour2sig(par.omega_m0Grid,par.omega_L0Grid,PN);
xlabel('\omega_m')
ylabel('\omega_\Lambda')
