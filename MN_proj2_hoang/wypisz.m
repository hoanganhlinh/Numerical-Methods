function [ Out ] = wypisz( xDokl, x )
% WYPISZ            - funkcja wypisuje tabelę z porównaniem dokładnego 
%                   i szacowanego wyniku, w kolejnych kolumnach:
%                       real - dokładny wynik
%                       aprox. - szacowany wynik
%                       blad - błąd bezwzględny
% 
% dane wejściowe:
%           xDokl - dokładny wynik
%           x - szacowany wynik
%
% dane wyjściowe:
%           Out - tabela z porównaniem dokładnego i szacowanego wyniku

Out = zeros(length(x),3);
Out(:,1) = xDokl;
Out(:,2) = x;
Out(:,3) = abs(xDokl-x);

colnames = {'real','aprox.','blad'};
Out = table(Out(:,1), Out(:,2),Out(:,3),'VariableNames', colnames);

% formatSpec = 'hline %5.4f & %5.4f & $%.4e$\n';
% for j=1:length(x)
%     fprintf(formatSpec,xDokl(j),x(j),abs(xDokl(j)-x(j)));
% end
% fprintf("\n");

end