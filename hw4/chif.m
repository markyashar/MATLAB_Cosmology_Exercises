function [chi_ans] = chif(a,par)
% chi_ans = quad(@(x) deta(x,par), ainit, afin);
for i = 1:156
chi_ans = quad(@(x) deta(x,par), a(i,1) ,1);
end