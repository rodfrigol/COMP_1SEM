function controlador = projetarControladorPosicaoAnalitico(requisitos, planta)
% controlador = projetarControladorPosicaoAnalitico(requisitos, planta)
% projeta o controlador de posicao atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.wb: requisito de banda passante.
% requisitos.GM: requisito de margem de ganho.
% requisitos.PM: requisito de margem de fase.
% requisitos.fs: requisito de taxa de amostragem.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().
% A saida da funcao eh a struct controlador:
% controlador.Kp: ganho proporcional do controlador de posicao.
% controlador.Kd: ganho derivativo do controlador de posicao.
% controlador.a: frequencia de corte do filtro do termo derivativo.
% controlador.T: periodo de amostragem do controlador de posicao.

controlador.T = 1.0 / requisitos.fs;

% Implementar

eps_req = requisitos.PM/100;
wn_req = requisitos.wb/sqrt(1 - 2*eps_req^2 + sqrt(4*eps_req^4 - 4*eps_req^2 + 2));


controlador.Kp = planta.Jeq*wn_req^2/(planta.N*planta.eta*planta.Kt);
controlador.Kd = (2*eps_req*wn_req*planta.Jeq - planta.Beq)/(planta.N*planta.eta*planta.Kt);
controlador.a = 10*requisitos.wb;

end