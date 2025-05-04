function [y, a, h] = signalgen(m, M, theta, phi, SIR, SNR)
    % Function to generate the signal y, the transmitted symbols a, and the channel vector h.
    % Inputs:
    % m     - Number of antennas (subchannels)
    % M     - Number of samples
    % theta - DOA of the desired signal (in radians)
    % phi   - DOA of the interferer (in radians)
    % SIR   - Signal-to-Interference Ratio (in dB)
    % SNR   - Signal-to-Noise Ratio (in dB)
    %
    % Outputs:
    % y     - m x M matrix of received signal samples
    % a     - 1 x M vector of transmitted symbols
    % h     - m x 1 channel vector for the desired signal

    % Constants
    sigma_a2 = 1; % Power of the desired signal
    sigma_a = sqrt(sigma_a2); % Standard deviation of the desired signal

    % Calculate the power of the interferer and noise
    sigma_b2 = sigma_a2 / 10^(SIR / 10); % Power of the interferer
    sigma_b = sqrt(sigma_b2); % Standard deviation of the interferer
    sigma_u2 = sigma_a2 / 10^(SNR / 10); % Power of the noise per antenna
    sigma_u = sqrt(sigma_u2); % Standard deviation of the noise per antenna

    % Generate QPSK symbols for the desired signal
    a_real = (randi([0 1], 1, M) * 2 - 1) * sigma_a / sqrt(2);
    a_imag = (randi([0 1], 1, M) * 2 - 1) * sigma_a / sqrt(2);
    a = a_real + 1i * a_imag;

    % Generate QPSK symbols for the interferer signal
    b_real = (randi([0 1], 1, M) * 2 - 1) * sigma_b / sqrt(2);
    b_imag = (randi([0 1], 1, M) * 2 - 1) * sigma_b / sqrt(2);
    b = b_real + 1i * b_imag;

    % Generate the array response vectors
    d = 0.5; % Spacing between antennas (normalized to wavelength)
    h = exp(1i * 2 * pi * d * (0:m-1)' * sin(theta)); % Array response for desired signal
    g = exp(1i * (2 * pi * d * (0:m-1)' * sin(phi) + pi / 4)); % Array response for interferer

    % Generate noise
    u_real = randn(m, M) * sqrt(sigma_u2 / 2);
    u_imag = randn(m, M) * sqrt(sigma_u2 / 2);
    u = u_real + 1i * u_imag;

    % Calculate the total received signal
    y = h * a + g * b + u;
end

