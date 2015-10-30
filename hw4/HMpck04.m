function hmpck04_ans = HMpck04(somegam,somegal,par)
% global slomegam slomegal a;
% the value of Hubble's constant
hmpck04_ans = 100.*(somegam + somegal + par.rhor0).^(1/2);


