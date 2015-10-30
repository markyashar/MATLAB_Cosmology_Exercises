function y = ChiSquared(a,mudata,sigma,omega)
val = ( (mudata - mutheory(a,omega)).^2)./(sigma).^2;
y = sum(val);

% Step #1: After taking in data from main, ChiSquared(...) runs
% chi^2 algorithm: val is calculated for each member of the Riess-Gold
% data set, and then returns the sum of the results.

% However, mu_theory also needs to be calculated, so the function
% mutheory(...) is called...