% timesteps vector
t = [-3 : 0.001 :3 ];

% x(t)= 5t^2+2t -> the function
x = 5*power(t,2) + 2 * t;

% 0.5*x(t)
halfX = 0.5*x;
% 0.5*x(-t)
halfXFlip = 0.5*fliplr(x);

% even part 0.5*x(t) + 0.5*x(-t)
xEven = halfX + halfXFlip;
% even part 0.5*x(t)  -0.5*x(-t)
xOdd = halfX - halfXFlip;

% x(t) = xEven + xOdd
xSum = xEven + xOdd;



figure()
subplot(2,2,1)  
createPlot(t,xEven,'X Even','timesteps','0.5*x(t)+0.5*x(-t)','b')
subplot(2,2,2)
createPlot(t,xOdd,'X Odd','timesteps','0.5*x(t)-0.5*x(-t)','r')
subplot(2,2,3)
createPlot(t,xSum,'X Sum','timesteps','xEven + xOdd','k')
subplot(2,2,4)
createPlot(t,x,'X Normal','timesteps','x(t) = 5t^2+2t','m')


function createPlot(x,y,t,xl,yl,c)
    plot(x,y,c)
    title(t)
    xlabel(xl)
    ylabel(yl)
end


