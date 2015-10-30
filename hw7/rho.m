% energy density of inflation

function z = rho(phi,phidot,par)

z = (phidot.^2)./2 + V(phi,par);