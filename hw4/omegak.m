function y = omegak(x, omega)
y = omega.k0./x.^2;

% Step #7A: We've finally hit the bottom here !! The next
% four functions evaluate omega_k, omega_r, omega_lambda, and omega_m
% (-- steps #7D, 7B, and 7C, respectively) as a function of redshift 
% (which is then converted to a), and then this information is compiled,
% operated on, and eventually sent beck to the top (i.e.,the main program).