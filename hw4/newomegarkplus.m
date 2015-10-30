function y = newomegarkplus(a,par)
  y = par.rhor0*a.^(-4)./(par.rhokplus0*a.^(-2) + par.rhor0*a.^(-4) + par.rhom0*a.^(-3) + par.rhoL0*a.^(0));
