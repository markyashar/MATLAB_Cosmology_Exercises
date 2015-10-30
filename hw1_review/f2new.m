%Function f2new
function y = f2new(x,par)
% this function evaluates a quadratic function

y = par.var(3)*x.^2 + par.var(2)*x + par.var(4);
% The "." in "x.^2" is crucial. It tells matlab to produce a new vector
% the same length as x with the ith entry equal to x(i)^2. Without the
% "." matlab would produce an error. We could also write x.*x to get
% the same result. x*x would generate errors but x*x' would give the dot
% product between x and itself.