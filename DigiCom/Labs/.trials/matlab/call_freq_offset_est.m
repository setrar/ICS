% Call the frequency offset function
load('rxsignal_withchannelandfreqoff.mat')

run('pss.m');

m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan);

Nf = NF2_chan-length(pss2_t)+1;

Fs = 61.44e6;

DELTA_F = 10;
f_min = -7500;
f_max = 7500;

m = f_min:DELTA_F:f_max;

% Grab the function Profs Frequency Offset with his values
freq_offset_est(rxs3,pss2_t, Nf, m, Fs)
% Detected_offset: 150 Hz
% ans = 