% HW 7.6

par.G = (1.2211e19)^(-2);   % G in GeV^-2
par.T0 = 2.7/(1.1605e13);   % Temperature today in Gev

% par.m = 1e16;    % mass in GeV for problem 7.4

par.m = 5e11;     % mass in GeV for problem 7.5

par.a0 = 1e-50;   % arbitrary initial value for the scale factor


% ODE solver to solve for phi and phidot as a function of time

[T,Y] = ode45(@(t,y) HW7ode(t,y,par),[0 100*(par.m)^-1],[1e20 0]);

phi = Y(:,1);

phidot = Y(:,2);

rhophi = rho(phi,phidot,par);

pphi = p(phi,phidot,par);

wphi = (pphi)./(rhophi);

deltaH = delta(phi,phidot,par);


% integrating to find a(t)

length(T);

lna(1) = log(par.a0);

for i = 1:(length(T)-1)
    lna(i+1) = lna(i) + H(phi(i+1),phidot(i+1),par).*(T(i+1) - T(i));
end

% Problem 7.6 ii)

% Find rhoreheat from treheat --> 'timecell" #1495

treheat = T(1495);
phireheat = phi(1495);
phidotreheat = phidot(1495);

rhoreheat = rho(phireheat,phidotreheat,par);

% HW2.2 (modified for HW 7.6)

% This part of the program is just doing what HW 2.2 did. 
% Since gstar is constant for a < 1e-6, then we can take gstar
% to be 3.36, which is what it was at a = 1e-6. Thus, we can
% simply use the results from HW2.2 to obtain the energy density
% as a function of scale factor back to (the time of) the reheating
% scale factor

par.RHOc = 3.422e-47; % critical density in GeV^4
par.RHOr = 1.928e-51; % the current radiation density in GeV^4
par.RHOl = 2.464e-47; % the current lambda (dark energy) density in GeV^4
par.RHOm = 9.582e-48; % the current matter density in GeV^4

x = logspace(-50,10,10000);

y1 = Dr(x,par);    % energy density in radiation
y2 = Dm(x,par);    % energy density in matter
y3 = Dl(x,par);    % energy density in lambda


% The total energy density in matter, radiation, and lambda

rhotot = rhoSBB(x,par);

% Problem 7.6 iii)

% Plot of the total energy density from the standard big bang
% From this plot, the scale factor at reheating can be found by finding
% the scale factor when the total energy density equals the energy
% density from the scalar field at reheating. 
% This calue was determined in 7.6 ii) to be rhoreheat = 1.9953e62 GeV^4
% ~= 2.0401e62 GeV^4

figure(6)
loglog(x,rhotot);
title('\rho vs. scale factor for the Standard Big Bang (SBB)')
xlabel('a')
ylabel('\rho (Gev^4)')

% The value of the scale factor at reheating
areheat = 6.2298e-29;



% Problem 7.6 iv)

% Treheat
Treheat = par.T0/areheat;

z = logspace(log10(areheat),10,10000); % Starting the SBB at areheat
                                       % determined from 7.6 iii)
                                       
par.a0 = 1;    % current scale factor
par.ar = areheat;    % reheat scale factor

HBB = HSBB(z,par); % Finding H for the SBB as a function of scale factor
HdistSBB = 1./HBB; % Definition of the Hubble length for the SBB

par.L1000 = 1000*1.5637e38; % Comoving distance of 1000 Mpc today in GeV^-1
par.L100 = 100*1.5637e38; % Comoving distance of 100 Mpc today in Gev^-1
par.L1 = 1*1.5637e38; % Comoving distance of 1 Mpc today in GeV^-1

% 1000, 100, and 1 Mpc comoving distance at a = areheat in GeV^-1
L1000ar = par.L1000*par.ar/par.a0;
L100ar = par.L100*par.ar/par.a0;
L1ar = par.L1*par.ar/par.a0;

%1000, 100, and 1 Mpc comoving distance at a = reheat in Mpc
L1000arMpc = L1000ar*6.395e-39;
L100arMpc = L100ar*6.395e-39;
L1arMpc = L1ar*6.395e-39;


% As a function of a, any comoving distance is a straight line 
% L(a) = ma +b, where m is the slope and b is the y intercept.
% We have two ordered points: (ar, Lar) and (a0, Ltoday) so that we can
% solve for m and b.

% Slopes (i.e., m) for the co-moving distace functions

