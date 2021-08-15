% timesteps vector
t = [-3 : 0.001 :3 ];

p = X(2*t);
%h = X(t+5);
%s = customSin(t-2,params(1),params(2));
%m = X(t/3);
%z = X(4-2*t);

figure()
subplot(1,2,1)
createPlot(t,X(t),'Original','timesteps','X(t)','r')
subplot(1,2,2)
createPlot(t,p,'Modified','timesteps','X(2t)','b')





% x(t)= 5t^2+2t -> the function
function [res] = X(t)
    res = 5*power(t,2) + 2 * t;
end




function createPlot(x,y,t,xl,yl,c)
    plot(x,y,c)
    title(t)
    xlabel(xl)
    ylabel(yl)
end