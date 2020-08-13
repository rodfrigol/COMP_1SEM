function [Kp, Kv] = questao2(R, Kt, J, b, wn, xi)
% Use as variaveis R, Kt, J, b, wn e xi para definir a sua resposta.
% Talvez voce nao precise de todas as variaveis para definir sua resposta.
% Definir Kp e Kv, que sao retornados pela funcao.

% Kp = ...
% Kv = ...

Kp = wn^2*R*J/(2*xi*wn*R*J-Kt^2-R*b);

Kv = 2*xi*wn*R*J/Kt - Kt - R*b/Kt;

end
