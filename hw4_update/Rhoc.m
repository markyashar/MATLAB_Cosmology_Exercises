function [ rhoc ] = Rhoc( a,par )
%RHO total density
rhoc = Rhor(a,par) + Rhom(a,par) + RhoL(a,par) + Rhok(a,par);