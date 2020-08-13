function controlador = obterControladorLongitudinal()
% controlador = obterControladorLongitudinal() retorna uma struct com os
% parametros do controlador longitudinal:
% controlador.Kph: ganho proporcional do controlador de altitude.
% controlador.Kph: ganho derivativo do controlador de altitude.
% controlador.Kph: ganho proporcional do controlador de altitude.
% controlador.Kdh: ganho proporcional do controlador de altitude.
% controlador.a: parametro a do filtro usado no termo PD.

controlador.Kph = 0.00092;
controlador.Kdh = 0.000536;
controlador.Ktheta = 6.9515;
controlador.Kq = 1.9256;
controlador.a = 3.3727;


end