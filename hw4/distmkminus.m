function [dm_ans_kminus] = distmkminus(a,par)
% distance modulus in Mpc
dm_ans_kminus = 5*log10(dlumkminus(a,par)) + 25;