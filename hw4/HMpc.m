function [hmpc_ans] = HMpc(a,par)
% the value of Hubble's constant
% hmpc_ans = par.H0*(lomegakplus(a,par) + lomegam(a,par) + lomegal(a,par) + lomegar(a,par)).^(1/2);
hmpc_ans = par.H0*(lomegam(a,par) + lomegal(a,par) + lomegar(a,par)).^(1/2);

