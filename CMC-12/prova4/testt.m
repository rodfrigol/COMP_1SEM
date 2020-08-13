format long


%k*(T*s+1)/((s^2+2*s)*(alpha*T*s+1));

K = 2.058;
a = 0.09941;
T = 3.4008;

x = conv([-(1+2*a*T) 0 K], [-(1+2*a*T) 0 K]);
y = conv([-a*T 0 2+K*T 0], [-a*T 0 2+K*T 0]);
roots([y(1) y(2) y(3)+x(1) y(4)+x(2) y(5)+x(3)-2*K^2*T^2 y(6)+x(4) y(7)+x(5)-2*K^2])



kk = roots([a^2*T^2 0 1+4*a^2*T^2 0 4-K^2*T^2 0 -K^2]);
r = kk(4);
h = K*(T*r*1i+1)/(r*1i*(r*1i+2)*(a*T*r*1i+1));
angle(h)*180/pi+180

