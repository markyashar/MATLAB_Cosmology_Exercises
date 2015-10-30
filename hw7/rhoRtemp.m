% Energy density in radiation as a function of T

function y = rhoRtemp(T,par)

y = ((pi^2)/30).*par.gstar.*(T.^4);