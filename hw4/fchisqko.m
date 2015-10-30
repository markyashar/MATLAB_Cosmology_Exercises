function [chi2k0_ans] = fchisqko(a,par) 

chi2k0_ans = sum(((RiessGold(i,2) - distmk0(a,par)).^2)./((sigma.^2)));