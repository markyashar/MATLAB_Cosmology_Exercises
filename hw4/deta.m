function [deta_ans] = deta(a,par)
% the value of d eta (conformal time) in Mpc
% deta_ans = 1./(a.^2.*HMpc(a,par));
% deta_ans = 1./(a.^(2).*HMpc(a,par));
% deta_ans = 1./(a.^(2).*HMpc);
deta_ans = 1./(a.^(2).*HMpc(a,par));