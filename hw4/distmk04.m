function [dmk0_ans] = distmk0(a,par)
% distance modulus in Mpc
dmk0_ans = 5*log10(dlumk04(a,par)) + 25;