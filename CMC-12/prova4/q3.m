
K = 3657.6;
T = 0.8;
a = 5.44;

Gact = tf([10], [1 10]);
Gs = tf([1], [500 100]);
C = tf([K*a*T K*a], [a*T 1]);

aberta = Gact*Gs*C;
fechada = feedback(aberta, 1);

t = 0:0.01:5;   
u = t*0+1;
lsim(fechada, u, t)

%margin(aberta)