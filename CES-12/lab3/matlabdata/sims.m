path = 'C:\Users\rodri\Desktop\CES-12\lab3\labsort200423_1630\build\';
merge_iterative = readmatrix(strcat(path, 'MRG_I_MS_RAND_200_20000.csv'));
merge_recursive = readmatrix(strcat(path, 'MRG_R_MS_RAND_200_20000.csv'));
quick_1r_ao = readmatrix(strcat(path, 'QS_1R_MS_AO_200_20000.csv'));
quick_1r_rand = readmatrix(strcat(path, 'QS_1R_MS_RAND_200_20000.csv'));
quick_2r_ao = readmatrix(strcat(path, 'QS_2R_MS_AO_200_20000.csv'));
quick_2r_rand = readmatrix(strcat(path, 'QS_2R_MS_RAND_200_20000.csv'));
quick_fixed_ao = readmatrix(strcat(path, 'QS_FP_MS_AO_200_20000.csv'));
quick_fixed_rand = readmatrix(strcat(path, 'QS_FP_MS_RAND_200_20000.csv'));
radix = readmatrix(strcat(path, 'RADIX_MS_RAND_200_20000.csv'));
stl_ao = readmatrix(strcat(path, 'STL_SORT_MS_AO_200_20000.csv'));
stl_rand = readmatrix(strcat(path, 'STL_SORT_MS_RAND_200_20000.csv'));

plot(stl_ao(:, 3), stl_ao(:, 1), 'Color', 'black');
hold on
plot(quick_1r_ao(:, 3), quick_1r_ao(:, 1), 'Color', 'red');
hold off
legend('stl', 'aluno');
ylabel('Tempo(s)')
xlabel('Tamanho do vetor')
title('Tempo de execução vetores quase ordenados')