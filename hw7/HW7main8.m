% Problem 7.8
% Need to find and use areheat, anucleo, arad-mat, als (last-scattering),
% a1000, a100, a1

delta1000 = 1.023e-5;
delta100 = 1.005e-5;
delta1 = 9.699e-6;


par.als = 1/1100; %given in Problem #7.8
Tnucl = 1e-3;  % nucleosynthesis temp in Gev (Tnucl = 1 MeV is given in 
% problem statement).
par.anucl = par.T0./Tnucl;
par.aradmatt = 2.01e-4;   % from HW2.3

par.GeVtoK = 1.1605e13;   % Convert from GeV to K

% Temperatures in GeV

TradmattGeV = par.T0/par.aradmatt;
TlsGeV = par.T0./par.als;
TreheatGeV = Treheat;
TnuclGeV = Tnucl;
T1000GeV = par.T0./a1000;
T100GeV = par.T0./a100;
T1GeV = par.T0./a1;
T0GeV = par.T0;

% Temperatures in K

TradmattK = par.GeVtoK.*TradmattGeV;
TlsK = par.GeVtoK.*TlsGeV;
par.GeVtoK.*TreheatGeV;
TnuclK = par.GeVtoK.*TnuclGeV;
T1000K = par.GeVtoK.*T1000GeV;
T100K = par.GeVtoK.*T100GeV;
T1K = par.GeVtoK.*T1GeV;
T0K = par.GeVtoK.*T0GeV;
par.GeVinvtosec = 6.5822e-25;  % Convert from GeV^-1 to sec


% times in GeV^-1

treheatGeV = quad(@(a) Integ(a,par), areheat, areheat);
tnucleoGeV = quad(@(a) Integ(a,par), areheat, par.anucl);
tradmattGeV = quad(@(a) Integ(a,par), areheat, par.aradmatt);
tlsGeV = quad(@(a) Integ(a,par), areheat, par.als);
t1000GeV= quad(@(a) Integ(a,par), areheat, a1000);
t100GeV = quad(@(a) Integ(a,par), areheat, a100);
t1GeV = quad(@(a) Integ(a,par), areheat, a1);
t0GeV = quad(@(a) Integ(a,par), areheat, par.a0);


% times in sec

treheatsec = par.GeVinvtosec.*treheatGeV;
tnucleosec = par.GeVinvtosec.*tnucleoGeV;
tradmattsec = par.GeVinvtosec.*tradmattGeV;
tlssec = par.GeVinvtosec.*tlsGeV;
t1000sec = par.GeVinvtosec.*t1000GeV;
t100sec = par.GeVinvtosec.*t100GeV;
t1sec = par.GeVinvtosec.*t1GeV;
t0sec = par.GeVinvtosec.*t0GeV;


% Writing to a file

fid = fopen('HW7A.txt','wt');
fprintf(fid, '\t\t   HW7.4 and HW7.5\n\n');
fprintf(fid, ' As can be seen from the plot of deltaH vs. time with m = 1e16,\n');
fprintf(fid, ' deltaH is on the order of .5, which is about 10^5 than the\n');
fprintf(fid, ' realistic value of 10^-5.\n\n')
fprintf(fid, ' In HW7.5, we changed the value of mass unitl deltaH was near\n');
fprintf(fid, ' 10^-5. From the plot of deltaH with mass m = 5e11, deltaH is\n');
fprintf(fid, ' on the order of 10^-5, which agrees with the realistic value.\n');
fprintf(fid, ' Thus, we used m = 5e11 for the rest of the problem.\n\n\n');

fprintf(fid, '\n\t\t\tHW7.6\n\n');
fprintf(fid, 'i) reheat time\t\t\t\t6.00e-11 GeV^-1\nii) rophi reheat\t\t\t2.04e62 GeV^4\n');
fprintf(fid, 'iii) reheat scale factor\t\t%1.3e\n',areheat);
fprintf(fid, 'iv) reheat temperature\t\t\t%1.3GeV\n\n',Treheat);
fprintf(fid, 'v)\n\nComoving length\t\t\t\tComoving length\ntoday (in Mpc)\t\t\t\tat a = areheat (in Mpc)\n\n');
fprintf(fid, '1000\t\t\t\t\t%1.3e\n100\t\t\t\t\t%1.3e\n1\t\t\t\t\t%1.3e\n\n\n',L1000arMpc,L100arMpc,L1arMpc);
fprintf(fid, 'Comoving length\t\t\t\tScale factor\ntoday (in Mpc)\t\t\t\tat "re-entry"\n\n');
fprintf(fid, '1000\t\t\t\t\t%1.3e\n100\t\t\t\t\t%1.3e\n1\t\t\t\t\t%1.3e\n\n\n\n\n',a1000,a100,a1);
fprintf(fid, '\t\t\tHW7.7\n\n');
fprintf(fid, 'Comoving length\t\t\t\tScale factor\ntoday (in Mpc)\t\t\t\tat Hubble exit\n\n');
fprintf(fid, '1000\t\t\t\t\t%1.3e\n100\t\t\t\t\t%1.3e\n1\t\t\t\t\t%1.3e\n\n\n',a1000exit,a100exit,a1exit);

fprintf(fid, 'Comoving length\t\t\t\tDeltaH\ntoday (in Mpc)\t\t\t\tat "re-entry"\n\n');
fprintf(fid, '1000\t\t\t\t\t%1.3e\n100\t\t\t\t\t%1.3e\n1\t\t\t\t\t%1.3e',delta1000,delta100,delta1);
fclose(fid);

fid = fopen('HW7B.txt','wt');
fprintf(fid, '\n\t\t\t\t\t    HW7.8\n\n\n');
fprintf(fid, '\t\t\t\tT (GeV)\t\t\tT (K)\t\t\ttime (s)\n\n\n');
fprintf(fid, 'reheating\t\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',TreheatGeV,TreheatK,treheatsec);
fprintf(fid, 'nucleosynthesis\t\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',TnuclGeV,TnuclK,tnucleosec);
fprintf(fid, 'rad-matter equality\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',TradmattGeV,TradmattK,tradmattsec);
fprintf(fid, 'last scattering\t\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',TlsGeV,TlsK,tlssec);
fprintf(fid, '1000 Mpc re-entry\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',T1000GeV,T1000K,t1000sec);
fprintf(fid, '100 Mpc re-entry\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',T100GeV,T100K,t100sec);
fprintf(fid, '1 Mpc re-entry\t\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',T1GeV,T1K,t1sec);
fprintf(fid, 'today\t\t\t\t%1.3e\t\t%1.3e\t\t%1.3e\n\n',T0GeV,T0K,t0sec);

fclose(fid);

clear all





               
            
               
               