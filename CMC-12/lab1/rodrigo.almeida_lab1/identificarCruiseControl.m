function [m, b] = identificarCruiseControl(f, t, v)
% [m, b] = identificaCruiseControl(f, t, v) utiliza identificacao de
% sistemas para determinar parametros da planta do cruise control. Assume
% que foi realizado um experimento com forca constante f com o carro
% comecando em repouso. Nesse experimento, a velocidade do carro foi
% medida nos tempos t (t eh um vetor) e os resultados foram armazenados no
% vetor v. As saidas da funcao sao os parametros da planta: a massa m e o
% fator de amortecimento b.

e = exp(1);
% Implementar identificacao do cruise control

vf = v(end);
b = f/vf;

%o valor de tau será estimado a partir da velocidade no instante de tempo
%após o valor inicial t = 0, pois se utilzarmos um valor alto de tempo, o 
%valor do logarítmo calculado para determinar tau tende a infinito devido
%à precisão limitada do MATLAB, e o valor de tau consequentemente é dado
%como zero
if t(1)==0
    vi = v(2);
    ti = t(2);
else
    vi = v(1);
    ti = t(1);
end

tau = -ti/log(1-vi*b/f);
m = tau*b;

end