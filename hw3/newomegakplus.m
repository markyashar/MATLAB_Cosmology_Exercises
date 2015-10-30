function y = newomegakplus(a,par)
  y = par.rhokplus0*a.^(-2)./(par.rhokplus0*a.^(-2) + par.rhom0*a.^(-3) + par.rhor0*a.^(-4) + par.rhoL0*a.^(0))
