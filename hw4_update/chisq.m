function [chisq_ans] = chisq(muoff,par)
chi =  (par.RG.mu-par.muTheory+muoff)./par.RG.sigma ;
chisq_ans = chi*chi';