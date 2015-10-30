function [womegam_ans] = womegam(a,par)
womegam_ans = (par.rhom0/par.rhoc0100)*a.^(-3)
