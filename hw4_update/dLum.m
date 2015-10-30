function [dLum_ans] = dLum(a,par)
% calculate luminosity distance to redshift "a"  (see eqn 5.12 of my FRW
% notes)
for i = 1:length(a) % allow for a to be a vector.  Loop through it
    chi = quad(@(x) deta(x,par),a(i),1);
    k = par.H100invMpc*sqrt(abs(omega_k(a(i),par)));
    if k < 0
        dLum_ans(i) = (a(i)*k)^(-1) * sinh(k*chi);
    elseif k == 0
        dLum_ans(i) = chi/a(i);
    else
        dLum_ans(i) = (a(i)*k)^(-1) * sin(k*chi);
    end
end