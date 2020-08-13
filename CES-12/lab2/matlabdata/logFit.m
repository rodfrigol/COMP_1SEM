m = csvread("oak_search.csv");

tiledlayout(2,1)

myfittype = fittype('a + b*log(x)',...
'dependent',{'y'},'independent',{'x'},...
'coefficients',{'a','b'});

nexttile
plot(m(:,2), m(:, 4))
hold on
myfit=fit(m(:,2), m(:, 4), myfittype, 'StartPoint',[1 1]);
plot(myfit)
hold off
legend('Aluno', 'Fit logarítmico')
title('Buscas Aluno O(log n)')
xlabel('Número de elementos')
ylabel('Tempo de busca (ms)')

nexttile
plot(m(:,2), m(:, 6))
hold on
myfit=fit(m(:,2), m(:, 6), myfittype, 'StartPoint',[1 1]);
plot(myfit)
hold off
legend('Aluno', 'Fit logarítmico')
title('Inserções Aluno O(log n)')
xlabel('Número de inserções')
ylabel('Tempo (ms)')