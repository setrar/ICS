% Example usage of the signalgen function

% Parameters
m = 4;          % Number of antennas
M = 1000;       % Number of samples
theta = pi/4;   % DOA of the desired signal (45 degrees)
phi = pi/6;     % DOA of the interferer (30 degrees)
SIR = 20;       % Signal-to-Interference Ratio in dB
SNR = 30;       % Signal-to-Noise Ratio in dB

% Call the signalgen function
[y, a, h] = signalgen(m, M, theta, phi, SIR, SNR);

% Display the results
disp('Generated channel vector h:');
disp(h);

disp('First 10 samples of the transmitted symbols a:');
disp(a(1:10));

disp('First 10 received signal vectors y:');
disp(y(:, 1:10));

% Plot the real and imaginary parts of the first antenna's received signal
figure;
subplot(2, 1, 1);
plot(real(y(1, :)));
title('Real Part of Received Signal at Antenna 1');
xlabel('Sample Index');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(imag(y(1, :)));
title('Imaginary Part of Received Signal at Antenna 1');
xlabel('Sample Index');
ylabel('Amplitude');

% Plot the constellation diagram of the transmitted symbols
figure;
scatter(real(a), imag(a), 'filled');
title('Constellation Diagram of Transmitted Symbols');
xlabel('In-Phase');
ylabel('Quadrature');
grid on;
