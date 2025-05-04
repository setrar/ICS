% Eurecom lab session: OFDM receiver with coverage enhancement
% Date: May 2024
% Course: Radio Engineering
% Professor: Florian Kaltenberger
% Guest lecturers: Dr. Elena Lukashova (elukashova@sequans.com) 
%                  Dmitry Pyatkov 

clc
clear

% Configurable simulation parameters

% Repetition level
% R = 32;
R = 1;

% Number of transmissions
% T = 100;
T = 1;

% Signal to Noise Ratio (SNR)
snrRange = -20:10:30;
% snrRange = 30;


% STO error in samples, MUST BE NEGATIVE
stoError = -4;
if(stoError > 0)
    error('STO error in samples MUST BE NEGATIVE')
end

% CFO error in Hz, We assume that subcarrier spacing is 15 kHz and Fsmp = 1.92 MHz
cfoErrorHz = 0;

% Non-configurable simulation parameter - DO NOT EDIT!

% Number of subcarriers per OFDM symbol
K  = 72;

% Number of OFDM symbols per repetition
L = 14;

% Number of pilots per OFDM symbol
P = 12;

% Pilot spacing in number of subcarriers
ps = K / P;

% Specify pilot positions per OFDM symbol
kp = 1:ps:K;

% EVM [%] to guarantee successful decoding
targetEvm = 50;

% Enable repetition combining
combEnabled = 1;

% Limits of x-y constellation in plots
constLimit = 2;

% Run simulations with and without STO
evm_snr_sto = runOFDM(snrRange, stoError, K, L, kp, P, R, T, cfoErrorHz, combEnabled);
evm_snr_no_sto = runOFDM(snrRange, 0, K, L, kp, P, R, T, cfoErrorHz, combEnabled);

% Plot EVM vs SNR
figure;
hold on;
plot(snrRange, 10 * log10(evm_snr_sto), '-o', 'LineWidth', 2, 'DisplayName', 'With STO');
plot(snrRange, 10 * log10(evm_snr_no_sto), '-x', 'LineWidth', 2, 'DisplayName', 'Without STO');
xlabel('SNR (dB)');
ylabel('EVM (dB)');
title('EVM vs SNR with and without STO');
legend;
grid on;

% Function to compute EVM
function evm = computeEVM(x_orig, x_est)
    % Compute the error vector
    e = x_orig - x_est;

    % Compute the mean squared error of the error vector
    mse_error = abs(e).^2;

    % Compute the mean squared value of the transmitted signal
    mse_signal = abs(x_orig).^2;

    % Compute the EVM in percentage
    evm = 100 * sqrt(mean(mean(mse_error)) ./ mean(mean(mse_signal)));
end

% Function to run OFDM transmission and reception
function evm_snr = runOFDM(snrRange, stoError, K, L, kp, P, R, T, cfoErrorHz, combEnabled)
    evm_snr = zeros(1, length(snrRange));
    
    for snrCnt = 1:length(snrRange)

        % Noise power
        N = 10^(-snrRange(snrCnt)/10);

        % Transmission
        % Generate QPSK symbols
        x = 1/sqrt(2)*(2*randi([0 1], K, L)-1 + 1i*2*randi([0 1], K, L)-1i);

        % Assign pilots from symbols - these will be known to the receiver
        p = x(kp, :);

        % Save original QPSK symbols as reference for EVM estimation
        x_orig = x;

        % IFFT, no DC
        xTimeDomain = zeros(128 + 9, L);  % Adjusted for CP
        for symbolCnt = 1:L

            % Place symbols to the central part of the bandwidth
            freq_128bins = [zeros(28,1); x(:,symbolCnt); zeros(28,1)].';

            % Apply fftshift and ifft
            freq_128bins = fftshift(freq_128bins);
            time_128samp = ifft(freq_128bins)*sqrt(128);

            % Add CP
            cpLength    = 9;
            cpSamples   = time_128samp(end-cpLength+1:end);
            timeSymbol  = [cpSamples time_128samp];

            xTimeDomain(:,symbolCnt) = timeSymbol.';

        end

        % Channel
        % Generate flat, static channel
        h = 1/sqrt(2) + 1/sqrt(2)*1i;

        % Reception
        evm_trans = zeros(1, T);  % Initialize storage for EVM of each transmission
        for t = 1:T

            % Initialize receive signal
            y = zeros(K, L);

            % Loop over repetitions
            evm_rep = zeros(1, R);  % Initialize storage for EVM of each repetition
            for r = 1:R

                % Generate complex Gaussian noise
                n = sqrt(N/2)*randn(128+cpLength, L) + sqrt(N/2)*1i*randn(128+cpLength, L);

                % Received signal in time domain
                yTime = h*xTimeDomain + n;

                yr = zeros(K, L);
                for symbolCnt = 1:L
                    % Extract current symbol
                    symbolTd = yTime(:,symbolCnt).';
    
                    % Apply CFO correction using the function
                    symbolCorrected = applyCFOCorrection(symbolTd, cfoErrorHz, r, symbolCnt);

                    % Apply FFT and processing (if stoError = 0)
                    if stoError == 0
                         % FFT and fftshift
                        symbolFd = fftshift(fft(symbolCorrected));
        
                        % Remove CP (no STO to remove)
                        symbolFd = symbolFd(cpLength+1:end);
        
                        % Extract central subcarriers 
                        startSc = (128 - K)/2 + 1;
                        yr(:,symbolCnt) = symbolFd(startSc:startSc+K-1);
                    else               
    
                        % Detection 
                        % Remove CP containing STO error
                        symbolTd = symbolTd(cpLength+1+stoError:end+stoError);
    
                        % FFT and fftshift
                        symbolFd = fftshift(fft(symbolTd));
    
                        startSc = (128 - 72)/2 + 1;
    
                        % Extract central subcarriers 
                        yr(:,symbolCnt) = symbolFd(startSc:startSc+K-1);
    
                    end

                    % Store corrected symbol in time domain
                    yTime(:,symbolCnt) = symbolCorrected.';


                end

                % Repetition combining (or not)
                y = combEnabled * y + yr;

                % Normalize the signal according to the repetition index
                y_norm = y / r;

                % Extract pilot subcarriers from current signal
                yp = y_norm(kp,:); 

                % Least square channel estimation for pilots and average over symbols and subcarriers
                h_est = mean(mean(yp ./ p, 2));
                
                % Zero-forcing equalization
                x_est = y_norm ./ h_est;

                % Calculate Error Vector Magnitude (EVM) per repetition
                evm_rep(r) = computeEVM(x_orig, x_est);
            end

            % Calculate EVM per transmission
            evm_trans(t) = mean(evm_rep);
        end

        % Calculate EVM per SNR
        evm_snr(snrCnt) = mean(evm_trans);
    end
end

function symbolCorrected = applyCFOCorrection(symbolTd, cfoErrorHz, r, symbolCnt)
    % Parameters for CFO compensation
    samplingRate = 1.92e6;
    cfoPhaseRamp = 2*pi*cfoErrorHz/samplingRate;
    cfoSampleInit = (r-1)*length(symbolTd) + (symbolCnt-1)*length(symbolTd);
    
    % CFO vector generation
    cfoVector = exp(1j*cfoPhaseRamp*((0:length(symbolTd)-1)+cfoSampleInit));
    
    % Apply CFO correction to symbol
    symbolCorrected = symbolTd .* cfoVector;
end



