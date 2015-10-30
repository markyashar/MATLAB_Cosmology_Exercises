% Hw1.1 Review -- D. Martin's Version

par.m = 1;
par.b = 4;

par.a = 3
par.c = -1

par.A = 1; % matlab is case sensitive
par.f = 2*pi; % Note that pi is predefined in Matlab;

%This function multiplies all the parameters by 2
newPar = multiply_parameters(2,par);

x = linspace(0,1) % define vector x to be x coordinates
y1 = f1(x,newPar); % define vector of y coordinates
y2 = f2(x,newPar); % define another vector of y coordinates
y3 = fSin(x,newPar); %define another vector of y coordinates

plot(x,y1,'r');
hold on
plot(x,y2,'b');
plot(x,y3.'k');
hold off

xlim([0,1]);
% IMPORTANT: Changed axes from Andy's values, so that linear plot would fit
% on the graph
ylim([-3,10]);

xlabel('x axis')
ylabel('y axis')
title('Title')
legend('linear','quadratic','sine')