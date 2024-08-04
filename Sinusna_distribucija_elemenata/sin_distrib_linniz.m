function [P] = sin_distrib_linniz(dist,Lrel,N)
% DISTRIBUCIJA TOČAKA PO JEDINIČNOJ DULJINI
% P su skalarne točke po jediničnoj duljini
% PARAMETAR dist: 
% [0 0] za linearno
% [1 0]/[0 1] za usitnjavanje prema kraju 
% [1 1] za usitnjavanje na oba kraja

P = zeros(1,N+1);
i = Lrel * (N-1) / (N - Lrel);
P(1) = 0; 
P(2) = i;
for j = 1:N-1
    P(j+2) = P(j+1) + j;
end
P = P ./ P(end);

% fi=acos(1/prebacaj); % kut na kojem se radijus s prebačajem projicira na jedinični radijus
% if dist == [0 0] % linearna podjela
%     P = linspace(0, 1, N_elem+1);
% elseif dist == [0 1] % usitnjavanje prema vanjskom kraju
%     P = sin(linspace(0, pi/2-fi, N_elem+1)) *prebacaj;
% elseif dist == [1 0] % usitnjavanje prema unutarnjem kraju
%     P_ = sin(linspace(0, pi/2-fi, N_elem+1)) *prebacaj;
%     P = (1 - flip(P_));
%     P(1) = 0; P(end) = 1; % zbog numeričkih grešaka
% elseif dist == [1 1]
%     P = ((sin(linspace(-pi/2+fi, pi/2-fi, N_elem+1)) *prebacaj/2) +0.5);
%     P(1) = 0; P(end) = 1; % zbog numeričkih grešaka
% end
end