function [d_ans_kminus] = dlumkminus(a,par)
% luminosity distance
d_ans_kminus = (a.^(-1)).*((par.h0)^(-1))*par.lh0*((par.rhokminus0/par.rhoc0100)^(-1/2)).*sin(((par.rhokminus0/par.rhoc0100)^(1/2))*(par.h0/par.lh0).*(chifkminus(a,par)));