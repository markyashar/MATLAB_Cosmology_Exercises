% clear
load -ascii RiessGoldz
load -ascii RiessGoldmu
load -ascii RiessGoldsigma
load -ascii RiessGolds
a = 1./(1+RiessGoldz);
sigma = RiessGoldsigma;
mudata = RiessGoldmu;

% initial seed values and equation forms
omega.m0 = 0.01;
omega.lam0 = 0.25;
omega.r0 = 4.002e-5;
omega.k0 = (0.65)^2 - omega.m0 - omega.lam0 - omega.r0;
omega.kabsolute = 3.336e-4*sqrt(abs(omega.k0));

for i = 1:20
    
    omega.lam0 = 0.25; % resets omega_lambda,0 at the end of each inner
    % loop.
    
    for j = 1:20
        
        omega.k0 = (0.65)^2 - omega.m0 - omega.lam0 - omega.r0;
        omega.kabsolute = 3.336e-4*sqrt(abs(omega.k0));
        % MuOffGrid = MuOffGrid(i.j);
        % ChiOffGrid = ChiOffGrid(i,j);
        % [MuOffGrid(i.j), ChiOffGrid(i,j)] = ChiMini(a,mudata,sigma,omega);
        [MuOffGrid(i,j), ChiOffGrid(i,j)] = ChiMini(a,mudata,sigma,omega);
        %ChiMini(a,mudata,sigma,omega)=[MuOffGrid(i.j), ChiOffGrid(i,j)];
        omega.lam0 = omega.lam0 + 0.005789473684;   % (0.36 - 0.25)/19  
        
    end
    
    omega.m0 = omega.m0 + 0.012631578947;   % (0.25 - 0.01)/19
    
end

% For Problem #4 (here), we need to seed a 20x20 grid of chi^2_min values,
% in the form of problem #3. The double loop in this problem does that,
% incrementing the values of omega_m,0 and omega_lambda,0 as necessary,
% and then inputs them into the Chimini(...) program/function. The end
% result is two 20x20 matrices, one for the chi^2_min values, and another
% for the mu_offset values,
% ChiMini
% MuOffGrid
% ChiOffGrid