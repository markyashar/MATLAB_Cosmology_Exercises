function [ omegasum_ans ] = omegasum( a,par )
%RHO total density (no curvature)
omegasum_ans = omega_r(a,par) + omega_m(a,par) + omega_k(a,par) + omega_L(a,par);