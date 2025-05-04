function sig(N, sigpar=[0.057, 0.082, 20, 20])
    # Generates N samples of a signal y, consisting of
    # two sinusoids plus white noise of unit variance.
    # sigpar = vector of 4 signal parameters (𝑓₁, 𝑓₂, 𝐴₁, 𝐴₂)

    if length(sigpar) == 0
        sigpar = [0.057, 0.082, 20, 20]
    end

    𝑓₁, 𝑓₂, 𝐴₁, 𝐴₂ = sigpar
    t = 0.0:0.01:N; # @show t

    ϕ₁, ϕ₂ = -2π * randn(), 2π * randn()
    𝑣 = randn();
    yₜ = 𝐴₁ .* cos.(2π * 𝑓₁ .* t .+ ϕ₁) + 𝐴₂ .* cos.(2π * 𝑓₂ .* t .+ ϕ₂) .+ 𝑣;

    # The original sig.m matlab source code has been modified 
    # the sig function is now returning x and y to be displayed externally
    return t, yₜ
end