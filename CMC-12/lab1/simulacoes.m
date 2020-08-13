a = load('data.mat');
[m,b]=identificarCruiseControl(a.data.f, a.data.t, a.data.v);

Kp = m/10 - b;
bc = b;
vr = 10;
d = 0;


b = b + 10


simular();


function simular()
    c = sim('cruise_control_fechada.slx');
    plot(c.v.time, c.v.signals.values,'LineWidth',1, 'color', 'red');
    title('Simulação após aumento de b')
    xlabel('Tempo(s)');
    ylabel('Velocidade(m/s)');
end 