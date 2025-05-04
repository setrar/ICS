clc
clear

% close all
%% Configurable simulation parameters

% Repetition level
R = 1;

% Number of transmissions
T = 1;

% Signal to Noise Ratio (SNR)
snrRange = -20:10:30;

% STO error in samples, MUST BE NEGATIVE
stoError = -0;
if(stoError > 0)
    error('STO error in samples MUST BE NEGATIVE')
end

% CFO error in Hz, We assume that sc spacing is 15 kHz and Fsmp = 1.92 MHz
cfoErrorHz = -0;

%% Non-configurable simulation parameter - DO NOT EDIT!

% Number of subcarriers per OFDM symbol
K  = 72;

% Number of OFDM symbols per repetition
L = 14;

% Number of pilots per OFDM symbol
P = 12;

% Pilot spacing in number of subcarriers
ps = K/P;

% Specify pilot positions per OFDM symbol
kp = 1:ps:K;

% STO rotation vector of each OFDM symbol
%rot = exp(1j*2*pi*(0:1:K-1)*sto/K).';

% EVM [%] to guarantee succesful decoding
targetEvm = 50;

% Enable repetition combining
combEnabled = 1;

% Limits of x-y constellation in plots
constLimit = 2;

%% Initialize variables for storing results
evmResults = zeros(length(snrRange), 1);

%% Snr loop
for snrCnt = 1:length(snrRange)

    % Noise power
    N = 10^(-snrRange(snrCnt)/10);

    %% Transmission

    % Generate QPSK symbols
    x = 1/sqrt(2)*(2*randi([0 1], K, L)-1 + 1i*2*randi([0 1], K, L)-1i);

    % Save original QPSK symbols as reference for EVM estimation
    x_orig = x;

    % IFFT, no DC
    cpLength = 9;
    timeSymbolLength = 128 + cpLength;
    xTimeDomain = zeros(timeSymbolLength, L);  % Initialize time domain symbols
    for symbolCnt = 1:L
        % Place symbols to the central part of the bandwidth
        freq_128bins = [zeros(28,1); x(:,symbolCnt); zeros(28,1)].';

        % Apply fftshift and ifft
        freq_128bins = fftshift(freq_128bins);
        time_128samp = ifft(freq_128bins) * sqrt(128);

        % Add CP
        cpSamples = time_128samp(end-cpLength+1:end);
        timeSymbol = [cpSamples time_128samp];

        xTimeDomain(:,symbolCnt) = timeSymbol.';
    end

    %% Channel

    % Generate flat, static channel
    h = 1/sqrt(2) + 1i/sqrt(2);

    %% Reception

    % Initialize received signal
    y = zeros(K, L);

    % Loop over repetitions
    for r = 1:R
        % Generate complex Gaussian noise
        n = sqrt(N/2) * (randn(timeSymbolLength, L) + 1i * randn(timeSymbolLength, L));

        % Received signal in time domain
        yTime = h * xTimeDomain + n;

        % CFO compensation loop
        for symbolCnt = 1:L
            % Extract current symbol
            symbolTd = yTime(:, symbolCnt).';

            % Add CFO
            samplingRate = 1.92e6;
            cfoPhaseRamp = 2*pi*cfoErrorHz/samplingRate;
            cfoSampleInit = (r-1) * length(symbolTd) * L + (symbolCnt-1) * length(symbolTd);
            cfoVector = exp(1i * cfoPhaseRamp * ([0:length(symbolTd)-1] + cfoSampleInit));
            symbolTd = symbolTd .* cfoVector;

            % Remove CP containing STO error
            symbolTd = symbolTd(cpLength+1+stoError:end+stoError);

            % FFT and fftshift
            symbolFd = fftshift(fft(symbolTd));

            % Extract central subcarriers 
            startSc = (128 - K)/2 + 1;
            yr(:, symbolCnt) = symbolFd(startSc:startSc+K-1);
        end

        % Repetition combining (or not)
        y = combEnabled * y + yr;

        % Normalize the signal according to the repetition index
        y_norm = y / r;

        % Extract pilot subcarriers from current signal
        yp = yr(kp, :);

        % Least square channel estimation for pilots and average over symbols and subcarriers
        h_est2 = yp ./ x(kp, :);

        % Interpolate h_est2 over all subcarriers
        h_interp = interp1(kp, h_est2, 1:K, 'spline', 'extrap');

        % Zero-forcing equalization
        x_est = y_norm ./ h_interp;

        % Calculate Error Vector Magnitude (EVM) per repetition
        evmResults(snrCnt) = evmResults(snrCnt) + sqrt(sum(abs(x - x_est).^2, 'all') / sum(abs(x).^2, 'all')) * 100;
    end

    % Average EVM over repetitions
    evmResults(snrCnt) = evmResults(snrCnt) / R;
end

% Plot EVM vs SNR
figure;
plot(snrRange, evmResults, '-o', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('EVM (%)');
title('EVM vs SNR');
ylim([0 100]);

% Display interpolated channel estimates for verification
disp('Interpolated channel estimates:');
disp(h_interp);
