% senoidan funciont taking ampplitude and frequency as user inputs

in1 = 'Enter amplitude: \n';
in2 = 'Enter frequency: \n';


a = input(in1);
w = input(in2);


t2  = [-pi : 0.01 :pi];
y = a*sin(t2 * w);




% First part of the exercise


% timesteps vector
t = [-3 : 0.001 :3 ];

% x(t)= 5t^2+2t

x = 5*power(t,2) + 2 * t;

figure()
plot(t2,y,'r')
format = [a,w];
txt = sprintf(' %d * Sin( t * %d )',format);
title('Customized Senoidal')
xlabel('timesteps')
ylabel(txt)
grid on

figure()
plot(t,x,'b')

title('Function: x(t) =  5t^2+2t')
xlabel('timesteps')
ylabel('x(t)')
grid on








