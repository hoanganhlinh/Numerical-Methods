function [ ] = wizualizacja(a)
% WIZUALIZACJA      - tworzy wizualizacje wykresu funkcji p(t) na 
%                   przedziale [0,2*pi] i zaznacza odnalezione za pomocą 
%                   zeraFun miejsca zerowe danej funkcji
%
% dane wejściowe:
%           a - dany ciąg 
%
% dane wyjściowe:
%           (brak)

t = linspace(0,2*pi,1000);      % dziedzina 1. wykresu
pt = fun(t,a);                  % wartości 1. wykresu ( p(t) )

r = zeraFun(@fun,a)';           % odnalezione punkty zerowe
zera = zeros(1,length(r));      % (pomocnicze) wektor z samymi zerami

ox = zeros(1,length(t));        % (pomocnicze) wektor z samymi zerami - OX

h = abs(max(pt));               % (pomocnicze) abs na ograniczenie górne i dolne

plot(t,ox,'k--', t,pt,'b-', r,zera,'rx')
grid on
axis([0 2*pi -h h])
xlabel('t')
ylabel('p')
legend('OX','p(t)','zera')

end