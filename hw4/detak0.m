function [detak0_ans] = detak0(a,par)
detak0_ans = 1./(a(:,1).^(2).*HMpck0(a,par));