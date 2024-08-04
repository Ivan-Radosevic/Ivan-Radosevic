function [P] = sin_distrib_exp(dist,Lrel,N_elem)
% pokusaj reguliranja usitnjenja pomocu eksponenta na cos, ne radi dobro

% DISTRIBUCIJA TOČAKA PO JEDINIČNOJ DULJINI
% P su skalarne točke po jediničnoj duljini
% PARAMETAR dist: 
% [0 0] za linearno
% [1 0]/[0 1] za usitnjavanje prema kraju 
% [1 1] za usitnjavanje na oba kraja

n = log(1- Lrel/N_elem) / log(cos(0.5*pi/N_elem));
P = sin(linspace(0, pi/2, N_elem+1)).^n;

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