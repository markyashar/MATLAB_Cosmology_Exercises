function [dm_ans] = distm(a,par)
% distance modulus in Mpc
dm_ans = 5*log10(chi1(a,par)./a(i,1)) + 25;