% deltaH during inflation

function z = delta(phi,phidot,par)

z = (H(phi,phidot,par).*Vprime(phi,par))./((2*pi).*(phidot.^2));