function freq_offset_est(signal, pss_1, Nf)
    # Frequency offset estimator

    DELTA_F = 10.0

    Fs = 61.44e6
    f_min = -7500
    f_max = 7500

    m = f_min:DELTA_F:f_max
    Y = zeros(ComplexF64, length(m))
    L = length(pss_1)
    t = 0:(1/Fs):((L-1)/Fs)

    signal_part = signal[Nf:Nf+L-1]
    convolve = conj.(pss_1) .* transpose(signal_part)

    for j = 1:length(m)
        signal_offset = sum(exp.(-2*pi*1.0im*m[j].*t) .* convolve)
        value = abs.(signal_offset)^2
        Y[j] += value
    end

    (A_fo, fo) = argmax(Y)
    # println("Detected offset = 150Mhz", real(m2_chan))

    println("m ", length(m), ", A_fo ", A_fo, ", fo ", fo)

    plot(1:length(m), Y, ".", label="Frequency offset")
end

