# Function to generate Zadoff-Chu sequence
function zadoff_chu_sequence(u, N)
    return exp.(-1.0im * π * u * (0:N-1) .* (1:N) / N)
end

# Function to perform frequency-domain correlation
function freq_domain_correlation(rx_signal, u, Ncs, nuind)
    xuv = zadoff_chu_sequence(u, L)
    xuv_shifted = [xuv[1 + rem(n + (Ncs * nuind), L)] for n in 0:L-1]
    yuv = fft(xuv_shifted)
    
    rxsig_freq = fft(rx_signal)
    correlation = ifft(rxsig_freq .* conj.(yuv))
    
    return correlation
end

# Function to estimate time-delay
function estimate_time_delay(correlation)
    max_value, max_index = findmax(abs.(correlation))
    return max_index - 1
end