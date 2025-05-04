function powerDensity = computePowerDensityAt1m(PTx, GTx)
    % computePowerDensityAt1m - Computes the power density at 1 meter
    % 
    % Inputs:
    %   PTx - Transmitter power (in watts)
    %   GTx - Transmitter gain
    % 
    % Output:
    %   powerDensity - Power density at 1 meter (in watts per square meter)

    d = 1; % Distance in meters
    piValue = pi; % Value of Pi

    % Calculate the power density at 1 meter
    powerDensity = PTx * GTx / (4 * piValue * d^2);

end
