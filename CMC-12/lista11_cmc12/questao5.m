function u = questao5(wn, xi, T, ua, uaa, e, ea, eaa)
% Escreva a expressao da lei de controle discreta para implementacao em
% computador de um filtro com funcao de transferencia de sistema de segunda
% ordem padrao.
% wn: frequencia natural.
% xi: fator de amortecimento.
% T: periodo de amostragem.
% ua: u[k-1].
% uaa: u[k-2].
% e: e[k].
% ea: e[k-1].
% eaa: e[k-2].
% u: u[k].

denom = (4+4*xi*wn*T+T^2*wn^2);

num = (8-2*T^2*wn^2)*ua+(-4+4*xi*wn*T-T^2*wn^2)*uaa+(T^2*wn^2)*(e+2*ea+eaa);

u = num/denom;

end
