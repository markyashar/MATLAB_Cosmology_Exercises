function [ omegasum ] = omega( a,par )
%RHO total density (no curvature)
omegasum = omega_r(a,par) + omega_m(a,par) + omega_k(a,par) + omega_L(a,par);