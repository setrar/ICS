% Parameters
fs = 122.88e6;   % Sampling frequency (Hz)
SCS = 30e3;      % Subcarrier spacing (Hz)
PRBS = 0:105;    % PRB indices (vector)
DS = 300e-9;     % Delay spread (seconds)
chan_type = "tdlc";  % Channel model type: "tdlc" or "tdld"

% Call the function
H = get_tdl(fs, SCS, PRBS, DS, chan_type);

% Display the resulting channel impulse response
disp('Channel Impulse Response:')
disp(H);

plot(H)

% You can now use the obtained channel response in your simulation or analysis.
