K_theta = 6.9515;
K_q = 1.9256;

planta = obterPlantaLongitudinal();
C = [0 0 1 0 0];
D = 0;
[num, den] = ss2tf(planta.A, planta.B, C, D);
G_q = tf(-num, den);
s = tf('s');
G_q = G_q * 1/s;
[y1, x1] = step(G_q);

[y2, x2] = step((G_q*K_theta)/(K_theta*G_q + s*K_q*G_q + 1));

figure

p1 = line(x1,y1,'Color','r');
hold on
legend('malha aberta');
xlabel('Tempo(s)')
ylabel('Posição(m)')
ax1 = gca; % current axes
ax1.XColor = 'r';
ax1.YColor = 'r';
ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
p2 = line(x2,y2,'Parent',ax2,'Color','k');
legend([p1 p2], 'malha aberta','malha fechada');
xlabel('Resposta ao degrau em malha aberta e fechada')

