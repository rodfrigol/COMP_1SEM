function y = questao1(w, Au, phiu, Kp, Kd, m, b)
% Determinar a saida em regime permanente senoidal assumindo referencia
% nula e perturbacao senoidal na forma d(t) = Ad * sin(w * t + phid).

% y = @(t)

t0 = (Kp-m*w^2);
t1 = (b+Kd)*w;

A = Au/sqrt(t0^2+t1^2);
phi = phiu-atan(t1/t0);

y = @(t) A*sin(w*t + phi);

end
