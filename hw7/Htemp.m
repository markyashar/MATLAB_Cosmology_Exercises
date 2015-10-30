% H(T) for the radiation era

function y = Htemp(T,par)

y = sqrt(((8*pi*par.G)/3) * rhoRtemp(T,par));
