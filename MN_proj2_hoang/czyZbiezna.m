function [ zbiezna ] = czyZbiezna( A, om )
% CZYZBIEZNA    - funkcja sprawdza czy dla danej macierzy A i parametru 
%               relaksacji om, metoda SOR jest zbieżna globalnie.
%
% dane wejściowe:
%           A - macierz współczynników
%           om - omega, parametr relaksacji
%
% dane wyjściowe:
%           zbiezna - czy metoda SOR jest zbieżna globalnie (1-tak, 0-nie) 

n = length(A);
L = tril(A);
U = triu(A);
D = zeros(n);
d = diag(A);

for i=1:n
    L(i,i) = 0;
    U(i,i) = 0;
    D(i,i) = d(i);
end

% B = (D + om*L) \ ( (1-om)*D - om*U );
B = linsolve(D + om*L,(1-om)*D - om*U);

promSpec = max( abs(eig(B)) );
% eig(B)

% promSpec >= abs(om-1)
% norm(B)

if promSpec < 1
    zbiezna = 1;
else
    zbiezna = 0;
end

end