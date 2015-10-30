function [chi_ans_kminus] = chifkminus(a,par)
% chi_ans = quad(@(x) deta(x,par), ainit, afin);
chi_ans_kminus = quad(@(x) detakminus(x,par), a(1,1), a(156,1));