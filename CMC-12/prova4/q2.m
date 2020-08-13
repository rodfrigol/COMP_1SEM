
K = 2.058;
a = 0.09941;
T = 3.4008;

sys = tf([K*T K], [a*T 1+2*a*T 2 0]);
fechada = feedback(sys, 1);

t = 0:0.01:20;   
u = t*0+1;
%lsim(fechada, u, t)
%margin(sys)
bode(fechada)