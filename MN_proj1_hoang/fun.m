function [ pt ] = fun( t,a )
% FUN   - funkcja zwraca wartość p w punkcie t ( p(t) ),
%       z ciągiem a=[a0, a1, ..., aN]
%
% dane wejściowe:
%       t - argmument
%       a - ciąg [a0 a1 ... aN], N>=2
%
% dane wyjściowe:
%       pt - przybliżona wartość p(t)
%
%       z := x + i*y = cos(t) + i*sin(t)
%       x := cos(t), y := sin(t)

x = cos(t);
y = sin(t);

p = 2.*x';
q = -(x'.^2 + y'.^2);

len = length(a);
b = zeros( length(t), len+1 );
b(:, len+1) = 0;
b(:, len) = a(len);

for m = 2:len-1
    n = len+1 - m;
    b(:,n) = a(n) + p.*b(:,n+1) + q.*b(:,n+2);
end

if ( len ~= 0 )
    pt = a(1) + x'.*b(:,2) + q.*b(:,3);
    pt = pt';
else
    pt = ones(1,length(t)).*a(1);
end

end