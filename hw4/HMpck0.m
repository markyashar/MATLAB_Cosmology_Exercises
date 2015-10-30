function [hmpck0_ans] = HMpck0(a,par)
% the value of Hubble's constant
hmpck0_ans = par.H0.*(lomegam(a,par) + lomegal(a,par) + lomegar(a,par)).^(1/2);


