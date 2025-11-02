%%
A1 = [1 2; 1 1];
b1 = [1;0];

wizIter(A1,b1)

%%
A2 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
b2 = [1;1;1;1];

wizIter(A2,b2)

[ steps2, x2, xMatr2 ] = SOR( A2, b2, 1 );

xDokl2 = A2\b2;

wypisz(xDokl2,x2);

%%
A3 = [3 -2 0; 4 3 0; -1 1 -1];
b3 = [1;1;1];

wizIter(A3,b3)

[ steps1, x1, xMatr1 ] = SOR( A3, b3, 0.9 )
[ steps2, x2, xMatr2 ] = SOR( A3, b3, 1 )

wizualizacja(steps1,xMatr1)
wizualizacja(steps2,xMatr2)

xDokl3 = A3\b3;

wypisz(xDokl3,x1)
wypisz(xDokl3,x2)

%%
A4 = [1 0 0 -3; 1 -1 0 0; 0 0 1 1; 0 0 -2 2];
b4 = [3;-1;-2;1];

wizIter(A4,b4)

[ steps1, x1, xMatr1 ] = SOR( A4, b4, 0.8 )

wizualizacja(steps1,xMatr1)

xDokl4 = A4\b4;

wypisz(xDokl4,x1)

%%
A5 = [5 5 2; 2 3 -4; 0 9 1];
b5 = [60;33;8];

wizIter(A5,b5)

[ steps1, x1, xMatr1 ] = SOR( A5, b5, 0.4 )

wizualizacja(steps1,xMatr1)

xDokl5 = A5\b5;

wypisz(xDokl5,x1)

%%
A6 = [2 5 0; 0 2 2; 1 0 9];
b6 = [36; 30; 84];

wizIter(A6,b6)

[ steps1, x1, xMatr1 ] = SOR( A6, b6, 0.9 )
[ steps2, x2, xMatr2 ] = SOR( A6, b6, 1.3 )

wizualizacja(steps1,xMatr1)
wizualizacja(steps2,xMatr2)

xDokl6 = A6\b6;

wypisz(xDokl6,x1)
wypisz(xDokl6,x2)

%%
A7 = [4 -1 0; -1 4 -1; 0 -1 4];
b7 = [2; 6; 2];

wizIter(A7,b7)            % parabola - wiercholek om= ~1.1

[ steps1, x1, xMatr1 ] = SOR( A7, b7, 1.1 )
[ steps2, x2, xMatr2 ] = SOR( A7, b7, 1.2 )
[ steps3, x3, xMatr3 ] = SOR( A7, b7, 0.2 )

% wizualizacja(steps1,xMatr1)
% wizualizacja(steps2,xMatr2)
% wizualizacja(steps3,xMatr3)

xDokl7 = A7\b7;

% wypisz(xDokl7,x1)
% wypisz(xDokl7,x2)
% wypisz(xDokl7,x3)
%%
A8 = [  1	1	1	1	1	1	1	1	1	1;...
        1	2	4	8	16	32	64	128	256	512;...
        1	3	9	27	81	243	729	2187	6561	19683;...
        1	4	16	64	256	1024	4096	16384	65536	262144;...
        1	5	25	125	625	3125	15625	78125	390625	1953125;...
        1	6	36	216	1296	7776	46656	279936	1679616	10077696;...
        1	7	49	343	2401	16807	117649	823543	5764801	40353607;...
        1	8	64	512	4096	32768	262144	2097152	16777216	134217728;...
        1	9	81	729	6561	59049	531441	4782969	43046721	387420489;...
        1	10	100	1000	10000	100000	1000000	10000000	100000000	1000000000];

b8 = ones(10,1)*10;

xDokl8 = A8\b8

[ steps1, x1, xMatr1 ] = SOR( A8, b8, 1 );
 
wypisz(xDokl8,x1)

%%
filename = 'A9.txt';
[A9,delimiterOut] = importdata(filename);
b9 = randi([1 50],50,1);

xDokl9 = A9\b9;

wizIter(A9,b9)

[ steps1, x1, xMatr1 ] = SOR( A9, b9, 1.05 );
wizualizacja(steps1,xMatr1)
disp(steps1)
 
[ steps2, x2, xMatr2 ] = SOR( A9, b9, 0.2 );
wizualizacja(steps2,xMatr2)
disp(steps2)

wypisz(xDokl9,x1)








