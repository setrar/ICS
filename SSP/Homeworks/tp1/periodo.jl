# include("periodo.jl");
function periodo(x, N)
    ns = length(x)
    
    if rem(N, 2) != 0
        error("N must be even")
    end

    x = reshape(x, 1, :)  # force a row vector

    if N <= ns
        in = x[1:N]
        ns = N
    else
        in = x ⧺ zeros(1, N - ns)  # zero padding
    end

    𝑋 = abs.(𝓕(in))  ## fft
    𝑋 = 𝑋[1:div(N, 2) + 1] / √(ns)

    f = 0:1/N:0.5

    # The original periodo.m matlab source code has been modified 
    # the sig function is now returning f and DSP to be displayed externally
    # plot(f, 10 * log10.(DSP.^2), xlabel="Normalized frequency", ylabel="dB", grid=true)
    return f, 𝑋
end
