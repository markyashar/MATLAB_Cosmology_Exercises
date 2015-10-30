function V = potential(phi,param)

V = param.v0*(param.chi*(phi - param.beta).^2 + param.delta).*exp(-param.lambda.*phi);
