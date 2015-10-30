function dy = HW7ode(t,y,par)

dy = zeros(2,1);

dy(1) = y(2);

dy(2) = -3*H(y(1),y(2),par).*y(2) - Vprime(y(1),par);
