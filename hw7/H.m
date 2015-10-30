% H during inflation

function z = H(phi,phidot,par)

z = sqrt(8*pi*par.G/3)*sqrt((1/2)*(phidot.^2) + V(phi,par));
