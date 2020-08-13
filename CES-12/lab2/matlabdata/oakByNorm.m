m = csvread("oak_search.csv");

tiledlayout(2,1)

nexttile
plot(m(:,2), m(:, 3))
hold on
plot(m(:,2), m(:, 4))
hold off
legend('STL', 'Aluno')
title('Buscas OakByNorm')
xlabel('Número de elementos')
ylabel('Tempo de busca (ms)')

nexttile
plot(m(:,2), m(:, 5))
hold on
plot(m(:,2), m(:, 6))
hold off
legend('STL', 'Aluno')
title('Inserção OakByNorm')
xlabel('Número de inserções')
ylabel('Tempo (ms)')
