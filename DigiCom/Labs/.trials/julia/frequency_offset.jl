using DSP
using Plots

# Parameters
fs = 1e6  # Sampling frequency
T = 1/fs  # Sampling period
N = 1000  # Number of samples

# Generate a synchronization signal with a frequency offset
delta_f = 10e3  # Frequency offset in Hz
n = 0:N-1
sync_signal = exp(2π * im * delta_f * n * T)  # Complex exponential with frequency offset

# Simulate received signal with frequency offset and noise
received_signal = sync_signal + 0.1 * randn(N)  # Adding some Gaussian noise

# Frequency offset estimation
correlation = xcorr(received_signal, sync_signal)  # Cross-correlation
lags = DSP.lags(correlation)  # Lags corresponding to the cross-correlation

# Find the index corresponding to the maximum correlation
idx_max_correlation = argmax(correlation)

# Estimated frequency offset
estimated_delta_f = lags[idx_max_correlation] / N * fs

println("True Frequency Offset: $delta_f Hz")
println("Estimated Frequency Offset: $estimated_delta_f Hz")

# Plot cross-correlation
plot(lags, real(correlation), xlabel="Lags", ylabel="Cross-Correlation", label="Cross-Correlation")

