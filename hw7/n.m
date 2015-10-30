% The number density as a function of T

function y = n(T,par)

y = 2*((par.m.*T)./(2*pi)).^(1.5).*exp(-par.m./T);


