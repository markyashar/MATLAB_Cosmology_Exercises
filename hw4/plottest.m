par.m = 0.01;
par.l = 0.25;

for m = 1:20
    mvals(m) = par.m;
    par.m = par.m+0.012631578947;
end

for n = 1:20
    lvals(n) = par.l
    par.l = par.l+0.005789473684;
end

z = ChiOffGrid;
% z = .66e77*exp(-ChiOffGrid); % We have multiplied the un-normalized
% probability here by some arbitrary (huge, apparently) factor so that
% the "surfc" command does not choke on it.

surfc(lvals,mvals,z);
title('Minimum \chi^2 Values')
% title('Normalized Minimum \chi^2 Probabilities')

xlabel('\omega_\Lambda')
ylabel('\omega_m')

zlabel('\chi_m_i_n^2')
% zlabel('P((\omega_\Lambda,  \omega_m)) * .66e^7^7')

axis([.25 .36 .01 .25 170 230])
% axis([.25 .36 .01 .25 0 .8])


% Ultimately, problems #4 & #5 need 3-D graphs using the surf
% for this case, surfc) command. This program takes the 20 x 20 grid of
% chi^2_min values (called ChiOffGrid) and plots both the value of 
% chi^2_min and P(chi^2_min).
