function [ omega_m_ans ] = omega_m( a,par )
%RHOM Matter density
omega_m_ans = par.omega_m0*a.^(-3);
