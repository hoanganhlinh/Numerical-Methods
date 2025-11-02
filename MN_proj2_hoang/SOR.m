function [ steps, x, xMatr ] = SOR( A, b, om )
% SOR           - funkcja rozwiązuje układ równań Ax=b, dla parametru 
%               relaksacji om.
%
% dane wejściowe:
%           A - macierz współczynników
%           b - wektor wyrazów wolnych
%           om - omega, parametr relaksacji
%
% dane wyjściowe:
%           steps - liczba wykonanych iteracji
%           x - końcowe rozwiązanie układu równań
%           xMatr - macierz z kolejnymi przybliżeniami rozwiązania

if nargin < 3
    om = 1;
end

n = length(b);

xOld = zeros(n,1);
xNew = zeros(n,1);
x = (-1)*ones(n,1);
xMatr = zeros(n,1);

steps = 0;
d1 = 10^(-10);
d2 = 10^(-11);

[ zbiezna ] = czyZbiezna( A, om );
if zbiezna == 0
    x = [];
    return
end

% while steps < 10^20
while steps < 10^8
    for i = 1:n
        xNew(i) = (1-om)*xOld(i) + om*( b(i) - ...
            sum( A(i,1:i-1).*xNew(1:i-1)' ) - ...
            sum( A(i,i+1:n).*xOld(i+1:n)' ) ) / A(i,i);
    end

    xTmp = xNew-xOld;
    if sum( abs(xTmp),'all' ) < d1*sum( abs(xOld),'all' ) + d2
        break
    end

    steps = steps + 1;
    xMatr(:,steps) = xNew;
    xOld = xNew;

    if steps > 10^4
            steps = 0;
            x = [];
            xMatr = [];
        break
    end
end

x = xNew;

% [ Out ] = wypisz(xDokl,x)
end