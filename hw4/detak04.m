function detak0_ans4 = detak04(a,somegam,somegal,par)
global slomegam slomegal a;
detak0_ans4 = 1./(a(:,1).^(2).*HMpck04(somegam,somegal,par));