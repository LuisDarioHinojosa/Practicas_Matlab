% timesteps vector
t = [-3 : 0.001 :3 ];

kPars = requestConstant();
pars = reqParams();
a = pars(1);
w = pars(2);
k = kPars(1);
kf = kPars(2);

% timeshift interval
tP = [-1.5 : 0.001 : 1.5 ];
tH = [-8 : 0.001 : -2 ];
tS = [-1 : 0.001 : 5 ];
tM = [-9 : 0.001 : 9];
tZ = [0.5 : 0.001 : 3.5 ];



n = customSin(t,a,w);
g = customSin(-1*t,a,w);
p = customSin(2*tP,a,w);
h = customSin(tH+5,a,w);
s = customSin(tS-2,a,w);
m = customSin(t/3,a,w);
z = customSin(4-2*tZ,a,w);


% constant $ fractional amplitude scaling 
t1 = sprintf("%d X(t)",k);
t2 = sprintf("%.1f X(t)",kf);
oriTitle = sprintf("Original: X(t) = %d sin(t + %d)",pars);

% k constants 
figure()
subplot(2,2,1)
createPlot(t,k*n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,2)
createPlot(t,n,'Modified','timesteps',t1,'b')
subplot(2,2,3)
createPlot(t,kf*n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,4)
createPlot(tP,p,oriTitle,'timesteps',t2,'b')


% points b,c
figure()
subplot(2,2,1)
createPlot(t,n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,2)
createPlot(t,g,'Modified','timesteps','X(-t)','b')
subplot(2,2,3)
createPlot(t,n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,4)
createPlot(tP,p,'Modified','timesteps','X(2t)','b')

% points d,e
figure()
subplot(2,2,1)
createPlot(t,n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,2)
createPlot(tH,h,'Modified','timesteps','X(t+5)','b')
subplot(2,2,3)
createPlot(t,n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,4)
createPlot(tS,s,'Modified','timesteps','X(t-2)','b')


% points f,h
figure()
subplot(2,2,1)
createPlot(t,n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,2)
createPlot(tH,m,'Modified','timesteps','X(t/3)','b')
subplot(2,2,3)
createPlot(t,n,oriTitle,'timesteps','X(t)','r')
subplot(2,2,4)
createPlot(tZ,z,'Modified','timesteps','X(4-2t)','b')

function [params] = requestConstant()
    k = input('Enter K value \n ');
    kf = input('Enter k fractional value \n ');
    params = [k,kf];
end


% user input for sin parameters
function [params] = reqParams()
    a = input('Enter Amplitude \n ');
    w = input('Enter Frequency \n ');
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