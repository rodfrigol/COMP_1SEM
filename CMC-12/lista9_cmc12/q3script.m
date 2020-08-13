G = @(s) ((s+1).*(s.^2+4)).^(-1);
r = 1/32;
n = 1000000;

x = [1:1:n];

c1 = (x/1000 + 2 + r)*j;
Gc1 = G(c1);

c2 = (-x/1000 - 2 - r)*j;
Gc2 = G(c2);

c4 = r*cos((x/n-1/2)*pi) + (2+r*sin((x/n-1/2)*pi))*j;
Gc4  = G(c4);

c5 = r*cos((x/n-1/2)*pi) + (-2+r*sin((x/n-1/2)*pi))*j;
Gc5  = G(c5);

c6 = (-2+r + (4-2*r)*x/n)*j;
Gc6 = G(c6);

plot(real(Gc1), imag(Gc1), 'b')
hold on
plot(real(Gc2), imag(Gc2), 'r')
hold on
plot(real(Gc4), imag(Gc4), 'm')
hold on
plot(real(Gc5), imag(Gc5), 'k')
hold on
plot(real(Gc6), imag(Gc6), 'c')

xlabel('Re(G(s))')
ylabel('Im(G(s))')
legend('C1', 'C2', 'C4', 'C5', 'C6')

