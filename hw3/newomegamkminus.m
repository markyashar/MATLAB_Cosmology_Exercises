function y = newomegamkminus(a,par)
  y = par.rhom0*a.^(-3)./(par.rhokminus0*a.^(-2) + par.rhom0*a.^(-3) + par.rhor0*a.^(-4) + par.rhoL0*a.^(0))
