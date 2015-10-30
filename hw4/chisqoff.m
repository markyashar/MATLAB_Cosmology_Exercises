function [chisqoff_ans] = chisqoff(muoff,par)
% muoff = fminsearch(@(x) chisqoff(x,par), 0);
global a;
global sigma;
global dmu;
% global muoff;
chisqoff_ans = ((par.dmu - distmk0(a,par) + fminsearch(@(x) chisqoff(x,par), 0)).^2)./(par.sigma.^2);