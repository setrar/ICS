function sig(N, sigpar=[0.057, 0.082, 20, 20])
    # Generates N samples of a signal y, consisting of
    # two sinusoids plus white noise of unit variance.
    # sigpar = vector of 4 signal parameters (f₁, f₂, A₁, A₂)

    if length(sigpar) == 0
        sigpar = [0.057, 0.082, 20, 20]
    end

    f₁, f₂, A₁, A₂ = sigpar
    t = 1:N; @show t
    y = A₁ * cos.(2π * (f₁ * t .+ rand())) + A₂ * cos.(2π * (f₂ * t .+ rand()))
    y += randn(N)

    # The original sig.m matlab source code has been modified 
    # the sig function is now returning x and y to be displayed externally
    return t, y
end
