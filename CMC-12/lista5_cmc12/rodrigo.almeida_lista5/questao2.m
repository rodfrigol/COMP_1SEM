function ts = questao2(sys)
% Determinar numericamente o tempo de acomodacao de 2% ts do sistema
% dinamico sys

t = [0: 0.001 : 150];

[y, t] = step(sys, t);

limsup = 1.02*y(end);
liminf = 0.98*y(end);
in_range = 0
idx = 0

for i = 1:length(y)
    if y(i)>=liminf && y(i)<=limsup
        if not(in_range)
            in_range = 1
            idx = i
        end
    else
        if in_range
            in_range = 0
        end
    end
end

ts = t(idx);

end
