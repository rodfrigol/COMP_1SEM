wn = 6.44;
xi = 0.69;
sys = tf(wn^2, [1, 2*xi*wn, wn^2]);
[y, t] = step(sys);
plot(t, y)
title('Simulação do projeto por função step')
xlabel('Tempo(s)')
ylabel('Altura(m)')