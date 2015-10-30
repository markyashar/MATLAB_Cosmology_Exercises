function y = Hub(x, omega)
y = (3.336e-4).*sqrt(omegam(x,omega) + omegal(x,omega) + omegar(x,omega) + omegak(x,omega));

% Step #6: The function Hub(...) calculates the value of the Hubble const.
% at any given time, to be used in the integrand(...) function, but since
% H(a) is a function of the omega parameters , these functions (i.e., 
% omegar(...), omegak(...), omegal(...), omegam(...)) are called to help
% this calculation along ...