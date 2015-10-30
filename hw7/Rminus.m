% This function computes R(T) - 1 so we can compute the value of T
% for which R(T) = 1

function y = Rminus(T,par)

R = Gamma(T,par)./Htemp(T,par);

y = R -1;

