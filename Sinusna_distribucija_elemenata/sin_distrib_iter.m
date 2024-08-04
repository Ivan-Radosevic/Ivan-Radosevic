function [P] = sin_distrib_iter(dist,Lrel,N_elem)
% DISTRIBUCIJA TOČAKA PO JEDINIČNOJ DULJINI
% P su skalarne točke po jediničnoj duljini
% PARAMETAR dist: 
% [0 0] za linearno
% [1 0]/[0 1] za usitnjavanje prema kraju 
% [1 1] za usitnjavanje na oba kraja

i=0;
prebacaj = 1; % inicijalno
Lmin = 1 - sin(((N_elem-1)*pi/2)/N_elem);
if Lrel <= Lmin
    disp('Lrel <= Lmin (=f(N_elem))')
    P = sin(linspace(0, pi/2, N_elem+1));
else
Lrel_=0; % inicijalno
while abs(Lrel-Lrel_) > 0.001
    fi = acos(1/prebacaj);
    Lrel_ = (sin(pi/2-fi) - sin((pi/2-fi)*(N_elem-1)/N_elem)) *N_elem *prebacaj;
    prebacaj = prebacaj * (Lrel / Lrel_)^0.001;
    disp(Lrel_)
%     disp(fi*180/pi)
    i=i+1;
end
disp(i)
fi = acos(1/prebacaj); % korekcija po finalnom iznosu prebacaja
P = sin(linspace(0, pi/2-fi, N_elem+1)) *prebacaj;
end

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