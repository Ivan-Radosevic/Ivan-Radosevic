function [P] = poli_distrib(Lstart,Lend,N,graf)
% DISTRIBUCIJA TOČAKA PO JEDINIČNOJ DULJINI
% P su skalarne točke po jediničnoj duljini
% L1, Lend -> relativna velicina prvog i zadnjeg segmenta u odnosu na 1/N (velicina linearnog segmenta)
Lend = Lend / N;
Lstart = Lstart / N;
a = (1-Lend + (N-1)/N *((Lstart-1/N)/(1/N^2-1/N) * 1/N - 1)) / (((N-1)/N)^3 + (N-1)/N *((1/N-1/N^3) / (1/N^2-1/N) * (-1/N) -1));
b = ((1/N - 1/N^3)*a -1/N +Lstart) / (1/N^2 - 1/N);
c = 1 -a -b;
x = linspace(0,1,N+1);
P = zeros(size(x));
for i = 1:length(x)
    P(i) = a*x(i)^3 + b*x(i)^2 + c*x(i);
end

if max(P) > 1 || min(P) < 0
    disp('Tocke izlaze iz domene [0 1]! Korigirati pocetni i krajnji nagib!')
end

if graf
    plot([1:length(P)]-1,P,'b')
    grid on
    axis tight

end