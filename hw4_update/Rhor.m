function [ rho ] = Rhor( a,par )
%RHOR Radiation density
rho = par.rhor0*a.^(-4);
