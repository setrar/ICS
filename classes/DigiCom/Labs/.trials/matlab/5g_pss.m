% Parameters
fs = 1e6;  % Sampling frequency
T = 1/fs;  % Sampling period
N = 1024;  % Number of samples

% Generate a sample PSS signal (replace this with your actual PSS signal)
n = 0:N-1;
PSS_signal = cos(2*pi*100e3*n*T);  % Example: 100 kHz PSS signal

% Compute the power spectrum using FFT
fft_PSS = fftshift(fft(PSS_signal));
frequencies = linspace(-fs/2, fs/2, N);

% Plot the power spectrum on a dB scale
figure;
plot(frequencies, 10*log10(abs(fft_PSS).^2));
xlabel('Frequency (Hz)');
ylabel('Power Spectrum (dB)');
title('Power Spectrum of PSS Signal');
grid on;