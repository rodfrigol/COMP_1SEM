path = 'C:\Users\rodri\Desktop\CES-12\lab4\labParadigm200609_1451\build\';
bb_avis = readmatrix(strcat(path, 'SSP_Tests_Timed_BB_AVIS.dat'));
bb_evod = readmatrix(strcat(path, 'SSP_Tests_Timed_BB_EVOD.dat'));
bb_p3 = readmatrix(strcat(path, 'SSP_Tests_Timed_BB_P3.dat'));
bb_p4 = readmatrix(strcat(path, 'SSP_Tests_Timed_BB_P4.dat'));
bb_p5 = readmatrix(strcat(path, 'SSP_Tests_Timed_BB_P5.dat'));
bb_rand = readmatrix(strcat(path, 'SSP_Tests_Timed_BB_RAND.dat'));
dd_avis = readmatrix(strcat(path, 'SSP_Tests_Timed_DD_AVIS.dat'));
dd_evod = readmatrix(strcat(path, 'SSP_Tests_Timed_DD_EVOD.dat'));
dd_p3 = readmatrix(strcat(path, 'SSP_Tests_Timed_DD_P3.dat'));
dd_p4 = readmatrix(strcat(path, 'SSP_Tests_Timed_DD_P4.dat'));
dd_p5 = readmatrix(strcat(path, 'SSP_Tests_Timed_DD_P5.dat'));
dd_rand = readmatrix(strcat(path, 'SSP_Tests_Timed_DD_RAND.dat'));
pd_avis = readmatrix(strcat(path, 'SSP_Tests_Timed_PD_AVIS.dat'));
pd_evod = readmatrix(strcat(path, 'SSP_Tests_Timed_PD_EVOD.dat'));
pd_p3 = readmatrix(strcat(path, 'SSP_Tests_Timed_PD_P3.dat'));
pd_p4 = readmatrix(strcat(path, 'SSP_Tests_Timed_PD_P4.dat'));
pd_p5 = readmatrix(strcat(path, 'SSP_Tests_Timed_PD_P5.dat'));
pd_rand = readmatrix(strcat(path, 'SSP_Tests_Timed_PD_RAND.dat'));

figure(1)
plot(bb_p5(:,1), bb_p5(:,2))
title('BB P5')
xlabel('Tamanho input')
ylabel('Tempo(ms)')

figure(2)
plot(dd_p5(:,1), dd_p5(:,2))
title('DD P5')
xlabel('Tamanho input')
ylabel('Tempo(ms)')

figure(3)
plot(pd_p5(:,1), pd_p5(:,2))
title('PD P5')
xlabel('Tamanho input')
ylabel('Tempo(ms)')

