format long
r = roots([0.01 0 1 0 -81 0 -36])



w = [0:1:100]';
mag = 1-0.5*sqrt(w);
fase = -20*sqrt(w);


function [GM, PM, wcg, wcp] = a(mag, fase, w)
% [GM, PM, wcg, wcp] = questao1(mag, fase, w) determina as margens de ganho
% e de fase a partir da resposta em frequencia de um sistema. mag (dB) e
% fase (graus) representam as magnitudes e fase da resposta em frequencia
% considerando as frequencias dadas por w (rad/s). GM e PM sao as margens
% de ganho e de fase, respectivamente, que sao medidas em wcg e wcp,
% respectivamente.
vw = [w(1):0.001:w(end)];
vmag = interp1(w, mag, vw);
vfase = interp1(w, fase, vw);

for i = 1:(length(vw)-1)
    if sign(vmag(i)) ~= sign(vmag(i+1))
        wcp = vw(i)
        PM = vfase(i) + 180
    end
    if sign(vfase(i)+180) ~= sign(vfase(i+1)+180)
        wcg = vw(i)
        GM = -vmag(i)
    end
end

end