function y = integrand(x, omega);
y = 1./(x.^2.*Hub(x,omega));

% Step #5: integrand(...) contains the information regarding the form of 
% the "Chi" integral, but since H(a) is itself another function, this
% information was relayed to the integrand(...) function by another
% function, Hub(...)