function [ rho ] = Rhok( a,par )
%RHOk curvature "density"
rho = par.rhok0*a.^(-2);