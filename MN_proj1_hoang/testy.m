lp = 7
A = zeros(lp,1);
R0 = zeros(lp,1);
R = zeros(lp,1);
B = zeros(lp,1);

%% 1
% brak miejsc zerowych y=1
% a = [1]
A(1,1) = [1];

%% 2
% y=0 - błąd
% a = [0]
A(2,1) = [0];

%% 3
% ok
% a = [1 2 3]
A(3,1:3) = [1 2 3];
R0(3,1:4) = [1.12158 2.4458 3.83731 5.1616];

%% 4
% ok - N małe => mało zer
% a = [1 1 1 1]
A(4,1:4) = [1 1 1 1];
% R0(4,1:5) = [pi/3 pi/2 pi 3*pi/2 5*pi/3];
R0(4,1:4) = [pi/3 pi/2 3*pi/2 5*pi/3];

%% 5
% ok - N małe => mało zer
% a = [1 -1]
A(5,1:2) = [1 -1];
R0(5,1:2) = [0 2*pi];

%% 6
% ok - N duże => dużo
% a = ones(1,10000);
A(6,1:10) = ones(1,10);
R0(6,1:17) = [.349066 .628319 1.0472 1.25664 1.74533 1.88496 2.44346 2.51327 pi 3.76991 3.83972 4.39823 4.53786 5.02655 5.23599 5.65487 5.93412];

%% 7
A(7,1:6) = [1 -1 1 -1 1 -1];
% R0(7,1:17) = [.349066 .628319 1.0472 1.25664 1.74533 1.88496 2.44346 2.51327 pi 3.76991 3.83972 4.39823 4.53786 5.02655 5.23599 5.65487 5.93412];

%%
for i=1:7
    if i~=2
        a = A(i,:);

        r = zeraFun(@fun,a);
        r = r';
        R(i,1:length(r)) = r';

        len = length(r);
        r0 = R0(i,1:len);

        if len>0
            blad = abs(r0-r);
            B(i,1:len) = blad;
        end
    end
end

% A   % testy
% R0  % poprawne wyniki
% R   % moje wyniki
% B   % błąd

t = linspace(0,2*pi,1000);
ox = zeros(1,length(t));

figure
ind = 1;
for i=1:7
    if i~=2
        a = A(i,:);
        subplot(2,3,ind)
        ind = ind+1;
%         figure
        wizualizacja(a);
        title("Test " + i + ".")

%         fileID = fopen("Test "+ i +".txt",'w');
% %         formatSpec = '%5.4f & %5.4f & $%.4e$ & $%.4e$\n';
%         formatSpec = '%5.4f & %5.4f & $%.4e$\n';
%         for j=1:length(B(i,:))
% %             fprintf(fileID,formatSpec,R0(i,j),R(i,j),B(i,j),Bwz(i,j));
%             fprintf(fileID,formatSpec,R0(i,j),R(i,j),B(i,j));
%         end
%         fclose(fileID);
    end
end

sgtitle('WIZUALIZACJA WYNIKÓW', 'Fontsize', 20, 'FontWeight', 'bold')

