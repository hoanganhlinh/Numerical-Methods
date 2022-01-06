function [ found,new ] = secant( f,a,x0,x1 )
% SECANT    - funkcja przybliżająca wartość rzeczywistego miejsca zerowego ciągłej 
%           funkcji metodą siecznych, przy zadanych przybliżeniach początkowych 
%           x0 i x1
%
% dane wejściowe:
%           f - rozpatrywana funkcja
%           a - ciąg [a0 a1 ... aN]
%           x0 - pierwsze przybliżenie początkowe
%           x1 - drugie przybliżenie początkowe
%
% dane wyjściowe:
%           found - czy znaleziono odpowiednie przybliżenie (1-tak, 0-nie) 
%           new - znalezione przybliżenie miejsca zerowego

    found = 0;      % czy znalezione miejsce zerowe
    steps = 0;      % ile iteracji

    older = x0;     % x(n-1) w ogolnym przypadku, na poczatku x(0)
    old = x1;       % x(n) w ogolnym przypadku, na poczatku x(1)

    while ( steps < 10000000000 && f(old,a)~=f(older,a) )
        folder = f(older,a);    % f( x(n-1) )
        fold = f(old,a);        % f( x(n) )
        % odnajdywanie x(n+1) metodą siecznych
        new = old - fold*(old-older)/(fold-folder);
        
        d = .00000000001;
        
        % czy przedzial ma krańce różnych znaków
        sign = f(new-d,a)*f(new+d,a);
        if ( sign <= 0 && x0 <= new && new <= x1 && real(new) == new )
            found = 1;
            break;
        end
        
        if ( x0 > new || new > x1 )
            break;
        end
        
        % podmieniamy argumenty przy kolejnej iteracji
        older = old;
        old = new;
        
        steps = steps + 1;
    end
end