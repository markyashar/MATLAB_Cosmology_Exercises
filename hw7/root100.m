% function which finds the values where the SBB Hubble distance equals
% the 100 Mpc comoving distance

function y = root100(x,par)

y = (1./HSBB(x,par)) - Comov100(x,par);