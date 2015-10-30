% function which finds the values where the SBB Hubble distance
% equals the 1 Mpc comoving distance

function y = root1(x,par)

y = (1./HSBB(x,par)) - Comov1(x,par);