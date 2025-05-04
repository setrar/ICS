struct Signal
    m::Int         # Number of antennas
    M::Int         # Number of samples
    θ::Float64     # DOA of the desired signal (in radians)
    φ::Float64     # DOA of the interferer (in radians)
    SIR::Float64   # Signal-to-Interference Ratio (in dB)
    SNR::Float64   # Signal-to-Noise Ratio (in dB)

    # Inner constructor to allow keyword arguments
    function Signal(; m, M, θ, φ, SIR, SNR)
        new(m, M, θ, φ, SIR, SNR)
    end
end

function generate(params::Signal)
    # Extract parameters from the struct
    m = params.m
    M = params.M
    θ = params.θ
    φ = params.φ
    SIR = params.SIR
    SNR = params.SNR

    # Constants
    σₐ² = 1.0 # Power of the desired signal
    σₐ = √(σₐ²) # Standard deviation of the desired signal

    # Calculate the power of the interferer and noise
    σᵦ² = σₐ² / 10^(SIR / 10) # Power of the interferer
    σᵦ = √(σᵦ²) # Standard deviation of the interferer
    σᵤ² = σₐ² / 10^(SNR / 10) # Power of the noise per antenna
    σᵤ = √(σᵤ²) # Standard deviation of the noise per antenna

    # Generate QPSK symbols for the desired signal
    aᵣ = (rand(1:2, M) .- 1.5) * 2 * σₐ / √(2)
    aᵢ = (rand(1:2, M) .- 1.5) * 2 * σₐ / √(2)
    a₀ = aᵣ .+ j * aᵢ

    # Generate QPSK symbols for the interferer signal
    bᵣ = (rand(1:2, M) .- 1.5) * 2 * σᵦ / √(2)
    bᵢ = (rand(1:2, M) .- 1.5) * 2 * σᵦ / √(2)
    bᵩ = bᵣ .+ j * bᵢ

    # Generate the array response vectors
    d = 0.5 # Spacing between antennas (normalized to wavelength)
    h = exp.(j * 2π * d * (0:m-1) .* sin(θ)) # Array response for desired signal
    g = exp.(j * (2π * d * (0:m-1) .* sin(φ) .+ π/4)) # Array response for interferer

    # Generate noise
    uᵣ = randn(m, M) * √(σᵤ²/2)
    uᵢ = randn(m, M) * √(σᵤ²/2)
    u = uᵣ .+ j .* uᵢ

    # Reshape a₀ and bᵩ to 1 x M for matrix multiplication
    a₀ = reshape(a₀, 1, M)
    bᵩ = reshape(bᵩ, 1, M)

    # Reshape h and g to m x 1 for matrix multiplication
    h = reshape(h, m, 1)
    g = reshape(g, m, 1)

    # Calculate the total received signal
    y = h * a₀ .+ g * bᵩ .+ u

    return y, a₀, h
end