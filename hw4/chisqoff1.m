function [chisqoff_ans] = chisqoff(muoff,a,par)
% muoff = fminsearch(@(x) chisqoff(x,par), 0);
chisqoff_ans = ((par.dmu - distmk0(a,par) + muoff).^2)./(sigma.^2);