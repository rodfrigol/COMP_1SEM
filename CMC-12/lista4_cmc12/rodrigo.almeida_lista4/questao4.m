function x = questao4(m, b, Kp, Kv, t)
% Simule a resposta do carro autonomo a uma rampa unitária usando lsim.
% No caso, m eh a massa do carro, b eh uma constante de amortecimento, Kp
% eh o ganho proporcional, Kv eh o ganho de velocidade. Além disso,
% t = [t0, t1, ..., tf]^T eh um vetor com os tempos da simulacao. A saida
% da funcao eh x = [x0, x1, ..., xf]^T, que contem as posicoes do carro nos
% instantes de tempo considerados em t.
u = Kp*Kv*t

s = tf('s')
sys = 1/(m*s^2+(b+Kv)*s+Kp*Kv)

x = lsim(sys, u, t)

end
