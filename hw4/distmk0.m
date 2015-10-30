function [dmk0_ans] = distmk0(a,par)
% distance modulus in Mpc
dmk0_ans = 5*log10(dlumk0(a(:,1),par)) + 25;