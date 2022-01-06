function r = zeraFun(f,a)
% ZERAFUN   - funkcja znajdująca rzeczywiste miejsca zerowe 
%           zadanej funkcji za pomocą metody siecznych 
%           na przedziale [0,2*pi]
%
% dane wejściowe:
%           f - rozpatrywana funkcja
%           a - ciąg [a0 a1 ... aN]
%
% dane wyjściowe:
%           r - wektor zawierający znalezione miejsca zerowe

    x0 = 0;
    step = 0.001;
    x1 = x0 + step;
    
    rtmp = zeros(10000,1);
    size = 0;
    
    while ( x1 <= 2*pi )
        x1 = x0 + step;
        if ( f(x0,a)*f(x1,a) <= 0 ) %|| ( abs(f(x0,a))<.0000001 && abs(f(x1,a))<.0000001 ) )
            [found,v] = secant(f,a,x0,x1);
            if ( found == 1 && abs( f(v,a) ) < step )
                size = size + 1;
                rtmp(size) = v;
            end
        end
        x0 = x1;
    end

%     if ( abs(fun(pi,a)) < .0000001 )
%         size = size + 1;
%         rtmp(size) = pi;
%     end
%     if ( abs(fun(2*pi,a)) < .0000001 )
%         size = size + 1;
%         rtmp(size) = 2*pi;
%     end
% 
    if ( size > 0 )
        r = zeros(size,1);
        for i = 1:size
            r(i) = rtmp(i);
        end
%         r = sort(r);
    else
        r = [];
    end
end