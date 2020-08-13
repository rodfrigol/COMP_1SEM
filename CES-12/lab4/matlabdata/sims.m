path = 'C:\Users\rodri\Desktop\CES-12\lab4\labParadigm200609_1451\build\';
dc_40 = readmatrix(strcat(path, 'troco_DC40.csv'));
gr_br = readmatrix(strcat(path, 'troco_GR_BR200.csv'));
gr_gr = readmatrix(strcat(path, 'troco_GR_GRLoses.csv'));
pd_br = readmatrix(strcat(path, 'troco_PD_BR200.csv'));
pd_gr = readmatrix(strcat(path, 'troco_PD_GRLoses.csv'));

figure(1)
plot(dc_40(1:end-1,1), dc_40(1:end-1,2))
title('Tempo de execução DC')
xlabel('Valor do troco')
ylabel('Tempo(ms)')

figure(2)
plot(dc_40(1:end-1,1), dc_40(1:end-1,3))
title('Número de moedas DC')
xlabel('Valor do troco')
ylabel('Número de moedas')

figure(3)
plot(gr_br(1:end-1,1), gr_br(1:end-1,2))
title('Tempo de execução Greedy - Teste Brasil')
xlabel('Valor do troco')
ylabel('Tempo(ms)')

figure(4)
plot(gr_br(1:end-1,1), gr_br(1:end-1,3))
title('Número de moedas Greedy - Teste Brasil')
xlabel('Valor do troco')
ylabel('Número de moedas')

figure(5)
plot(gr_gr(1:end-1,1), gr_gr(1:end-1,2))
title('Tempo de execução Greedy - Teste GRLoses')
xlabel('Valor do troco')
ylabel('Tempo(ms)')

figure(6)
plot(gr_gr(1:end-1,1), gr_gr(1:end-1,3))
title('Número de moedas Greedy - Teste GRLoses')
xlabel('Valor do troco')
ylabel('Número de moedas')

figure(7)
plot(pd_br(1:end-1,1), pd_br(1:end-1,2))
title('Tempo de execução PD - Teste Brasil')
xlabel('Valor do troco')
ylabel('Tempo(ms)')

figure(8)
plot(pd_br(1:end-1,1), pd_br(1:end-1,3))
title('Número de moedas PD - Teste Brasil')
xlabel('Valor do troco')
ylabel('Número de moedas')

figure(9)
plot(pd_gr(1:end-1,1), pd_gr(1:end-1,2))
title('Tempo de execução PD - Teste GRLoses')
xlabel('Valor do troco')
ylabel('Tempo(ms)')

figure(10)
plot(pd_gr(1:end-1,1), pd_gr(1:end-1,3))
title('Número de moedas PD - Teste GRLoses')
xlabel('Valor do troco')
ylabel('Número de moedas')

figure(11)
plot(dc_40(1:end-1,1), dc_40(1:end-1,4))
title('Número de recursões DC')
xlabel('Valor do troco')
ylabel('Número de recursões')