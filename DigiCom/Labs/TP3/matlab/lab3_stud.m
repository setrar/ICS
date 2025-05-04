% this is a 5G PRACH format 0 transmission
L=839

% this is number of samples per bin, floor(L/Ncs) gives the number of cyclic shifts, see below
Ncs=26
% this is the FFT size for the generation/reception of PRACH
N=49152
% this is the length of the cyclic prefix for PRACH
Ncp=6336


% 6-bit data messages for 3 transmitters / UEs
preamble_index1=63;
preamble_index2=31;
preamble_index3=11;

% up to 6 Zadoff-Chu root sequences for this format
utab=[129 710 140 699 120 719]
% number of cyclic shifts
nshifts = floor(L/Ncs);
% number of Zadoff-Chu sequences required
nseq = ceil(64/nshifts);

% index of the preamble sequence to use
uind1=floor(preamble_index1/nshifts)
uind2=floor(preamble_index2/nshifts)
uind3=floor(preamble_index3/nshifts)
% index of cyclic shift to use
nuind1=rem(preamble_index1,nshifts)
nuind2=rem(preamble_index2,nshifts)
nuind3=rem(preamble_index3,nshifts)
if (uind1>=length(utab) || uind2>=length(utab) || uind3>=length(utab)) 
  fprintf("ERROR tab length %d : %d %d %d",length(utab),uind1,uind1,uind3) 
end

% These are the Zadoff-Chu Sequence generators (time-domain) 
% for the 3 transmitters
xu1 = exp(-j*pi*utab(1+uind1)*(0:838).*(1:839)/839);
xu2 = exp(-j*pi*utab(1+uind2)*(0:838).*(1:839)/839);
xu3 = exp(-j*pi*utab(1+uind3)*(0:838).*(1:839)/839);

% implement cyclic-shifts
% Note we do this in the time-domain and then do an 839-point fft here in MATLAB
% This is not usually done in practice because of the complexity of the FFT (i.e. a large prime number)
% There is a way to compute the Fourier transform directly and then perform the cyclic shift by a multiplication of a phasor in the frequency-domain.

xuv1 = xu1; 
xuv2 = xu2;
xuv3 = xu3;
for (n=0:838)
  xuv1(n+1) = xu1(1+rem(n+(Ncs*nuind1),839));
  yuv1 = fft(xuv1);
  xuv2(n+1) = xu2(1+rem(n+(Ncs*nuind2),839));
  yuv2 = fft(xuv2);
  xuv3(n+1) = xu3(1+rem(n+(Ncs*nuind3),839));
  yuv3 = fft(xuv3);
end

% put the PRACH in the lowest frequency (positive) subcarriers starting at carrier 7
Xuv1 = zeros(1,49152);
Xuv1(7+(1:839)) = yuv1;
Xuv2 = zeros(1,49152);
Xuv2(7+(1:839)) = yuv2;
Xuv3 = zeros(1,49152);
Xuv3(7+(1:839)) = yuv3;

% bring to time-domain
xuv1_49152 = ifft(Xuv1);
xuv2_49152 = ifft(Xuv2);
xuv3_49152 = ifft(Xuv3);

% add cyclic prefix
xuv1_49152 = [xuv1_49152((49152-6335):end) xuv1_49152];
xuv2_49152 = [xuv2_49152((49152-6335):end) xuv2_49152];
xuv3_49152 = [xuv3_49152((49152-6335):end) xuv3_49152];

% normalizes the transmit signal to unit-energy
xuv1_49152 = xuv1_49152/sqrt(sum(abs(xuv1_49152).^2)/length(xuv1_49152));
en1=mean(abs(xuv1_49152).^2)
xuv2_49152 = xuv2_49152/sqrt(sum(abs(xuv2_49152).^2)/length(xuv2_49152));
en2=mean(abs(xuv2_49152).^2)
xuv3_49152 = xuv3_49152/sqrt(sum(abs(xuv3_49152).^2)/length(xuv3_49152));
en3=mean(abs(xuv3_49152).^2)

% Plot the time-domain and frequency-domain waveform (xuv1)
% Question: What can you say regarding the frequency span (approximately how many PRBs does this waveform occupy
% 
% simulate time-delay
delay1=300;
delay2=140;
delay3=40;
delaymax = 1+max([delay1 delay2 delay3]);
xuv1_49152 = [zeros(1,delay1) xuv1_49152 zeros(1,delaymax-delay1)];
xuv2_49152 = [zeros(1,delay2) xuv2_49152 zeros(1,delaymax-delay2)];
xuv3_49152 = [zeros(1,delay3) xuv3_49152 zeros(1,delaymax-delay3)];

SNR=0;
snr=10.^(.1*SNR);
noise1 = sqrt(.5/snr)*(randn(1,length(xuv1_49152))+sqrt(-1)*randn(1,length(xuv1_49152)));
noise2 = sqrt(.5/snr)*(randn(1,length(xuv1_49152))+sqrt(-1)*randn(1,length(xuv1_49152)));
rxsig1 = xuv1_49152 + noise1;
rxsig2 = xuv1_49152 + xuv2_49152 + xuv3_49152 + noise2;


% What to do now
% a) implement the receiver using a frequency-domain correlation
% using the Zadoff-Chu sequences generation method as above
% b) show how the data detection and time-delay estimation

% receiver

rxsig1_noprefix = rxsig1(6336+(1:49152));
rxsig2_noprefix = rxsig2(6336+(1:49152));

RXSIG1 = fft(rxsig1_noprefix);
RXSIG2 = fft(rxsig2_noprefix);

Xu=zeros(nseq,839);
Ru1=zeros(nseq,839);
Ru2=zeros(nseq,839);
ru1=zeros(nseq,839);
ru2=zeros(nseq,839);
for (seq=1:nseq)
    % compute time-domain ZC sequence for each u in 1:nseq
    xun = exp(-j*pi*utab(seq)*(0:838).*(1:839)/839);
    % compute freq-domain ZC sequence for each u in 1:nseq
    Xu(seq,:) = fft(xun);
    % correlate (componentwise multiplicaiton and IFFT) with received signal
    Ru1(seq,:) = RXSIG1(7+(1:839)).*conj(Xu(seq,:));
    Ru2(seq,:) = RXSIG2(7+(1:839)).*conj(Xu(seq,:));
    ru1(seq,:) = ifft(Ru1(seq,:));%,1024);
    ru2(seq,:) = ifft(Ru2(seq,:));%,1024);
end

figure(1)
plot(20*log10(abs(fft(rxsig1))))
axis([1 1024 30 80])

figure(2)
plot(20*log10(abs(fft(rxsig2))))
axis([1 1024 30 80])

figure(3)
plot(0:838,20*log10(abs(ru1(1,:))), 'r',0:838,20*log10(abs(ru1(2,:))), 'b')

figure(4)
plot(0:838,20*log10(abs(ru2(1,:))), 'r',0:838,20*log10(abs(ru2(2,:))), 'b')