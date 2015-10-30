function H=getHubbleConst(a,phi, phidot,param)
H = sqrt((param.C ./ a.^3 + phidot.^2/2 + potential(phi,param)) ./ 3);
% H = sqrt(1./ a.^3 + phidot.^2/2 + potential(phi,param)) ./ sqrt(3);