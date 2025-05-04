>> pcolor(abs(x_origin))
Unrecognized function or variable 'x_origin'.
 
Did you mean:
>> pcolor(abs(x_orig))
>> doc interpol
>> doc interp
>> h_ext3 = interp(h_est2,6)
Unrecognized function or variable 'h_est2'.
 
Did you mean:
>> h_est = yp./p
>> h_est2 = mean(h_est,2)
>> h_interp = interp1(kp,h_est2,"spline")
Error using matlab.internal.math.interp1
Input coordinates must be real.

Error in interp1 (line 188)
        VqLite = matlab.internal.math.interp1(X,V,method,method,Xqcol);
 
>> h_interp = interp1(kp,h_est2,1:k, "spline")
Unrecognized function or variable 'k'.
 
Did you mean:
>> h_interp = interp1(kp,h_est2,1:K, "spline")
>> h_interp = interp1(kp,h_est2,1:K, 'spline', 'extrap');
>> plot(h_interp)
>> y_equ = y_norm ./ h_interp
Error using  ./ 
Arrays have incompatible sizes for this operation.

Related documentation
 
>> y_equ = y_norm./h_interp
Error using  ./ 
Arrays have incompatible sizes for this operation.

Related documentation
 
>> y_norm = y / r;
>> y_equ = y_norm./h_interp
Error using  ./ 
Arrays have incompatible sizes for this operation.

Related documentation
 
>> h_est = yp./p;
>> plot(h_est)
>> plot(h_est, '.')
>> plot(h_est(1,:), '.')

