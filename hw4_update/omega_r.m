function [ omega_r_ans ] = omega_r( a,par )
%RHOM Matter density
omega_r_ans = par.omega_r0*a.^(-4);
