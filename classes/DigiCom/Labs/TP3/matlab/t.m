L = 839
tt = zeros(10,L);
xun = exp(-j*pi*129*(0:838).*(1:L)/L);
Xu(1,:) = fft(xun);