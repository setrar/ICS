
load rxsignal_justnoise.mat
load rxsignal_withchannel.mat
load rxsignal_withchannelandfreqoff.mat

pss

rxs=rxs3;
psscorr = abs(conv(rxs,fliplr(conj(pss2_t))));

figure(1)
subplot(333)
plot(abs(psscorr))

[psslev psspos] = max(psscorr);
psspos = psspos - length(pss2_t);

rpss = rxs(psspos + 144 + (1:2048));
rsss = rxs(psspos + 144 + 2048+144+2048+144+(1:2048));
Rpss = fft(rpss);
Rsss = fft(rsss);

%figure(2)
subplot(324)
plot(fftshift(abs(Rpss)),'x')

% figure(3)
subplot(322)
plot(fftshift(abs(Rsss)),'x');
axis([1024-120 1024+120 0 20000])

%figure(4)
subplot(421)
Rpss2 = fftshift(Rpss)
Rpss2 = Rpss2((1024-64):(1024+64));
plot(Rpss2, 'x')
ml = max(abs(Rpss2))
axis([-ml ml -ml ml]);

%figure(5)
subplot(422)
Rsss2 = fftshift(Rsss);
Rsss2 = Rsss2((1024-64):(1024+64));
plot(Rsss2, 'x')
axis([-ml ml -ml ml])
