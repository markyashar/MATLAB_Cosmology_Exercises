par.Gf = (292.8*10^3)^-2;
par.G = (1/1.2211e22)^2;
T=linspace(1,10);

hold on
for i = 3:3:30
    par.m = i;
    R = gamma(T,par)./H(T,par);
    plot(T,R);
    ylim([0 5])
end
hold off
xlabel('Temperature (MeV)')
ylabel('R value')

for i = 6:3:30
    par.m = i;
    Temp((i-3)/3) = fzero(@(T) roffset(T,par),5);
end

Mass = 6:3:30;
Table = [Mass;Temp];

fid = fopen('HW6table.txt','wt');
fprintf(fid, 'This table displays particle mass and equilibrium fallout temperature (both in MeV)\n');
fprintf(fid, ' (Equilibrium fallout is defined when R = 1, see main homework sheet for details)\n\n');
fprintf(fid, '\t\t\tMass (MeV) \t\t\t T_eqm (MeV)\n\n');
fprintf(fid, '\t\t\t    3\t\t\t\t     N/A\n\n');
fprintf(fid, '\t\t\t   %2.0f\t\t\t\t   %1.5f\n\n' ,Table);
fclose(fid);