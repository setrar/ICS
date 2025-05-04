% this is a 5G PRACH format 0 transmission
L = 839;

% this is number of samples per bin, floor(L/Ncs) gives the number of cyclic shifts, see below
Ncs = 26;
% this is the FFT size for the generation/reception of PRACH
N = 49152;
% this is the length of the cyclic prefix for PRACH
Ncp = 6336;

% 6-bit data messages for 3 transmitters / UEs
preamble_index1 = 63;
preamble_index2 = 31;
preamble_index3 = 11;

% up to 6 Zadoff-Chu root sequences for this format
utab = [129 710 140 699 120 719];
% number of cyclic shifts
nshifts = floor(L / Ncs);
% number of Zadoff-Chu sequences required
nseq = ceil(64 / nshifts);

% index of the preamble sequence to use
uind1 = floor(preamble_index1 / nshifts);
uind2 = floor(preamble_index2 / nshifts);
uind3 = floor(preamble_index3 / nshifts);
% index of cyclic shift to use
nuind1 = rem(preamble_index1, nshifts);
nuind2 = rem(preamble_index2, nshifts);
nuind3 = rem(preamble_index3, nshifts);
if (uind1 >= length(utab) || uind2 >= length(utab) || uind3 >= length(utab))
    fprintf("ERROR tab length %d : %d %d %d", length(utab), uind1, uind1, uind3)
end

% These are the Zadoff-Chu Sequence generators (time-domain)
% for the 3 transmitters
xu1 = exp(-1j * pi * utab(1 + uind1) * (0:838) .* (1:839) / 839);
xu2 = exp(-1j * pi * utab(1 + uind2) * (0:838) .* (1:839) / 839);
xu3 = exp(-1j * pi * utab(1 + uind3) * (0:838) .* (1:839) / 839);

% implement cyclic-shifts
% Note we do this in the time-domain and then do an 839-point fft here in MATLAB
% This is not usually done in practice because of the complexity of the FFT (i.e. a large prime number)
% There is a way to compute the Fourier transform directly and then perform the cyclic shift by a multiplication of a phasor in the frequency-domain.

yuv1 = zeros(1, length(xu1));
yuv2 = zeros(1, length(xu2));
yuv3 = zeros(1, length(xu3));

for n = 0:838
    xuv1(n + 1) = xu1(1 + rem(n + (Ncs * nuind1), 839));
    yuv1 = yuv1 + fft(xuv1(n + 1));
    
    xuv2(n + 1) = xu2(1 + rem(n + (Ncs * nuind2), 839));
    yuv2 = yuv2 + fft(xuv2(n + 1));
    
    xuv3(n + 1) = xu3(1 + rem(n + (Ncs * nuind3), 839));
    yuv3 = yuv3 + fft(xuv3(n + 1));
end

% put the PRACH in the lowest frequency (positive) subcarriers starting at carrier 7
Xuv1 = zeros(1, 49152);
Xuv1(7 + (1:839)) = yuv1;
Xuv2 = zeros(1, 49152);
Xuv2(7 + (1:839)) = yuv2;
Xuv3 = zeros(1, 49152);
Xuv3(7 + (1:839)) = yuv3;

% bring to time-domain
xuv1_49152 = ifft(Xuv1);
xuv2_49152 = ifft(Xuv2);
xuv3_49152 = ifft(Xuv3);

% add cyclic prefix
xuv1_49152 = [xuv1_49152((49152 - 6335):end) xuv1_49152];
xuv2_49152 = [xuv2_49152((49152 - 6335):end) xuv2_49152];
xuv3_49152 = [xuv3_49152((49152 - 6335):end) xuv3_49152];

% normalizes the transmit signal to unit-energy
xuv1_49152 = xuv1_49152 / sqrt(sum(abs(xuv1_49152).^2) / length(xuv1_49152));
en1 = mean(abs(xuv1_49152).^2);
xuv2_49152 = xuv2_49152 / sqrt(sum(abs(xuv2_49152).^2) / length(xuv2_49152));
en2 = mean(abs(xuv2_49152).^2);
xuv3_49152 = xuv3_49152 / sqrt(sum(abs(xuv3_49152).^2) / length(xuv3_49152));
en3 = mean(abs(xuv3_49152).^2);

