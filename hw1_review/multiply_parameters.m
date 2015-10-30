%Seem to be some problems here -- something might be missing in the
%solutions here
function nPar = multiply_parameters(const, par)
nPar.m = const*par.m;
nPar.b = const*par.b;

nPar.a = const*par.a;
nPar.c = const*par.c;

nPar.A = const*par.A;
nPar.f = const*par.f;
