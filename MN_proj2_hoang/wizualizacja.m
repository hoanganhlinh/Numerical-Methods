function [ ] = wizualizacja( steps, xMatr )
% WIZUALIZACJA      - tworzy wizualizacje kolejnych przybliżeń rozwiązania
%                   układu równań Ax=b, dla parametru relaksacji om.
%                   Wykres:
%                       OX - numer iteracji
%                       OY - przybliżone wartości wyniku x dla danej
%                       iteracji
%
% dane wejściowe:
%           A - macierz współczynników
%           b - wektor wyrazów wolnych
%           om - omega, parametr relaksacji
%
% dane wyjściowe:
%           (brak)

OX = 1:steps;

if steps>0
    figure
    hold on
    for i=1:length(xMatr(:,1))
        plot(OX,xMatr(i,:))
    end
    hold off
end
xlabel("k")
ylabel("x1,x2,...")

end