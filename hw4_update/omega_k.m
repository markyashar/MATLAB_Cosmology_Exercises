function [ omega_k_answer ] = omega_k( a,par )
%omega_k curvature "density"
omega_k_answer = par.omega_k0*a.^(-2);