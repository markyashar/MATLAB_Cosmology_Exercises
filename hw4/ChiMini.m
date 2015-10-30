function [y,z] = ChiMini(a,mudata,sigma,omega)
val = mutheory(a,omega);
ChiNormal = @(mu)sum(((mudata - val + mu).^2)./(sigma.^2));
[mu,fval] = fminsearch(ChiNormal, 0);
y=mu;
z=fval;
load -ascii RiessGolds
% The function ChiMini(...) works almost exactly like ChiSquared(...)
% (as can be seen by the mutheory(...) call) but instead of just
% returning the mu_T results, this function takes that resultant, and
% minimizes chi^2 based on the equation for chi^2_min. It then returns
% both the minimized chi^2 value, as well as the mu_offset parameter.
