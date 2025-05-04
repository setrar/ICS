pss00 = xcorr(pss0_t,pss0_t);
pss01 = xcorr(pss0_t,pss1_t);
pss02 = xcorr(pss0_t,pss2_t);
pss11 = xcorr(pss1_t,pss1_t);
pss12 = xcorr(pss1_t,pss2_t);
pss22 = xcorr(pss2_t,pss2_t);



subplot(321)
plot(abs(pss00))
plot(10*log10(abs(pss01)))

subplot(322)
plot(abs(pss11))
plot(10*log10(abs(pss02)))

subplot(323)

plot(real(pss0_t))

load('rxsignal_withchannelandfreqoff.mat')


m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));

[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 1000 10 60])
