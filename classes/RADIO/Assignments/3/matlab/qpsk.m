% Define parameters
numSymbols = 100; % Number of symbols in the signal

% Generate random symbols
data = randi([0 3], numSymbols, 1); % Generate symbols for QPSK (0 to 3)

% QPSK modulation
modData = exp(1i * (pi/4 + data * pi/2));

% Insert pilot symbols
pilotInterval = 10; % Insert a pilot every 10 symbols
pilotSymbol = exp(1i * pi/4); % Define a specific pilot symbol, e.g., exp(i*pi/4) for QPSK
pilotIndices = 1:pilotInterval:length(modData);
modData(pilotIndices) = pilotSymbol;

% Interpolate using interp1 - fill in missing symbols between pilots
fullIndex = 1:length(modData);
pilotData = modData(pilotIndices);
interpSymbols = interp1(pilotIndices, pilotData, fullIndex, 'linear', 'extrap');

% Plot the original constellation
figure;
plot(real(modData), imag(modData), 'bo');
hold on;
plot(real(modData(pilotIndices)), imag(modData(pilotIndices)), 'rs', 'MarkerFaceColor', 'r');
legend('Data Symbols', 'Pilot Symbols');
title('Original Constellation with Pilots');
xlabel('In-phase');
ylabel('Quadrature');
axis equal;
grid on;

% Plot the interpolated constellation
figure;
plot(real(interpSymbols), imag(interpSymbols), 'bo');
hold on;
plot(real(interpSymbols(pilotIndices)), imag(interpSymbols(pilotIndices)), 'rs', 'MarkerFaceColor', 'r');
legend('Interpolated Symbols', 'Pilot Symbols');
title('Interpolated Constellation');
xlabel('In-phase');
ylabel('Quadrature');
axis equal;
grid on;
