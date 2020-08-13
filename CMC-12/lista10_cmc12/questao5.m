function [GR, GN, GD] = questao5(L, R, Kp, Ki, a)
% Determine a resposta em funcao de L, R, Kp, Ki e a. Escreva as funcoes de
% transferencia com o s de Laplace definido logo abaixo.

s = tf('s');

GR = ((s+a)*Ki)/(L*s^3+(L*a+R)*s^2+(R+Kp)*a*s+Ki*a)
GN = (-a*(Kp*s+Ki))/(L*s^3+(L*a+R)*s^2+(R+Kp)*a*s+Ki*a)
GD = (s*(s+a))/(L*s^3+(L*a+R)*s^2+(R+Kp)*a*s+Ki*a)

end