wn = 6.44;
xi = 0.69;
sys = tf(wn^2, [1, 2*xi*wn, wn^2]);
[y, t] = step(sys);
plot(t, y)
title('Simula��o do projeto por fun��o step')
xlabel('Tempo(s)')
ylabel('Altura(m)')