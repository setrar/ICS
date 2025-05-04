function periodo(signal, N)
    ns = length(signal)
    
    if rem(N, 2) != 0
        error("N must be even")
    end

    signal = reshape(signal, 1, :)  # force a row vector

    if N <= ns
        in = signal[1:N]
        ns = N
    else
        in = vcat(signal, zeros(1, N - ns))  # zero padding
    end

    dsp = abs.(fft(in))
    DSP = dsp[1:div(N, 2) + 1] / sqrt(ns)

    f = 0:1/N:0.5

    # The original periodo.m matlab source code has been modified 
    # the sig function is now returning f and DSP to be displayed externally
    # plot(f, 10 * log10.(DSP.^2), xlabel="Normalized frequency", ylabel="dB", grid=true)
    return f, DSP
end