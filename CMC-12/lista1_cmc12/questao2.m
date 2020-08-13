t = [0:0.1:3];
x = f(t);
plot(t, x), xlabel('Tempo(s)'), ylabel('Posição(m)')

function x = f(t)
    k = sqrt(0.51)
    x = 1 - exp(-0.7*t).*cos(k*t) - (0.7/k)*exp(-0.7*t).*sin(k*t)
end 