w = [0.001:1:1000];
sys = tf([20], [1 1 0]);
[magnitude, fase] = questao3a(sys, w);
figure(1);
plot(log10(w), magnitude);
figure(2);
plot(log10(w), fase);
figure(3);
bode(sys);

function output = makeout(ptos_quebra, input, valini, incli)
inicio = input(1);

output = zeros(length(input),1)';

m=1;
for n = 1:length(ptos_quebra)
    fim = ptos_quebra(n).val;
    while input(m)>=inicio && input(m)<fim
        output(m) = valini + incli*log10(input(m)/inicio);
        m = m+1;
    end
    
    valini = valini + incli*log10(fim/inicio);
    
    incli = incli + ptos_quebra(n).var;
    inicio = fim;
end

while m<=length(input)
    output(m) = valini + incli*log10(input(m)/inicio);
    m = m+1;
end

end

function [magnitude, fase] = questao3a(sys, w)
% Calcula valores de magnitude e fase de uma aproximacao para tracado
% manual do diagrama de Bode da funcao de transferencia sys nas frequencias
% das por w. Os valores de magnitude e fase sao dados em dB e graus,
% respectivamente. Note que
% magnitude(i) = |sys(j * w(i)|,
% fase(i) = fase(sys(j * w(i)).

    zeros = sort(-zero(sys));
    polos = sort(-pole(sys));

    p = nnz(~polos) - nnz(~zeros);

    zeros = zeros(zeros~=0);
    polos = polos(polos~=0);

    a = 1;
    b = 1;
    i = 1;
    while a<=length(zeros) || b<=length(polos)
        if b>length(polos)
            ptos_quebra_mag(i).val = zeros(a);
            ptos_quebra_mag(i).var = +20;
            a = a+1;
        else if a > length(zeros)
                ptos_quebra_mag(i).val = polos(b);
                ptos_quebra_mag(i).var = -20;
                b = b+1;
            else if zeros(a)<polos(b)
                    ptos_quebra_mag(i).val = zeros(a);
                    ptos_quebra_mag(i).var = +20;
                    a = a+1;
                else
                    ptos_quebra_mag(i).val = polos(b);
                    ptos_quebra_mag(i).var = -20;
                    b = b+1;
                end
            end
        end
        i = i+1;
    end
    
    valini = 20*log10(evalfr(sys, 0)) - 20*p*log10(w(1));
    magnitude = makeout(ptos_quebra_mag, w, valini, -20*p);

    mais45 = sort([(1/10)*zeros 10*polos']);
    menos45 = sort([10*zeros (1/10)*polos']);
    a = 1;
    b = 1;
    i = 1;
    while a<=length(mais45) || b<=length(menos45)
        if b>length(menos45)
            ptos_quebra_fase(i).val = mais45(a);
            ptos_quebra_fase(i).var = +45;
            a = a+1;
        else if a > length(mais45)
                ptos_quebra_fase(i).val = menos45(b);
                ptos_quebra_fase(i).var = -45;
                b = b+1;
            else if mais45(a)<menos45(b)
                    ptos_quebra_fase(i).val = mais45(a);
                    ptos_quebra_fase(i).var = +45;
                    a = a+1;
                else
                    ptos_quebra_fase(i).val = menos45(b);
                    ptos_quebra_fase(i).var = -45;
                    b = b+1;
                end
            end
        end
        i = i+1;
    end

    fase = makeout(ptos_quebra_fase, w, -90*p, 0);

end
