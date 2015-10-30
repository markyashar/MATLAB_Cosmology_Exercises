function [dlumk0_ans4] = dlumk04(a,par)
% chi_ans = quad(@(x) deta(x,par), ainit, afin);
dlumk0_ans4 = quad(@(x) detak04(x,par), a(1,1),1);