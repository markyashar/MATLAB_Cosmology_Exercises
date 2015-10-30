function y = Integrator(a,omega);
[d,k] = size(a);
for i = 1:k
    val(i) = quad(@(x) integrand(x,omega), a(i),1);
end
y = val;

%Step #4: Integrator(...) handles the previous integration (in dlum.m), 
% but does so by taking each RiessGold a (or z) value as a limit. To 
% prevent matlab from getting confused, the exact form of the integral
% was kept in a separate file, integrand(...)