% Plot the time-domain and frequency-domain waveform (xuv1)
figure;
subplot(2, 1, 1);
plot(xu1)
title('Time Domain Waveform');

subplot(2, 1, 2);
plot(xuv1_49152)
title('Frequency Domain Waveform');

% Question: What can you say regarding the frequency span (approximately how many PRBs does this waveform occupy
% 
% simulate time-delay
delay1 = 300;
delay2 = 140;
delay3 = 40;
delaymax = 1 + max([delay1 delay2 delay3]);
xuv1_49152 = [zeros(1, delay1) xuv1_49152 zeros(1, delaymax - delay1)];
xuv2_49152 = [zeros(1, delay2) xuv2_49152 zeros(1, delaymax - delay2)];
xuv3_49152 = [zeros(1, delay3) xuv3_49152 zeros(1, delaymax - delay3)];

SNR = 0;
snr = 10.^(0.1 * SNR);
noise1 = sqrt(0.5 / snr) * (randn(1, length(xuv1_49152)) + 1j * randn(1, length(xuv1_49152)));
noise2 = sqrt(0.5 / snr) * (randn(1, length(xuv1_49152)) + 1j * randn(1, length(xuv1_49152)));
rxsig1_justnoise = xuv1_49152 + noise1;
rxsig2_justnoise = xuv1_49152 + xuv2_49152 + xuv3_49152 + noise2;

% do TDL-C channel generation
fs = 61.44e6;
SCS = 30e3;
DS = 300e-9;

H1 = get_tdl(fs, SCS, [0:105], DS, 'tdlc');
H2 = get_tdl(fs, SCS, [0:105], DS, 'tdlc');
H3 = get_tdl(fs, SCS, [0:105], DS, 'tdlc');

rxsig3_noiseandchannel = conv(H1, xuv1_49152);
rxsig3_noiseandchannel = rxsig3_noiseandchannel + sqrt(0.5 / snr) * (randn(1, length(rxsig3_noiseandchannel)) + 1j * randn(1, length(rxsig3_noiseandchannel)));

rxsig4_noiseandchannel = conv(H1, xuv1_49152) + conv(H2, xuv2_49152) + conv(H3, xuv3_49152);
rxsig4_noiseandchannel = rxsig4_noiseandchannel + sqrt(0.5 / snr) * (randn(1, length(rxsig4_noiseandchannel)) + 1j * randn(1, length(rxsig4_noiseandchannel)));

;

% What to do now
% a) implement the receiver using a frequency-domain correlation
% using the Zadoff-Chu sequences generation method as above
% b) show how the data detection and time-delay estimation

% Frequency-domain correlation for receiver

% Ensure that the Zadoff-Chu sequences are of the same length as the received signal
M = length(rxsig4_noiseandchannel);

% Create the Zadoff-Chu sequences at the receiver using the same parameters
zadoff_chu1 = exp(-1j * pi * utab(1 + uind1) * (0:(M-1)) .* (1:M) / M);
zadoff_chu2 = exp(-1j * pi * utab(1 + uind2) * (0:(M-1)) .* (1:M) / M);
zadoff_chu3 = exp(-1j * pi * utab(1 + uind3) * (0:(M-1)) .* (1:M) / M);

% Perform frequency-domain correlation
correlation_result1 = ifft(fft(rxsig4_noiseandchannel) .* conj(fft(zadoff_chu1)));
correlation_result2 = ifft(fft(rxsig4_noiseandchannel) .* conj(fft(zadoff_chu2)));
correlation_result3 = ifft(fft(rxsig4_noiseandchannel) .* conj(fft(zadoff_chu3)));

% Display the correlation results
figure;
subplot(3, 1, 1);
plot(abs(correlation_result1));
title('Correlation Result for Zadoff-Chu Sequence 1');

subplot(3, 1, 2);
plot(abs(correlation_result2));
title('Correlation Result for Zadoff-Chu Sequence 2');

subplot(3, 1, 3);
plot(abs(correlation_result3));
title('Correlation Result for Zadoff-Chu Sequence 3');
