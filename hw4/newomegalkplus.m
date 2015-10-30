function y = newomegalkplus(a,par)
  y = par.rhoL0*a.^(0)./(par.rhokplus0*a.^(-2) + par.rhoL0*a.^(0) + par.rhom0*a.^(-3) + par.rhor0*a.^(-4))
