function y = dlum(a, omega)
if omega.k0 < 0
    y = (1./a).*(1/omega.kabsolute).*sinh(omega.kabsolute.*Integrator(a,omega));
elseif omega.k0 > 0
    y = (1./a).*(1/omega.kabsolute).*sin(omega.kabsolute.*Integrator(a,omega));
else
    y = (1./a).*Integrator(a,omega);
end

% Step #3: dlum(...) calculates d_L for a given RiessGold member, but this
% will be different for different models, depending on the value of
% omega_k,0 (hence, the if statements). Regardless of which path is taken,
% however, d_L relies on a calculation of the 'Chi' integral, so another
% function, Integrator(...), is called to handle this ...