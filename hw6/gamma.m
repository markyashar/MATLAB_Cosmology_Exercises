function y = gamma(T,par)
y = 2*(par.m.*T./(2*pi)).^(3/2).*exp(-par.m./T).*par.Gf.^2.*par.m^2;

function y = H(T,par)

y = sqrt((8*pi*par.G/3)*((pi^2/30)*100).*T.^4);

function y = roffset(T,par)

y = gamma(T,par)./H(T,par) - 1;

