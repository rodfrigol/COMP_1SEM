function controlador = projetarControladorCorrenteAnalitico(requisitos, planta)
% controlador = projetarControladorCorrenteAnalitico(requisitos, planta)
% projeta o controlador de corrente atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.wb: requisito de banda passante.
% requisitos.GM: requisito de margem de ganho.
% requisitos.PM: requisito de margem de fase.
% requisitos.fs: requisito de taxa de amostragem.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().
% A saida da funcao eh a struct controlador:
% controlador.K: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% controlador.Tl: parametro Tl da compensacao lead.
% controlador.T: periodo de amostragem do controlador de corrente.

controlador.T = 1.0 / requisitos.fs;

% Implementar
Ks = roots([1 2*(planta.L)*(requisitos.wb)^2 -((planta.L)^2*(requisitos.wb)^4 + (planta.R)^2*(requisitos.wb)^2)]);
controlador.K = Ks(Ks>0);

G = tf([controlador.K], [planta.L planta.R 0]);
[Gm,Pm,Wcg,Wcp] = margin(G);
phi = 60-Pm;
controlador.alpha = (1-sind(phi))/(1+sind(phi));
controlador.Tl = 1/(sqrt(controlador.alpha)*Wcp);

end