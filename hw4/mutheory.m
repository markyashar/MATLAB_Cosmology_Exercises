function y = mutheory(a, omega)
y = 5*log10(dlum(a,omega)) + 25;

% Step #2: mutheory(...) calculates the theoretical distance modulus
% for each member of RiessGold.mat (mu = 5log(d_L) + 25), but 
% d_L = dlum(...) is itself a function, so the dlum(...) function is 
% called ...