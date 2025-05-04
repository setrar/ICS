wp = 0.2*pi; ws = 0.3*pi;  tr_width = ws - wp;
M = ceil(6.6*pi/tr_width) + 1
M = 67
n=[0:1:M-1];
wc = (ws+wp)/2, % Ideal LPF cutoff frequency
hd = ideal_lp(wc,M);  w_ham = (hamming(M))';  h = hd .* w_ham;
[db,mag,pha,grd,w] = freqz_m(h,1);  delta_w = 2*pi/1000;
Rp = -(min(db(1:1:wp/delta_w+1)));    % Actual Passband Ripple
Rp = 0.0394
As = -round(max(db(ws/delta_w+1:1:501))) % Min Stopband attenuation
As = 52
% plots
subplot(2,2,1); stem(n,hd); title('Ideal Impulse Response')
axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('hd(n)')
subplot(2,2,2); stem(n,w_ham);title('Hamming Window')
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w(n)')
subplot(2,2,3); stem(n,h);title('Actual Impulse Response')
axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('h(n)')
subplot(2,2,4); plot(w/pi,db);title('Magnitude Response in dB');grid
axis([0 1 -100 10]); xlabel('frequency in pi units'); ylabel('Decibels')
