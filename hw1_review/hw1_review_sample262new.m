% HW1 - P262: Top level sample Matlab program for P262
% We've commented out the changes made to the original sample program 
% (B. Bozek)
% Variables have been renamed since these can be easily manipulated later
% in the program where the original variable names would not permit this
% adjustment, since each was considered a 1 x 1 structure, i.e., we can
% simply make the command par = 2 * par and double all the variables.
% However, naming the variables as they are below creates a 1 x 6 array
% that's easily manipulated. However, in order to make this work with the
% functions we had to also rename the variables in the functions as well.
% See Help Menu for more info. on this.

par.var = 1;
par.var(2) = 4;

par.var(3) = 3;
par.var(4) = 1;

par.var(5) = 1;
par.var(6) = 2*pi;

par.var = 2 * par.var; % variables are doubled here

x = linspace(0,1);
y1 = f1new(x,par);
y2 = f2new(x,par);
y3 = fSinnew(x,par);

figure; % This command keeps the plot you make as figure 1 and doesn't 
        % clear it with other calls to plot. The next plot called will be
        % figure 2 as opposed to clearing the original and making a new
        % figure 1.
plot(x,y1,'r');
hold on % this command causes the next plot to appear in the same figure
plot(x,y2,'b');
plot(x,y3,'k');
hold off

xlim([0,1]); % set axes limits
ylim([-3,12]); % limits changed here so that we can see the full range

xlabel('x axis')
ylabel('y axis')
title('Title')
legend('linear','quadratic','sine')
