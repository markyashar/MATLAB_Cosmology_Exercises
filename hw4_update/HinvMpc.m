function [H] = HinvMpc(a,par)
% H in units of invers Mpc
H = sqrt(omegasum(a,par))*par.H100invMpc; 