%-- 2023-09-26, 10:56 PM --%
run('/Users/valiha/Developer/masters_ics/.semesters/S7/SSP/Homework/HW1/pingstats.m')
%-- 2023-09-26, 11:19 PM --%
function periodo(signal,N)
% function periodo(signal,N)
% Plots the periodogram of the signal over N frequential bins.
% The spectrum (in dB) is represented over [0 0.5]*fs where fs=1
% is the normalized sampling rate.
% N must be even.
ns=length(signal);
if rem(N,2)~=0
error('N must be even')
end
signal=signal(:)';	% force a row vector
if N<=ns
in=signal(1:N);
ns=N;
else
in=[signal zeros(1,N-ns)];	% zero padding
end
dsp=abs(fft(in));
DSP=dsp(1:(N/2)+1)/sqrt(ns);
f=0:1/N:0.5;
plot(f,10*log10(DSP.^2))
grid
xlabel('Normalized frequency')
ylabel('dB')
periodo
%-- 2023-09-27, 9:24 AM --%
max=25;
who
whos
clear
v = eye(n)
periodogram
%-- 2023-09-27, 2:00 PM --%
guaussian_df
%-- 2023-09-27, 2:03 PM --%
guaussian_df
orthogonal
%-- 2023-09-27, 5:02 PM --%
orthogonal
%-- 2023-09-27, 5:24 PM --%
orthogonal
%-- 2023-10-04, 9:03 AM --%
n = 200
periodo
test_periodo
%-- 2023-10-10, 8:03 AM --%
mvnd
%-- 2023-10-18, 8:47 PM --%
signalAnalyser
signalAnalyzer
%-- 2023-10-18, 9:14 PM --%
signal1
%-- 2023-10-19, 10:10 PM --%
test
designfilter
designfilt
filterDesigner
fdatool
stm32f4_iirsos_coeffs(SOS,G)
stm32f4_iirsos_coeffs()
%-- 2023-10-24, 8:45 PM --%
c12ce7
mvnd
%-- 2023-10-24, 8:50 PM --%
example5_1
pss
clear
pss
clear
pss
load('matlab.mat')
pss
%-- 2023-10-27, 10:06 AM --%
pss
pathtool
pss
pathtool
pss
pathtool
pss
addpath("/Users/valiha/Developer/masters_ics/semesters/S7/DigiCom/Labs/tp1/MATLAB")
pss
addpath(['/Users/valiha/Developer/masters_ics/semesters/S7/DigiCom/Labs/tp1/MATLAB']);
pss
addpath
addpath('/Users/valiha/Developer/masters_ics/semesters/S7/DigiCom/Labs/tp1/MATLAB');
pss
addpath('/Users/valiha/Developer/masters_ics/semesters/S7/DigiCom/Labs/tp1/MATLAB','.');
pss
%-- 2023-10-27, 10:24 AM --%
pss
path
pss
%-- 2023-10-28, 9:45 AM --%
pss
pss0
pss1
pss2
pss
pss11 = xcorr(pss1_t.pss1_t)
pss11 = xcorr(pss1_t,pss1_t)
subplot(321)
plot(abs(pss00))
pss00 = xcorr(pss0_t,pss0_t)
plot(abs(pss00))
subplot(322)
plot(abs(pss11))
pss00 = xcorr(pss0_t,pss0_t)
plot(10*log10(abs(pss11)))
subplot(322)
subplot(323)
%-- 2023-10-28, 10:01 AM --%
pss
pss0
pss1
pss2
pss
manip_class
%-- 2023-10-28, 10:13 AM --%
pss0
pss1
pss2
pss
manip_class
%-- 2023-10-29, 4:50 PM --%
pss
manip_class
pss
manip_class
%-- 2023-10-29, 4:55 PM --%
pss
manip_class
pss
%-- 2023-10-29, 4:57 PM --%
pss
manip_class
pss
%-- 2023-10-29, 4:58 PM --%
manip_class
pss
manip_class
pss0_fft = fft(pss_0.');
plot(plot(10*log10(abs(pss0_fft)))
plot(10*log10(abs(pss0_fft))))
plot(10*log10(abs(pss0_fft)))
pss0_fft = ifft(pss_0.');
plot(10*log10(abs(pss0_fft)))
1j
-363 + j*(0)
%-- 2023-11-02, 11:29 PM --%
pingstats
stats=pingstats('isl.stanford.edu',100,'v')
%-- 2023-11-10, 8:56 AM --%
pss0
pss1
pss2
pss
manip_class
pss
pss0
pss1
pss2
plot(abs(pss00))
plot(10*log10(abs(pss11)))
plot(10*log10(abs(pss02)))
plot(real(pss0_t))
plot(20*log10(abs(fftshift(fft(pss0_t)))
plot(20*log10(abs(fftshift(fft(pss0_t)))))
thres = max(abs(pss0F))/10;
thres = max(abs(pss0))/10;
load('rxsignal_withchannelandfreqoff.mat')
load('rxsignal_withchannel.mat')
load('rxsignal_justnoise.mat')
subplot(411)
subplot(421)
plot(20*log10(rxs0)
plot(20*log10(rxs0))
subplot(421)
subplot(423) ; plot (10*log10(abs(fftshift(fft(rxs1))))
subplot(423) ; plot (10*log10(abs(fftshift(fft(rxs1))))))
subplot(423) ; plot (10*log10(abs(fftshift(fft(rxs1))))
subplot(423) ; plot (10*log10(abs(fftshift(fft(rxs1)))))
subplot(426) ; plot (10*log10(abs(fftshift(fft(rxs3)))))
figure(2) ; plot (10*log10(abs(fftshift(fft(rxs3)))))
figure(3) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
figure(1) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
subplot(423) ; plot (10*log10(abs(fftshift(fft(rxs1)))))
load('rxsignal_justnoise.mat')
load('rxsignal_withchannel.mat')
load('rxsignal_withchannelandfreqoff.mat')
load('rxsignal_justnoise.mat')
figure(1); subplot(110) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
figure(1); subplot(323) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
figure(1); subplot(326) ; plot (10*log10(abs(fftshift(fft(rxs1)))))
figure(1); subplot(326) ; plot (20*log20(abs(fftshift(fft(rxs1)))))
figure(1); subplot(326) ; plot (20*log2(abs(fftshift(fft(rxs1)))))
figure(1); subplot(326) ; plot (20*log10(abs(fftshift(fft(rxs1)))))
figure(1); subplot(326) ; plot (10*log10(abs(fftshift(fft(rxs1)))))
load('rxsignal_justnoise.mat')
figure(1); subplot(110) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
figure(1); subplot(411) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
figure(1); subplot(412) ; plot (10*log10(abs(fftshift(fft(rxs1)))))
subplot(423) ; plot (10*log10(abs(fftshift(fft(rxs1)))))
subplot(426) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
4
subplot(424) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
load('rxsignal_justnoise.mat')
load('pss0.m')
load('pss0')
pss0
run('pss0')
subplot(311) ; m0 = 10*log10(abs(conv(rx0,cong(plir(pss)_t))));
subplot(311) ; m0 = 10*log10(abs(conv(rx0,cong(plir(pss_t)))));
subplot(311) ; m0 = 10*log10(abs(conv(rsx0,cong(plir(pss_t)))));
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,cong(plir(pss_t)))));
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,cong(plir(pss0_t)))));
run('pss')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,cong(plir(pss0_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,cong(flipr(pss0_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,cong(fliplr(pss0_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c1,Nf1] = max(m0); plot(m0);
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(abs(pss0_t)))))); [c0,Nf0] = max(m0); plot(m0);
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
subplot(312) ; m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(313) ; m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2); plot(m2);
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
clf
m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1); plot(m1);
m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2); plot(m2);
plot(m0,'r',m1,'g',m2,'b')
figure(1)
plot(m0,'r',m1,'g',m2,'b')
clf
run('pss')
run('pss0')
m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0);
m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1);
m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2);
figure(1)
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
figure(1)
plot(m0,'r',m1,'g',m2,'b')
plot(m0,'r')
plot(m1,'g')
plot(m2,'b')
plot(m0,'r',m1,'g',m2,'b')
load('rxsignal_withchannel.mat')
m2_chan = 10*log10(abs(conv(rxs2,conj(fliplr(pss2_t))))); [c2_chan,Nf2_chan] = max(m2_chan);
plot(m2,'b')
plot(m2_chan,'b')
m2_chan = 10*log10(abs(conv(rxs2,conj(fliplr(pss2_t))))); [c2_chan,Nf2_chan] = max(m2_chan);
plot(m2_chan,'b')
%-- 2023-11-11, 1:23 AM --%
guaussian_df
periodo
example5_1
test
c12ce7
%-- 2023-11-15, 7:19 AM --%
stats=pingstats('isl.stanford.edu',100,'v')
pingstats
stats=pingstats('isl.stanford.edu',100,'v')
stats
%-- 2023-11-17, 9:20 AM --%
pwd
pss
activate .
cd ~
cd Developer
cd DigiCom
ls
cd Labs
ls
cd tp1
ls
cd MATLAB/
ls
load(rxsignal_justnoise.mat)
load('rxsignal_withchannelandfreqoff.mat')
load('rxsignal_withchannel.mat')
load('rxsignal_justnoise.mat')
who
load('rxsignal_withchannelandfreqoff.mat')
clf; m2_chan = 10*log(abs(conv(rxs3,conj(flippr(pss2_t))));
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2)))));
load(pss2)
load(pss2.m)
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
load(pss)
load("pss")
load("pss.m")
%-- 2023-11-17, 9:48 AM --%
pss
pss2
load('rxsignal_withchannelandfreqoff.mat')
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan);
plot(m2_chan);
axis ([1 1000 10 60])
freq_offset_est(rxs3,pss2_t,NF2_chan-lenght(pss2_t)+1)
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
load('pss2.m')
load('pss2')
pss2
freq_offset_est(rxs3,pss2_t,NF2_chan-lenght(pss2_t)+1)
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
m2_chan
function [ f_offset ] = freq_offset_est(signal, pss_1, Nf)
%%Frequency offset estimator
%To make sure the signals are generated befor running this func.
pss;
figure;
%subtitle('Frequecy offset');
DELTA_F = 10;
Fs = 61.44e6;
f_min = 7500;
f_max = 7500;
m = f_min:DELTA_F:f_max;
Y = zeros(l,length(m));
L = length(pss_1);
t = 0:(1/Fs):((L-1)/Fs);
%figure
for j = 1:length(m)
Y(j) = Y(j) + abc(sum(exp( -2*pi*ll)))
end
end
freq_offset_est
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 1000 10 60])
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
clf
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
clf
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
%-- 2023-11-17, 10:14 AM --%
load('rxsignal_withchannelandfreqoff.mat')
who
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
pss2
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
pss
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
%-- 2023-11-17, 10:18 AM --%
load('rxsignal_withchannelandfreqoff.mat')
pss
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
rxs3(3500)
c2_chan
NF2_chan
%-- 2023-11-17, 8:23 PM --%
pss
plot(real(pss0_t))
subplot(212)
plot(real(pss0_t))
plot(abs(pss0_t))
plot(20*log10(abs(pss0_t))
plot(20*log10(abs(pss0_t)))
plot(20*log10(abs(fftshift(fft(pss0_t)))
plot(20*log10(abs(fftshift(fft(pss0_t))))
plot(20*log10(abs(fftshift(fft(pss0_t)))
abs(fftshift(fft(pss0_t))
abs(fftshift(fft(pss0_t))))
abs(fftshift(fft(pss0_t)))))
abs(pss0_t)
fft(abs(pss0_t))
fftshift(fft(abs(pss0_t)))
abs(fftshift(fft(abs(pss0_t))))
20*log10(abs(fftshift(fft(abs(pss0_t)))))
plot(20*log10(abs(fftshift(fft(abs(pss0_t))))))
thres = max(abs(pss0F))/10;
thres = max(abs(pss0))/10;
thres = max(abs(pss0_t))/10;
length(find(abs(pss0F)>thres))
length(find(abs(pss0_t)>thres))
load('rxsignal_withchannelandfreqoff.mat')
pss
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
load('rxsignal_withchannelandfreqoff.mat')
pss
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t))))); [c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 10000 10 60])
%-- 2023-11-18, 7:53 PM --%
cd '~/Developer/DigiCom/Labs/tp1/MATLAB'
pwd
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))))
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan)
axis ([1 10000 10 60])
m2_chan
rxs3
rxs3[0]
rxs3(0)
rxs3(1)
m2_chan(1)
load('rxsignal_withchannelandfreqoff.mat')
pss00 = xcorr(pss0_t,pss0_t);
subplot(321)
plot(abs(pss00))
pss01 = xcorr(pss0_t,pss1_t);
plot(10*log10(abs(pss01)))
pss01 = xcorr(pss0_t,pss1_t);
pss00 = xcorr(pss0_t,pss0_t);
subplot(321)
plot(abs(pss00))
subplot(322)
plot(10*log10(abs(pss00)))
pss00 = xcorr(pss0_t,pss0_t);
pss01 = xcorr(pss0_t,pss1_t);
pss02 = xcorr(pss0_t,pss2_t);
pss11 = xcorr(pss1_t,pss1_t);
pss12 = xcorr(pss1_t,pss2_t);
pss22 = xcorr(pss2_t,pss2_t);
plot(real(pss0_t))
plot(real(pss1_t))
plot(real(pss2_t))
plot(10*log10(abs(pss2_t)))
plot(10*log10(abs(pss22)))
plot(10*log10(-abs(pss22)))
plot(10*log10(abs(pss22)))
plot(10*log10(pss22))
plot(10*log10(abs(pss22)))
plot(10*log10(abs(pss02)))
plot(10*log10(abs(pss00)))
x = real(pss0_t)
y = imag(pss0_t)
xy = pss0_t
figure; plot(1:length(xy), x, 'r*', 1:length(xy), y, 'yo');
figure; plot(x,y, 'r*')
figure; plot(x,y, 'b*')
figure; plot(x,y, 'b.')
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, 'yo');
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, 'or');
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, 'oo');
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, 'o.');
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, 'oc');
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, 'yc');
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, 'cc');
figure; plot(1:length(xy), x, 'b.', 1:length(xy), y, '.c');
N=1024;
fs=1000;
% signal 1Hz
f=1;
ts=1/fs;
t = ts*(0:N-1);
x=sin(2*pi*f*t);
subplot(4,2,1),plot(t,x),title('1hz');
% power spectrum of 1 Hz
y = fft(x);
N = length(x);          % number of samples
f = (0:N-1)*(fs/N);     % frequency range
pow = abs(y).^2/N;    % power of the DFT
subplot(4,2,2),plot(f,pow), title('1hz power');
% signal 3Hz
f2=3;
x2=sin(2*pi*f2*t);
subplot(4,2,5),plot(t,x2),title('3hz');
% power spectrum of 3 Hz
y = fft(x2);
N = length(x);          % number of samples
f = (0:N-1)*(fs/N);     % frequency range
pow = abs(y).^2/N;    % power of the DFT
subplot(4,2,6),plot(f,pow), title('3hz power');
f2=3;
x2=sin(2*pi*f2*t);
subplot(4,2,5),plot(t,x2),title('3hz');
% power spectrum of 3 Hz
y = fft(x2);
N = length(x);          % number of samples
f = (0:N-1)*(fs/N);     % frequency range
pow = abs(y).^2/N;    % power of the DFT
subplot(4,2,6),plot(f,pow), title('3hz power');
rng('default')
fs = 100;                                % sample frequency (Hz)
t = 0:1/fs:10-1/fs;                      % 10 second span time vector
x = (1.3)*sin(2*pi*15*t) ...             % 15 Hz component
+ (1.7)*sin(2*pi*40*(t-2)) ...         % 40 Hz component
+ 2.5*randn(size(t));                  % Gaussian noise;
y = fft(x);
n = length(x);          % number of samples
f = (0:n-1)*(fs/n);     % frequency range
power = abs(y).^2/n;    % power of the DFT
plot(f,power)
xlabel('Frequency')
ylabel('Power')
cd ..
cd tp0
Ts = 1/50;
t = 0:Ts:10-Ts;
x = sin(2*pi*15*t) + sin(2*pi*20*t);
plot(t,x)
xlabel('Time (seconds)')
ylabel('Amplitude')
y = fft(x);
fs = 1/Ts;
f = (0:length(y)-1)*fs/length(y);
plot(f,abs(y))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude')
n = length(x);
fshift = (-n/2:n/2-1)*(fs/n);
yshift = fftshift(y);
plot(fshift,abs(yshift))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
t
plot(t)
f
plot(f,y)
pss0
pss00
fft(pss00)
plot(10*log10(fft(pss00)))
plot(10*log10(ifft(pss00)))
plot(10*log10(fft(abs(pss00))))
plot(10*log10(fftshit(abs(pss00))))
plot(10*log10(fftshift(abs(pss00))))
plot(10*log10(fft(abs(pss00))))
plot(10*log10(abs(fftshift(pss00))))
plot(10*log10(abs(pss00)))
plot(abs(pss00))
plot(10*log10(abs(pss00)))
plot(10*log10(abs(fft(pss00))))
plot(10*log10(abs(fftshift(pss00))))
plot(10*log10(abs(fft(pss00))))
plot(10*log10(fft(abs(pss00))))
plot(10*log10(abs(fft(pss00))))
plot(10*log10(abs(fftshift(pss00))))
cd ~/Developer/DigiCom
cd UHD
cd wifi
load('savemat.mat')
load('savemat.mat') -ASCII
%-- 2023-11-20, 4:38 PM --%
pwd
cd "~/Developer/digicom/Labs/tp1/MATLAB"
pwd
cd '~/Developer/digicom/Labs/tp1/MATLAB'
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss0_t)))))
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))))
plot(m2_chan); axis ([1 10000 10 60])
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss0_t)))))
plot(m2_chan); axis ([1 10000 10 60])
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss1_t)))))
plot(m2_chan); axis ([1 10000 10 60])
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))))
plot(m2_chan); axis ([1 10000 10 60])
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss0_t)))))
plot(m2_chan); axis ([1 10000 10 60])
m0_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss0_t)))))
plot(m0_chan); axis ([1 10000 10 60])
pss0_t(((2048-143):2048))
pss0_t((2048-143):2048)
pss0_t(2048-143:2048)
pss0_t = [pss0_t(2048-143:2048) pss0_t]
pss0_t
pss0_t = [pss0_t(2048-143:2048) pss0_t]
size(pss0_t)
run(pss0)
run('pss0.m')
pss0_t = ifft(pss_0.');
plot(pss0_t)
pss0_t = pss0_t/norm(pss0_t);
plot(pss0_t)
pssx_t = [ -0.002304250135803 + 0.000000000000000i ]
pssx_t = [ -0.002304250135803 + 0.000000000000000i, -0.002196736074916 + 0.000011974457529i ]
pssx_t = [pssx_t(0:1) pssx_t];
pssx_t = [pssx_t(1:2) pssx_t];
run('pss2);
run('pss2');
pss2_t = ifft(pss_2.');
plot(pss_2)
plot(pss2_t)
pss0_t = pss0_t/norm(pss0_t);
pss2_t = pss2_t / norm(pss2_t);
run('pss2')
pss2_t = ifft(pss_2.');
plot(pss2_t)
figure2
figure;
pss2_t = pss2_t / norm(pss2_t);
plot(pss2_t)
figure;
pss20_t = [pss2_t(((2048-143):2048)) pss2_t];
plot(pss20_t)
pss2_t = [pss2_t(((2048-143):2048)) pss2_t];
plot(real(pss2_t))
plot(imag(pss2_t))
figure;
plot(real(pss2_t))
plot(imag(pss2_t))
plot(real(pss2_t))
load('rxsignal_withchannelandfreqoff.mat')
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan);
plot(m2_chan); axis ([1 1000 10 60])
run('pss')
run('pss0')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
subplot(312) ; m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(313) ; m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2); plot(m2);
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
run('pss')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
load('rxsignal_justnoise.mat')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
subplot(312) ; m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(313) ; m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2); plot(m2);
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0);
m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0);
m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1);
m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2);
figure(1)
plot(m0,'r',m1,'g',m2,'b')
%-- 2023-11-21, 7:04 AM --%
clear all;
u_shift = [25 29 34];
NID = 0;
d_u = [];
for n = 0:61
u = u_shift(NID+1);
if n <= 30
d = exp(-j*pi*u*n*(n+1)/63);
else
d = exp(-j*pi*u*(n+1)*(n+2)/63);
end;
d_u = [d_u d];
end;
subplot(1,3,1);
plot(real(d_u(1:31)),imag(d_u(1:31)),'ko','MarkerFaceColor',[0 0 0]);
axis([-1.5 1.5 -1.5 1.5]);
title('n=0..30');
subplot(1,3,2);
plot(real(d_u(32:62)),imag(d_u(32:62)),'bo','MarkerFaceColor',[0 0 1]);
axis([-1.5 1.5 -1.5 1.5]);
title('n=31..61');
subplot(1,3,3);
plot(real(d_u(1:62)),imag(d_u(1:62)),'ro','MarkerFaceColor',[1 0 0]);
axis([-1.5 1.5 -1.5 1.5]);
title('n=0..61');
d_u(1:62)
clear all;
u_shift = [25 29 34];
% Generate PSS for NID = 0
NID = 0;
d_u = [];
for n = 0:61
u = u_shift(NID+1);
if n <= 30
d = exp(-j*pi*u*n*(n+1)/63);
else
d = exp(-j*pi*u*(n+1)*(n+2)/63);
end;
d_u = [d_u d];
end;
d_u_NID0 = d_u';
% Generate PSS for NID = 1
NID = 1;
d_u = [];
for n = 0:61
u = u_shift(NID+1);
if n <= 30
d = exp(-j*pi*u*n*(n+1)/63);
else
d = exp(-j*pi*u*(n+1)*(n+2)/63);
end;
d_u = [d_u d];
end;
d_u_NID1 = d_u';
% Generate PSS for NID = 2
NID = 2;
d_u = [];
for n = 0:61
u = u_shift(NID+1);
if n <= 30
d = exp(-j*pi*u*n*(n+1)/63);
else
d = exp(-j*pi*u*(n+1)*(n+2)/63);
end;
d_u = [d_u d];
end;
d_u_NID2 = d_u';
% Cross Correlation between PSS
Hxcorr = dsp.Crosscorrelator;
taps = 0:61;
taps = taps';
XCorr_0_0 = step(Hxcorr,d_u_NID0,d_u_NID0);
XCorr_0_1 = step(Hxcorr,d_u_NID0,d_u_NID1);
XCorr_0_2 = step(Hxcorr,d_u_NID0,d_u_NID2);
subplot(3,1,1);
stem(taps,abs(XCorr_0_0(62:end)),'bo','MarkerFaceColor',[0 0 1]);
xlim([0 length(taps)]); ylim([0 100]);
title('Corr between PSS(NID0) and PSS(NID0)');
subplot(3,1,2);
stem(taps,abs(XCorr_0_1(62:end)),'bo','MarkerFaceColor',[0 0 1]);
xlim([0 length(taps)]); ylim([0 100]);
title('Corr between PSS(NID0) and PSS(NID1)');
subplot(3,1,3);
stem(taps,abs(XCorr_0_2(62:end)),'bo','MarkerFaceColor',[0 0 1]);
xlim([0 length(taps)]); ylim([0 100]);
title('Corr between PSS(NID0) and PSS(NID2)');
clear all;
u_shift = [25 29 34];
% Generate PSS for NID = 0
NID = 0;
d_u = [];
for n = 0:61
u = u_shift(NID+1);
if n <= 30
d = exp(-j*pi*u*n*(n+1)/63);
else
d = exp(-j*pi*u*(n+1)*(n+2)/63);
end;
d_u = [d_u d];
end;
phShift = pi/3;
d_u_NID0 = transpose(d_u); % Original PSS
d_u_NID0_PhaseShift = transpose(d_u .* exp(j*phShift)); % PhaseShifted PSS
% Cross Correlation between PSS
Hxcorr = dsp.Crosscorrelator;
taps = 0:61;
taps = taps';
XCorr_0_0_Shifted = step(Hxcorr,d_u_NID0,d_u_NID0_PhaseShift);
subplot(3,2,1);
plot(real(d_u_NID0),imag(d_u_NID0),'ro','MarkerFaceColor',[1 0 0]);
title('PSS');
subplot(3,2,2);
plot(real(d_u_NID0_PhaseShift),imag(d_u_NID0_PhaseShift),'bo','MarkerFaceColor',[0 0 1]);
title(strcat('PSS:',num2str(phShift)));
subplot(3,2,[3 4]);
stem(taps,abs(XCorr_0_0_Shifted(62:end)),'bo','MarkerFaceColor',[0 0 1]);
xlim([0 length(taps)]); ylim([0 100]);
title('Abs(Corr) : PSS(NID0) and PhaseShifted PSS(NID0)');
subplot(3,2,[5 6]);
stem(taps,angle(XCorr_0_0_Shifted(62:end)),'bo','MarkerFaceColor',[0 0 1]);
xlim([0 length(taps)]); ylim([-pi pi]);
title('Angle(Corr): PSS(NID0) and PhaseShifted PSS(NID0)');
pss
pss00 = xcorr(pss0_t,pss0_t);
pss01 = xcorr(pss0_t,pss1_t);
pss02 = xcorr(pss0_t,pss2_t);
pss11 = xcorr(pss1_t,pss1_t);
pss12 = xcorr(pss1_t,pss2_t);
pss22 = xcorr(pss2_t,pss2_t);
subplot(321)
plot(abs(pss00))
plot(10*log10(abs(pss01)))
%-- 2023-11-21, 1:44 PM --%
fs = 1000;
t = 0:1/fs:2;
x = vco(sin(2*pi*t),[10 490],fs);
strips(x,0.25,fs)
cd ('/Users/valiha/Developer/masters_ics/semesters/S7/SSP/Homework/1')
pingstats
stats=pingstats('isl.stanford.edu',100,'v')
x = linspace(-2*pi, 2*pi);
plot(x)
plot(sin(x) + 0.5*rand(size(x)))
periodo(x,10)
%-- 2023-11-25, 6:27 AM --%
% Define the coefficient matrix A
A = [2, 1; 1, -3];
% Define the right-hand side vector b
b = [8; -3];
% Solve the system of linear equations Ax = b
x = A\b;
% Display the result
disp('Solution vector x:');
disp(x);
A*x
%-- 2023-11-26, 8:21 AM --%
f = (a,b) -> a + b
f = @(a,b) -> a + b
f = @(a,b) a + b
f(1,2)
%-- 2023-11-27, 8:44 PM --%
cd /Users/valiha/Developer/DigiCom1/Labs/tp1/MATLAB
run("pss.m")
m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0);
m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1);
m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2);
load('rxsignal_withchannel.mat')
m2_chan = 10*log10(abs(conv(rxs2,conj(fliplr(pss2_t))))); [c2_chan,Nf2_chan] = max(m2_chan);
plot(m2_chan)
a = fliplr(pss2_t)
plot(a)
plot(pss2_t)
plot(real(pss0_t))
subplot(212)
plot(real(pss0_t))
plot(abs(pss0_t))
plot(20*log10(abs(pss0_t)))
plot(20*log10(abs(fftshift(fft(abs(pss0_t))))))
plot(20*log10(abs(pss0_t))
plot(20*log10(abs(pss0_t)))
plot(20*log10(pss0_t))
plot(20*log10(abc(pss0_t)))
plot(20*log10(abc(pss0_t))
plot(20*log10(abs(pss0_t)))
plot(20*log10(fft(abs(pss0_t))))
plot(20*log10(fftshift(fft(abs(pss0_t)))))
plot(20*log10(abs(fftshift(fft(abs(pss0_t))))))
plot(20*log10(abs(fftshift(fft(abs(pss2_t))))))
load('rxsignal_withchannelandfreqoff.mat')
plot (10*log10(abs(fftshift(fft(rxs3)))))
figure; plot (10*log10(abs(fftshift(fft(rxs3)))))
%-- 2023-12-01, 10:08 AM --%
pss
freq_offset_est
load('rxsignal_withchannelandfreqoff.mat')
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 1000 10 60])
c2_chan
NF2_chan
freq_offset_est(rxs3, pss_2, Nfft)
freq_offset_est
%-- 2023-12-01, 10:49 AM --%
t_1
cd ..
cd Labs
%-- 2023-12-01, 11:15 AM --%
cd TP2
cd ..
cd valiha
cd Developer
cd digicom
cd Labs
cd Tp2
ls
cd <ATLAB
cd MATLAB
ls
pss
tp2
%-- 2023-12-02, 3:32 PM --%
run("pss")
cd ../
cd TP1
cd MATLAB
run("pss")
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))))
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
rxWaveform = rx.waveform;
rx = load('rxsignal_withchannelandfreqoff.mat')
rxWaveform = rx.waveform;
rxWaveform = rx.rxs3;
rxWaveform_scaled = rxWaveform*(0.95/(max(abs(rxWaveform))));   % Scale input waveform to have max abs value of 0.95
Fs_rxWaveform = rx.sampleRate;
figure;
spectrogram(rxWaveform_scaled(:,1),ones(512,1),0,512,'centered',Fs_rxWaveform,'yaxis','MinThreshold',-130);
title('Signal Spectrogram');
Fs_rxWaveform = 125e6;
spectrogram(rxWaveform_scaled(:,1),ones(512,1),0,512,'centered',Fs_rxWaveform,'yaxis','MinThreshold',-130);
title('Signal Spectrogram');
Fs_rxWaveform = 125e3;
spectrogram(rxWaveform_scaled(:,1),ones(512,1),0,512,'centered',Fs_rxWaveform,'yaxis','MinThreshold',-130);
title('Signal Spectrogram');
Fs_rxWaveform = 7.68e6;
spectrogram(rxWaveform_scaled(:,1),ones(512,1),0,512,'centered',Fs_rxWaveform,'yaxis','MinThreshold',-130);
title('Signal Spectrogram');
f_ofsset_est_chat
freq_offset_est_chat
freq_offset_est
freq_offset_est_complex_chat
freq_offset_est
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan);
plot(m2_chan); axis ([1 1000 10 60])
freq_offset_est
st1
run('pss')
st1
manip_class
%-- 2023-12-02, 11:36 PM --%
manip_class
load('rxsignal_withchannelandfreqoff.mat')
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2)))));
pss
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 1000 10 60])
NF2_chan
c2_chan
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 1000 10 60])
load('rxsignal_justnoise.mat')
figure(1); subplot(411) ; plot (10*log10(abs(fftshift(fft(rxs0)))))
figure(1); subplot(412) ; plot (10*log10(abs(fftshift(fft(rxs1)))))
run('pss')
run('pss0')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
subplot(312) ; m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(313) ; m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2); plot(m2);
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
run('pss')
run('pss0')
m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0);
m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1);
m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2);
figure(1)
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
load('rxsignal_withchannelandfreqoff.mat')
load('rxsignal_withchannel.mat')
load('rxsignal_justnoise.mat')
pss
using MAT
ff = matopen("matlab/rxsignal_justnoise.mat");
@read ff rxs0;
@read ff rxs1;
load('rxsignal_withchannelandfreqoff.mat')
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 1000 10 60])
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
m2_chan = 10*log10(abs2(conv(rxs3,conj(fliplr(pss2_t)))));
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan);
m2_chan = 20*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan);
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan);
load('rxsignal_withchannelandfreqoff.mat')
m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan); plot(m2_chan); axis ([1 1000 10 60])
freq_offset_est_complex_chat
freq_offset_est
pss
freq_offset_est
freq_offset_est_chat2
A = [1 + 2i, 3 - 4i; 5 + 6i, 7 - 8i];
B = A.';
c = conj(fliplr(pss2_t)))
c = conj(fliplr(pss2_t))
c = pss2_t.'
c = conj(fliplr(pss2_t))
c = pss2_t.'
c = fliplr(pss2_t).'
c = (fliplr(pss2_t)).'
c = fliplr(pss2_t)
c = fliplr(pss2_t).'
freq_offset_est_chat2
test1
ofdm
freq_offset_est
test1
freq_offset_est
f_off
freq_offset_est
call_numbers
freq_offset_est
call_numbers
freq_offset_est
add_numbers
call_numbers
%-- 2023-12-04, 8:01 AM --%
sharedtechnote1
call_numbers
%-- 2023-12-04, 10:26 AM --%
call_numbers
frequency_offset_estimation
call_numbers
frequency_offset_estimation
call_numbers
frequency_offset_estimation
%-- 2023-12-04, 12:46 PM --%
freq_offset_est
call_numbers
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
clearl
clearcls
cls
clear all
call_freq_est
clear all
call_freq_est
clear all
cls
clear
call_freq_est
freq_offset_est
call_freq_est
%-- 2023-12-04, 3:05 PM --%
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
freq_offset_est
call_freq_est
%-- 2023-12-04, 4:22 PM --%
call_freq_offset_est
sharedtechnote1
call_freq_offset_est
%-- 2023-12-04, 4:33 PM --%
call_freq_offset_est
%-- 2023-12-04, 8:11 PM --%
call_freq_offset_est
freq_offset_est
call_freq_offset_est
freq_offset_est
call_freq_offset_est
freq_offset_est
call_freq_offset_est
%-- 2023-12-04, 10:22 PM --%
call_freq_offset_est
%-- 2023-12-05, 7:54 PM --%
run('pss')
run('pss0')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
load('rxsignal_justnoise.mat')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
run('pss')
plot(abs(pss00))
run('pss0)
run('pss0')
plot(real(pss0_t))
plot(real(pss_0))
pss00 = xcorr(pss0_t,pss0_t);
pss0_t = pss_0.'
pss0_t = ifft(pss_0)
pss0_t = pss0_t/norm(pss0_t);
plot(pss0_t)
pss00 = xcorr(pss0_t,pss0_t);
plot(abs(pss00))
pss00 = xcorr(pss0_t,pss0_t);
plot(pss00)
auto_pss00 = xcorr(pss0_t);
plot(auto_pss00)
plot(10*log10(abs(pss00)))
plot(10*log10(abs(auto_pss00)))
%-- 2023-12-07, 1:58 PM --%
cd ..
cd TP2
cd matlab
run('pss')
load rxsignal_justnoise.mat
load rxsignal_withchannel.mat
load rxsignal_withchannelandfreqoff.mat
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
run('ofdm')
run('shredtechnote1')
run('sharedtechnote1')
run ofdm
run dseq
run sss
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))))
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
freq_offset_est
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
exp(-2*pi*1i*785)
exp(-2*pi*1i*785.0)
exp(-2*pi*1i*1)
exp(-2*pi*1i*2)
exp(-2*pi*1i*.04)
exp(-2*pi*1i*Y(785))
exp(-2*pi*1i*Y[785])
y
Y
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
Y = freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
exp(-2*pi*1i*1.0936e+10)
exp(-2*pi*1i*1.0936e-10)
exp(-2*pi*1i*0.1)
exp(-2*pi*1i*0.2)
exp(-2*pi*1i*0.3)
exp(-2*pi*1i*0.4)
exp(-2*pi*1i*1.5523055263338408e6 * 0.0j)
exp(-2*pi*1i*785 + j*(0))
exp(-2*pi*1i*(785 + j*(0)))
exp(-2*pi*1i*(363 + j*(0)))
exp(-2*pi*1i*(-363 + j*(0)))
ifft(785)
ifft(785.0)
ifft(1.5523055263338408e6 + 0.0im)
ifft(1.5523055263338408e6 + j*(0))
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
%-- 2023-12-08, 7:28 PM --%
cd '~/Developer/DigiCom/Labs/tp1/MATLAB'
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))))
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
call_freq_offset_est
length(pss2_t)
4437 + 2192 +1
4437 + 2192 - 1
call_freq_offset_est
10 * log10(A_fo)
call_freq_offset_est
%-- 2023-12-12, 5:32 PM --%
pwd
cd ..
pwd
cd ..
cd TP2
pwd
cd julia
cd matlab/
run("sss")
%-- 2023-12-15, 12:04 PM --%
cd ~/Developer/DigiCom/Labs/TP3
cd # Example usage
Ncp = 0
Nid_cell = 123
result = lte_rs_gold(Ncp, Nid_cell)
cd ~/Developer/DigiCom/Labs/TP1/matlab
run("readinsignals.m")
readinsignals
%-- 2023-12-16, 10:24 PM --%
run pss
pwd
cd ..
TP1_top
run('pss')
run('pss0')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
subplot(312) ; m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(313) ; m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2); plot(m2);
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
load rxsignal_justnoise.mat
run('pss')
run('pss0')
subplot(311) ; m0 = 10*log10(abs(conv(rxs0,conj(fliplr(pss0_t))))); [c0,Nf0] = max(m0); plot(m0);
subplot(312) ; m1 = 10*log10(abs(conv(rxs0,conj(fliplr(pss1_t))))); [c1,Nf1] = max(m1); plot(m1);
subplot(313) ; m2 = 10*log10(abs(conv(rxs0,conj(fliplr(pss2_t))))); [c2,Nf2] = max(m2); plot(m2);
plot(m0,'r',m1,'g',m2,'b')
axis([1 1000 10 40])
plot(real(pss0_t))
subplot(212)
plot(real(pss0_t))
plot(abs(pss0_t))
plot(20*log10(abs(pss0_t)))
plot(20*log10(abs(fftshift(fft(abs(pss0_t))))))
thres = max(abs(pss0F))/10;
length(find(abs(pss0F)>thres))
length(find(abs(pss_t)>thres))
length(find(abs(pss0_t)>thres))
pss
length(find(abs(pss0_t)>thres))
thres = max(abs(pss0_t))/10;
length(find(abs(pss0_t)>thres))
thres
%-- 2023-12-27, 10:38 PM --%
pss
plot(real(pss0_t))
pss00 = xcorr(pss0_t,pss0_t);
plot(pss00)
subplot(321)
plot(abs(pss00))
plot(10*log10(abs(pss01)))
pss01 = xcorr(pss0_t,pss1_t);
plot(10*log10(abs(pss01)))
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
plot(pss0)
plot(pss00)
plot(abs(pss00))
pss22 = xcorr(pss2_t,pss2_t);
plot(abs(pss22))
figure
plot(abs(pss00))
plot(abs(pss11))
readinsignals
periodo
lte_rs_gold
call_freq_offset_est
TP1_top
plot(pss0_t)
pss
plot(abs(pss0_t))
plot(abs(pss0_t)^2)
pss
plot(20 * log10.(abs(pss0_t).^2))
plot(20 * log10.(abs.(pss0_t).^2))
plot(20 * log10(abs.(pss0_t).^2))
plot(20 * log10(abs(pss0_t).^2))
plot(20 * log10(abs(pss0_t)^2))
plot(20 * log10(abs(pss0_t).^2))
20*log10(abs(fftshift(fft(abs(pss0_t)))))
plot(20 * log10(abs(pss0_t).^2))
pwd
cd ..
cd ~
cd Developer/SSP
cd Labs
ls
cd Homework/
ls -l
cd hw2_support/
ls
mkdir matlab
cd matlab/
pdf
matlabexample
%-- 2023-12-31, 3:28 PM --%
orthogonal
%-- 2024-01-01, 7:35 PM --%
cd ~/Developer/dsp/courses/kutz/_16
photo
%-- 2024-01-02, 4:38 PM --%
RUM_ME
pwd
cd ~/Developer/SSP/Homework/hw2_support/vineel49/
RUM_ME
%-- 2024-01-04, 1:16 PM --%
cd ~/Developer/DigiCom/Labs/TP0/matlab
load('pss0.m')
import('pss0.m')
run('pss0.m')
pss_0.'
pss_0.
pss_0
pss_0'
pss00 = xcorr(pss0_t,pss0_t); plot(abs(pss00))
pss0_t = ifft(pss_0.');
pss0_t = pss0_t/norm(pss0_t);
pss00 = xcorr(pss0_t,pss0_t); plot(abs(pss00))
pss_1;
pss
pss01 = xcorr(pss0_t,pss1_t); plot(abs(pss01))
pss01 = xcorr(pss0_t,pss1_t); plot(10*log10(abs(pss01)))
pss22 = xcorr(pss2_t,pss2_t); plot(abs(pss22))
%-- 2024-01-09, 7:40 AM --%
periodo
cd ~/Developer/SSP/Homework/3/matlab
test_periodo
help sig
sigpar=(0.057,0.082,20,20)
sig
sig()
%-- 2024-01-09, 6:19 PM --%
sig[100]
sig(100)
plot(sig(100))
plot(sig())
plot(sig(1))
plot(sig(0))
levinson
a = [1 0.1 -0.8 -0.27];
v = 0.4;
w = sqrt(v)*randn(15000,1);
x = filter(1,a,w);
[r,lg] = xcorr(x,'biased');
r(lg<0) = [];
[ar,e] = levinson(r,numel(a)-1)
levinson
levinson_test
test_periodo
%-- 2024-01-11, 7:48 AM --%
cd ~/Developer/DigiCom/Labs/TP3
cd matlab/
lab3_stud
%-- 2024-01-11, 11:27 AM --%
(1:839)/839
lab3_stud
lab_stud3
lab3_stud
get_tdl_test
get_tdl
get_tdl_test
lab3_stud
get_tdl_test
lab3_stud
get_tdl_test
lab3_stud
%-- 2024-01-11, 2:18 PM --%
lab3_stud
%-- 2024-01-11, 2:28 PM --%
ls
lab3_stud
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
yuv1 = yuv1 + fft(xuv1);
xuv2(n + 1) = xu2(1 + rem(n + (Ncs * nuind2), 839));
yuv2 = yuv2 + fft(xuv2);
xuv3(n + 1) = xu3(1 + rem(n + (Ncs * nuind3), 839));
yuv3 = yuv3 + fft(xuv3);
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
% Define the Zadoff-Chu sequence length
M = length(xu1);
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
lab3_stud
get_tdl_test
lab3_stud
get_tdl_test
k = get_tdl_test
get_tdl_test
%-- 2024-01-12, 7:55 AM --%
cd ~/Developer/SSP/Homework/3
cd matlab
levinson_test1
levinson_test
levinson_test2
levinson_test3
%-- 2024-01-12, 9:39 AM --%
cd ~/Developer/SSP/Homework/3/matlab
cd /Developer/DigiCom/Labs/TP3/matlab
cd ~/Developer/DigiCom/Labs/TP3/matlab
lab3_stud
%-- 2024-01-12, 10:33 AM --%
lab3_stud
%-- 2024-01-12, 11:33 AM --%
lab3_stud
%-- 2024-01-12, 5:06 PM --%
cd ~/Developer/SSP/Homework/3
cd matlab
ls
levinson_test1
levinson_test3
%-- 2024-01-17, 8:41 PM --%
d
cd Ù/Developer/DigiCom/Labs/TP3/matlab
cd ~/Developer/DigiCom/Labs/TP3/matlab
lab3_stud
t
lab3_stud
lab3_stud_wrong
get_tdl_test
lab3_stud
cd ~/Developer/DigiCom/Labs/TP4/matlab
lab4
%-- 2024-01-25, 9:44 PM --%
lab4
d_sequence
clear
d_sequence
clear
d_sequence
clear
d_sequence
%-- 2024-01-26, 10:49 PM --%
d_sequence
clear
d_sequence
clear
d_sequence
cw_sequence
clear
cw_sequence
clear
lab4
clear
c11_3gpp
lab4
clear
lab4
eigen
eigshow
a = [ 0.8 0.3 ; 0.2 0.7]
eigshow(a)
%-- 2024-01-29, 9:40 AM --%
cd ~/Developer/DigiCom/Labs/TP3/matlab
lab3_stud
lab3_stud_wrong
lab3_stud~
lab3_stud_attempt
cd ~/Developer/DigiCom/Labs/TP2/matlab
dseq
size(d)
cd ~/Developer/DigiCom/Labs/TP4/matlab
lab4
clear
[a,b] max(nc_corr)
[a,b] = max(nc_corr)
lab4_receiver
[a,b] = max(nc_corr)
lab4_receiver
lab4
H = get_tdl(61.44e6,30e3,1,300e9,"tdlc");
get_tdl(61.44e6,30e3,1,300e9,"tdlc");
get_tdl(61.44e6,30e3,1,300e9,"tdlc")
lab4
clear
%-- 2024-02-01, 2:47 PM --%
cd ~/Developer/DigiCom/Labs/TP3/matlab
lab3_stud
lab3_stud_attempt
lab3_stud_wrong
get_tdl
get_tdl_test
lab3_stud
clear
lab3_stud
lab3_stud_attempt
lab3_stud
clear
lab3_stud
clear
lab3_stud
cd ~/Developer/DigiCom/Labs/TP4/matlab
lab4
%-- 2024-02-03, 8:48 PM --%
cd ~/Developer/DigiCom/Labs/TP4/matlab
lab4
%-- 2024-02-06, 11:08 AM --%
cd ~//Developer/DigiCom/labs/data/matlab
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
%-- 2024-02-06, 11:31 AM --%
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
NF2_chan-length(pss2_t)+1
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
freq_offset_est
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
%-- 2024-02-06, 12:41 PM --%
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
freq_offset_est
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
rzs3(Nf:(Nf + L - 1)).'
Nf = NF2_chan-length(pss2_t)+1
rzs3(Nf:(Nf + L - 1)).'
L = length(pss_t)
L = length(pss2_t)
rzs3(Nf:(Nf + L - 1)).'
rxs3(Nf:(Nf + L - 1)).'
t = rxs3(Nf:(Nf + L - 1)).'
max(t)
a,b = max(t)
[a,b] = max(t)
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
t = freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
t[1]
max(t)
a, b = max(t)
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
t(785)
t[587]
t(587)
clear
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan)
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
rzs3(Nf:(Nf + L - 1)).'
Nf = NF2_chan-length(pss2_t)+1
rzs3(Nf:(Nf + L - 1)).'
L = length(pss2_t)
Nf = NF2_chan-length(pss2_t)+1
rzs3(Nf:(Nf + L - 1)).'
rxs3(Nf:(Nf + L - 1)).'
rxs3(Nf:(Nf + L - 1)).'[1]
t = rxs3(Nf:(Nf + L - 1)).'
t[1]
t(1)
t_rev = t.'
t_rev(1)
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
%-- 2024-02-11, 11:55 AM --%
cd ~/Developer/gitlab/digicom/Labs/TP3/matlab
lab3_stud
%-- 2024-02-13, 8:08 PM --%
cd ~/Developer/gitlab.com/ssp/Homeworks/tp1/matlab
sig
help sig.m
sigpar=(0.057,0.082,20,20)
sigm
sig
sig()
sim
sig(256)
plot(sig(256))
%-- 2024-02-14, 9:53 AM --%
cd ~/Developer/gitlab.com/digicom/Labs
cd TP4
cd matlab
lab4
%-- 2024-02-14, 12:01 PM --%
cd ..
cd TP3
cd ..
cd TP3
cd maltab
cd matlab/
ls
lab3_stud
cd ~/Developer/gitlab.com/MALIS/projects/proj4/tmp/adaboost
myMainScript
pwd
myMainScript
pwd
cd code
myMainScript
p = [-1;1]
%-- 2024-02-16, 10:19 AM --%
% Given dataset data
data = [1.2, 2.3, 3.4, 4.5, 5.6]; % Example data
% Estimate sigma^2 (sigma squared) for Rayleigh distribution
sigma_squared_hat = (1/(2*length(data))) * sum(data.^2);
% Calculate the estimated variance of the Rayleigh distribution
sigma_R_squared_hat = ((4 - pi)/2) * sigma_squared_hat;
% Display the estimated parameter
disp(['Estimated parameter sigma_R^2 = ', num2str(sigma_R_squared_hat)]);
%-- 2024-02-23, 8:39 PM --%
cd ~/Developer/SSP/Homeworks/tp1/matlab
test_periodo
help deconv_m
deconv
ideal_lp
wp = 0.2*pi; ws = 0.3*pi;  tr_width = ws - wp;
M = ceil(6.6*pi/tr_width) + 1
M = 67
n=[0:1:M-1];
wc = (ws+wp)/2, % Ideal LPF cutoff frequency
hd = ideal_lp(wc,M);  w_ham = (hamming(M))’;  h = hd .* w_ham;
[db,mag,pha,grd,w] = freqz_m(h,[1]);  delta_w = 2*pi/1000;
Rp = -(min(db(1:1:wp/delta_w+1)));    % Actual Passband Ripple
Rp = 0.0394
As = -round(max(db(ws/delta_w+1:1:501))) % Min Stopband attenuation
As = 52
% plots
subplot(2,2,1); stem(n,hd); title(’Ideal Impulse Response’)
axis([0 M-1 -0.1 0.3]); xlabel(’n’); ylabel(’hd(n)’)
subplot(2,2,2); stem(n,w_ham);title(’Hamming Window’)
axis([0 M-1 0 1.1]); xlabel(’n’); ylabel(’w(n)’)
subplot(2,2,3); stem(n,h);title(’Actual Impulse Response’)
axis([0 M-1 -0.1 0.3]); xlabel(’n’); ylabel(’h(n)’)
subplot(2,2,4); plot(w/pi,db);title(’Magnitude Response in dB’);grid
axis([0 1 -100 10]); xlabel(’frequency in pi units’); ylabel(’Decibels’)
example
example_7_8
example_7_9
wp = 0.2*pi; ws = 0.3*pi; As = 50;  tr_width = ws - wp;
M = ceil((As-7.95)/(2.285*tr_width/)+1) + 1
M = ceil((As-7.95)/(2.285*tr_width)+1) + 1
n=[0:1:M-1];  beta = 0.1102*(As-8.7)
example_7_9
example_7_10
example_7_8
example_7_11
example_7_10
example_7_6
cd ..
test_periodo
periodo
test_periodo
periodo
test_periodo
%-- 2024-03-29, 2:17 PM --%
10 * log10( 1.38 * 10e-23 * 300 ) + 30
10 * log10( 1.38 * 1e-23 * 300 ) + 30
10 * log10( 1.38e-23 * 300 ) + 30
plot(d1,rssi1)
plot(d2,rssi2)
plot(d1,rssi1)
plot(d2,rssi2)
plot(d1,rssi1)
hold on
plot(d2,rssi2)
legend
legend('horizontal','vertical')
PTx = 100; % Transmitter power in watts
GTx = 2; % Transmitter gain
% Compute the power density at 1m
powerDensityAt1m = computePowerDensityAt1m(PTx, GTx);
% Display the result
fprintf('The power density at 1m is %.2f W/m^2\n', powerDensityAt1m);
%-- 2024-04-17, 4:51 PM --%
test
%-- 2024-04-24, 8:23 AM --%
run
%-- 2024-05-17, 2:42 PM --%
labSessionEurecom
%-- 2024-05-17, 3:52 PM --%
labSessionEurecom
%-- 2024-05-17, 3:56 PM --%
labSessionEurecom
?
labSessionEurecom
%-- 2024-05-18, 6:54 PM --%
cd
cd ..
pwd
cd ..
cd imr_wirelessnetwork_lab/
cd data
cd matlab
load('tfMatrix_3.mat')
load('tfMatrix_2.mat')
load('tfMatrix_3.mat')
load('tfMatrix_2.mat')
load('tfMatrix.mat')
load('tfMatrix_3.mat')
load('tfMatrix.mat')
load('tfMatrix_2.mat')
load('tfMatrix_3.mat')
load('tfMatrix_2.mat')
load('tfMatrix_3.mat')
load('tfMatrix.mat')
load()
cd
cd ..
pwd
cd ..
pwd
cd RADIO
cd Assignements
cd 2
ls
cd data
cd matlab
load('rx_power.mat')
H2
pdp = mean(abs(ifft(H2)).^2,2);
%-- 2024-05-19, 10:58 PM --%
load('rx_power.mat')
%-- 2024-05-26, 8:24 PM --%
doc
%-- 2024-05-26, 9:44 PM --%
A = [1 2; 3 4] + i*[5 6; 7 8];
B = A’;
B = A';
B = A.';
clear
A = [1 2; 3 4] + i*[5 6; 7 8];
B = A.';
figure(2)
figure(3)
close(1)
close(2)
close(3)
y = x.^2;
z = x .* y;
z = y ./ x;
y = x.*exp(-x);
grid on
grid off
title('Hello world!');
title('that''s all I want to do')
% Set the number of points
N = 100;
% Generate a random x signal with values between 0 and 1
x = rand(1, N);
clear
% Set the number of points
N = 100;
% Generate a random x signal with values between 0 and 1
x = rand(1, N);
xlabel('x, sec');
ylabel('y, V');
zlabel('z, Hz');
% Set the number of points
N = 100;
% Generate random x and y signals with values between 0 and 1
x = rand(1, N);
y = rand(1, N);
plot(x, y, 'g--');
plot(y, 'go');
semilogx(x, y);
semilogy(x, y);
loglog(x, y);
grid on
grid off
grid on
grid off
x = rand(1, N);
x1 = rand(1, N);
x2 = rand(1, N);
y = rand(1, N);
y2 = rand(1, N);
y3 = rand(1, N);
plot(x, y1, x, y2, x, y3);
y1 = rand(1, N);
plot(x, y1, x, y2, x, y3);
hold on
plot(x, y1);
plot(x, y2);
plot(x, y3);
hold off
clear figure
clear figure(1)
hold on
plot(x, y1);
plot(x, y2);
plot(x, y3);
hold off
% Define the size of the matrix
rows = 4;
columns = 5;
% Generate a random matrix A with values between 0 and 1
A = rand(rows, columns);
clear
% Define the size of the matrix
rows = 4;
columns = 5;
% Generate a random matrix A with values between 0 and 1
A = rand(rows, columns);
plot(A)
axis([5 25 10E-13 10E-4]);
axis('auto');
N = 100;
x = rand(1, N);
y = rand(1, N);
y = x.^2;
z = x .* y;
z = y ./ x;
y = x.*exp(-x);
for index = 1:10
matrix(:, index) = file(:, index);
end
if n < 0
A = negative(n)
elseif rem(n,2) == 0
A = even(n)
else
A = odd(n)
end
n = 100
if n < 0
A = negative(n)
elseif rem(n,2) == 0
A = even(n)
else
A = odd(n)
end
% Function definitions
function A = negative(n)
A = -abs(n); % Example: returns the negative absolute value of n
end
function A = even(n)
A = n + 2; % Example: returns n plus 2 if n is even
end
function A = odd(n)
A = n + 1; % Example: returns n plus 1 if n is odd
end
%-- 2024-06-01, 10:24 AM --%
cd ~/Developer/imr_wirelessnetwork_lab
cd data/matlab
load('tfMatrix.mat')
load('tfMatrix_2.mat')
load('tfMatrix_3.mat')
clear
load('tfMatrix_2.mat')
clear
load('tfMatrix_3.mat')
contourf(abs(tfMatrix));
clear
load('tfMatrix.mat')
contourf(abs(tfMatrix));
%-- 2024-06-03, 10:25 PM --%
cd ~/Developer/RADIO/Assignements
cd 3
labSessionEurecom
%-- 2024-06-03, 10:50 PM --%
labSessionEurecom_Part1
labSessionEurecom_Part2
%-- 2024-06-08, 12:13 PM --%
cd ~/Developer/SP4COM/Homeworks/tp1/matlab
call
example
%-- 2024-06-14, 2:14 PM --%
cd ~/Developer/RADIO/Assignements/3
labSessionEurecom
pcolor(abs(x_origin))
pcolor(abs(x_orig))
doc interpol
doc interp
h_ext3 = interp(h_est2,6)
h_est = yp./p
h_est2 = mean(h_est,2)
h_interp = interp1(kp,h_est2,"spline")
h_interp = interp1(kp,h_est2,1:k, "spline")
h_interp = interp1(kp,h_est2,1:K, "spline")
h_interp = interp1(kp,h_est2,1:K, 'spline', 'extrap');
plot(h_interp)
y_equ = y_norm ./ h_interp
y_equ = y_norm./h_interp
y_norm = y / r;
y_equ = y_norm./h_interp
h_est = yp./p
h_est = yp./p;
plot(h_est)
plot(h_est, '.')
plot(h_est(1,:), '.')
clear
clear all
labSessionEurecom
h_est = yp./p;
plot(h_est(1,:), '.')
plot(h_est, '.')
%-- 2024-06-16, 9:54 PM --%
qpsk
%-- 2024-06-17, 7:03 AM --%
labSessionEurecom
h_est = yp./P;
h_est2 = mean(h_est,2);
h_interp = interp1(kp,h_est2,1:K, "spline")
h_est = yp./P; plot(h_est) plot(h_est, '.') plot(h_est(1,:), '.')
plot(h_est(1,:), '.')
clear all
labSessionEurecom
plot(h_est, '.')
h_est2 = mean(h_est,2)
h_interp = interp1(kp,h_est2,1:K, "spline")
h_interp = interp1(kp,h_est2,1:K, 'spline', 'extrap');
pcolor(abs(x_orig))
h_est2 = mean(h_est,2)
h_est = yp./P;
h_est2 = mean(h_est,2);
h_interp = interp1(kp,h_est2,1:K, 'spline', 'extrap');
plot(h_interp)
h_interp = interp1(kp,h_est2,1:K, "spline")
h_interp = interp1(kp,h_est2,1:K, "spline");
plot(h_interp)
