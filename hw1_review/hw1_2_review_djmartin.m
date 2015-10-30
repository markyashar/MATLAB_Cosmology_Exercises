% HW1.2 -- D. J. Martin's solutions
% Keep all of the parameters in a data structure
par.A1 = 1;
par.A2 = 1;
par.A3 = 1;

% set up the x values to calculate
x = linspace(0.1,1);
y1 = g(x,par.A1,-2);
y2 = g(x,par.A2,-3);
y3 = g(x,par.A3,-4);

% Make sure we're on figure 1
figure(1)

% now start plotting
plot(x,y1,'r');
hold on % makes other figures appear on the same plot, rather than 
        % replacing
plot(x,y2,'b');
plot(x,y3,'k');
hold off

% set axes
xlim([0.1,1])
ylim([0,10])

xlabel('x axis')
ylabel('y axis')
legend('1/x^2', '1/x^3', '1/x^4')

title('Inverse powers on a linear scale')

print -djpeg q2linear.jpg
     
figure(2)

loglog(x,y1,'r');
hold on 
loglog(x,y2,'b');
loglog(x,y3,'k');
hold off

% no need to set y axis this time, values are sensible on log scale
xlim([0.1,1])

xlabel('x axis')
ylabel('y axis')
legend('1/x^2', '1/x^3', '1/x^4')

title('Inverse powers on a linear scale')

print -djpeg q2log.jpg

