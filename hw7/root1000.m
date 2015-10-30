% function which finds the values where the SBB Hubble distance equals
% the 100 Mpc comoving distance

function y = root1000(x,par)

y = (1./HSBB(x,par)) - Comov1000(x,par);