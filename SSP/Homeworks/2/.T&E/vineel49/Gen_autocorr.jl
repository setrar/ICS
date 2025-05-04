function Gen_autocorr(fade_var_1D, l, m, chan_len, FFT_len)
    auto_cor = 0.0 + 0.0im  # autocorrelation initialization
    for auto_cnt in 0:chan_len-1
        auto_cor += fade_var_1D * exp(-1.0im * 2.0 * π * (l - m) * auto_cnt / FFT_len)
    end
    return auto_cor
end
