% timesteps vector
t = [-3 : 0.001 :3 ];
% timeshift interval
tP = [-1.5 : 0.001 : 1.5 ];
tH = [-8 : 0.001 : -2 ];
tS = [-1 : 0.001 : 5 ];
tM = [-9 : 0.001 : 9]
tZ = [0.5 : 0.001 : 3.5 ];




g = X(-1*t);
p = X(2*tP);
h = X(tH+5);
s = X(tS-2);
m = X(t/3);
z = X(4-2*tZ);

%subplot(2,2,2)
% points b,c
figure()
subplot(2,2,1)
createPlot(t,X(t),'Original','timesteps','X(t)','r')
subplot(2,2,2)
createPlot(t,g,'Modified','timesteps','X(-t)','b')
subplot(2,2,3)
createPlot(t,X(t),'Original','timesteps','X(t)','r')
subplot(2,2,4)
createPlot(tP,p,'Modified','timesteps','X(2t)','b')

% points d,e
figure()
subplot(2,2,1)
createPlot(t,X(t),'Original','timesteps','X(t)','r')
subplot(2,2,2)
createPlot(tH,h,'Modified','timesteps','X(t+5)','b')
subplot(2,2,3)
createPlot(t,X(t),'Original','timesteps','X(t)','r')
subplot(2,2,4)
createPlot(tS,s,'Modified','timesteps','X(t-2)','b')


% points f,h
figure()
subplot(2,2,1)
createPlot(t,X(t),'Original','timesteps','X(t)','r')
subplot(2,2,2)
createPlot(tH,m,'Modified','timesteps','X(t/3)','b')
subplot(2,2,3)
createPlot(t,X(t),'Original','timesteps','X(t)','r')
subplot(2,2,4)
createPlot(tZ,z,'Modified','timesteps','X(4-2t)','b')



% user input for sin parameters
function [params] = reqParams()
    a = input('Enter Amplitude');
    w = input('Enter Frequency');
    params = [a,w];
    
end

% x(t)= 5t^2+2t -> the function
function [res] = X(t)
    res = 5*power(t,2) + 2 * t;
end

% receibes timesteps vector, amplitude and frequency
function [s] = customSin(t,a,w)
    s = a*sin(t * w);
end 


function createPlot(x,y,t,xl,yl,c)
    plot(x,y,c)
    title(t)
    xlabel(xl)
    ylabel(yl)
    grid on
end