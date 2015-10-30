% pressure of the inflation

function z = p(phi,phidot,par)

z = (phidot.^2)./2 - V(phi,par);
