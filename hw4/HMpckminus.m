function [hmpc_ans_kminus] = HMpckminus(a,par)
% the value of Hubble's constant
hmpc_ans_kminus = (par.H0)*(lomegakminus(a,par) + lomegam(a,par) + lomegal(a,par) + lomegar(a,par)).^(1/2);


