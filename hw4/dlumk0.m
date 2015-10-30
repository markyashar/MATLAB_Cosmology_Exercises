function [dlumk0_ans] = dlumk0(a,par)
% chi_ans = quad(@(x) deta(x,par), ainit, afin);
dlumk0_ans = quad(@(x) detak0(x,par),a(1),1);