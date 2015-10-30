function dv = dVdPhi(phi, param)
diff_exp_part = -param.lambda.*potential(phi,param);
diff_quadratic = param.v0*2.*(phi - param.beta).*exp(-param.lambda.*phi);

dv = diff_exp_part + diff_quadratic;

