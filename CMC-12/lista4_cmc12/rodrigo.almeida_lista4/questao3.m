function G = questao3(J, b, R, L, Kt)
% Defina a funcao de transferencia G do motor eletrico usando tf ou zpk.
% Caso queira, pode usar o truque de definir s: s = tf('s');

% G = ...

s = tf('s')

G = Kt/(L*J*(s^3) + (R*J+L*b)*(s^2) + (R*b+Kt*Kt)*s)

end
