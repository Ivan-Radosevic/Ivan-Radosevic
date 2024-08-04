N_elem=100;
dist = [0 1];
% Lrel = 0.5;
% P = sin_distrib_iter(dist,Lrel,N_elem);
% P = sin_distrib_linniz(dist,Lrel,N_elem);
Lmin = 5;
Lmax = 1;
P = poli_distrib(Lmin,Lmax,N_elem);

plot(1:length(P),P,'b')
grid on
axis tight
hold on