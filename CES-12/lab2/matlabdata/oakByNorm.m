m = csvread("oak_search.csv");

tiledlayout(2,1)

nexttile
plot(m(:,2), m(:, 3))
hold on
plot(m(:,2), m(:, 4))
hold off
legend('STL', 'Aluno')
title('Buscas OakByNorm')
xlabel('N�mero de elementos')
ylabel('Tempo de busca (ms)')

nexttile
plot(m(:,2), m(:, 5))
hold on
plot(m(:,2), m(:, 6))
hold off
legend('STL', 'Aluno')
title('Inser��o OakByNorm')
xlabel('N�mero de inser��es')
ylabel('Tempo (ms)')