par.m1000 = (par.L1000 - L1000ar)/(par.a0 - par.ar);
par.m100 = (par.L100 - L100ar)/(par.a0 - par.ar);
par.m1 = (par.L1 - L1ar)/(par.a0 - par.ar);

% y-intercepts (i.e., b) for the comoving distances

par.b1000 = par.L1000 - par.m1000*par.a0;
par.b100 = par.L100 - par.m100*par.a0;
par.b1 = par.L1 - par.m1*par.a0;

% The comoving distances as a function of scale factor

L1000 = Comov1000(z,par);
L100 = Comov100(z,par);
L1 = Comov1(z,par);

% This figure plots the SBB Hubble distance as a function of scale factor
% as well as the three comoving distances as a function of scale factor

figure(7)
loglog(z,HdistSBB,'k');
xlim([areheat,1])
hold on
loglog(z,L1000,'g')
loglog(z,L100,'r')
loglog(z,L1,'b')
hold off

xlabel('a')
ylabel('distance (GeV^{-1})')



% Finding the three "re-entry" points from figure(7) 

% Value of a when the 1000 Mpc comoving distance equals the Hubble 
% distance
a1000 = fzero(@(a) root1000(a,par), .1);

% Value of a when the 100 Mpc comoving distance equals the Hubble distance
a100 = fzero(@(a) root100(a,par), 1e-3);

% Value of a when the 1 Mpc comoving distance equals the Hubble distance
a1 = fzero(@(a) root1(a,par), 1e-5);

% Rescaling a(t) for 7.7 - 7.8 to get
% ar(inflation) = ar(standard cosmology) = 6.2298e-29
% lnar(inflation) (for time cell 1495) was about 238, and thus ar was
% 2.3e103. To scale it, multiply by 6.2298e-29/2.3e103 = 2.71e-132.
% Thus lnar(new) = ln(2.71e-132) + lnar(old) = -302.9 + lnar(old)
% and the scale factor during inflation will be properly scaled
% to match the scale factor from the standard big bang reheating.

lnares = -302.9 + lna; % rescaled value of lna
ares = exp(lnares);    % rescaled value of a

% Plot of rescaled lna for 7.7 and 7.8

figure(8)
plot(T,lnares);
title('lna(t) (Rescaled to match a_r from the standard big bang)')
xlabel('t GeV^{-1})')
ylabel('lna(t)')

%  Problem 7.7

Hinfl = sqrt((8*pi*par.G/3).*rhophi); % H for inflation
Hdistinfl = 1./Hinfl;   % Hubble distance during inflation

% This next piece of the program pastes together the inflationary
% Hubble distance with the SBB Hubble distance at a = areheat to make a
% plot of the Hubble distance across the whole spectrum of scale factors

for i = 1:1490
    
    anew(i) = ares(i);
end

for i = 1:10000
    anew(i+1490) = z(i);
end
for i = 1:1490
    
    Hnew(i) = Hinfl(i);
end

for i = 1:10000
    Hnew(i+1490) = HBB(i);
end

% Hubble distance from before inflation ends until today

Hdistnew = 1./Hnew;

L1000new = Comov1000(anew,par);   % L1000 as a function of a
L100new  = Comov100(anew,par);    % L100 as a function of a
L1new = Comov1(anew,par);         %L1 as a function of a


% This figure plots the Hubble distance vs. the 3 comoving lengths from
% scale factor a = 1e-70 until today

figure(9)
loglog(anew,Hdistnew,'k');
xlim([1e-70,1])
hold on
loglog(anew,L1000new,'b--');
loglog(anew,L100new,'r:');
loglog(anew,L1new,'g-.');
xlabel('log(a)')
ylabel('log(distance) GeV^{-1}')
title('Hubble distance, L1000, L100, and L1 vs. scale factor')
legend('Hubble Distance','L1000','L100','L1')


% Values of the scale factor at Hubble exit for L1000, L100 and L1

a1000exit = 1.412e-54;
a100exit = 1.363e-53;
a1exit = 1.165e-51;

% This figure plots deltaH vs. scale factor so that we can eyeball 
% what deltaH is at the various Hubble exit scale factors found above


figure(10)
plot(ares,deltaH);
xlim([1e-56,1e-50])

% Values of deltaH at re-entry which was determined from figure(10) by 
% finding values of deltaH at Hubble exit

delta1000 = 1.023e-5;
delta100 = 1.005e-5;
delta1 = 9.699e-6;




