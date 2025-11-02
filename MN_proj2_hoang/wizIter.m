function [ ] = wizIter( A, b )
% WIZITER           - tworzy wizualizacje liczby wykonanych iteracji
%                   potrzebnych do rozwiązania układu równań Ax=b,
%                   względem parametru relaksacji om.
%                   Wykres:
%                       OX - omega na przedziale (0,2)
%                       OY - liczba wykonanych iteracji
%
% dane wejściowe:
%           A - macierz współczynników
%           b - wektor wyrazów wolnych
%
% dane wyjściowe:
%           (brak)

% omwekt = 0.1:0.1:1.9;
omwekt = 0.01:0.01:1.99;
iterwekt = zeros(1,1);

for i=1:199
%     disp(omwekt(i))         % wypisywanie omegi, można skomentować
    [ steps, x, xMatr ] = SOR( A, b, omwekt(i) );
    iterwekt(i) = steps;
end

figure
plot(omwekt,iterwekt)
axis([0 2 -5 500])
% axis([0 2 -1 5])
xlabel("omega")
ylabel("liczba iteracji")

end