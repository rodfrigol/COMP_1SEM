function [A, B] = questao3()
% Use as variaveis simbolicas m, b e k para escrever sua resposta. Basta
% definir as matrizes A e B que serao retornadas pela funcao.

syms m b k

% criar matrizes A e B

A = [0 1; -k/m -b/m]
B = [0 1/m]

end