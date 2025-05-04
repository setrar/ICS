using LinearAlgebra
using Random

using FFTW

include("operations.jl")

# Define a custom type for multivariate normal distribution
struct MultivariateNormal
    mₓ::Vector{Float64}
    Cₓₓ::Matrix{Float64}
end

# Constructor function to create a MultivariateNormal instance
function MvNormal(mₓ::Vector{Float64}, Cₓₓ::Matrix{Float64})
    # Validate that the mean and covariance have compatible sizes
    size(mₓ, 1) == size(Cₓₓ, 1) == size(Cₓₓ, 2) || throw(ArgumentError("Incompatible sizes for mean and covariance"))

    return MultivariateNormal(mₓ, Cₓₓ)
end

# PDF function for the multivariate normal distribution
function pdfᵦ(mvn::MultivariateNormal, X::Vector{Float64}, m::Int64)
    # Validate that the input vector x has the same dimension as the mean
    size(mvn.mₓ, 1) == size(X, 1) || throw(ArgumentError("Incompatible sizes for mean and input vector"))

    normalization = (2 * π)^(-m / 2) * det(mvn.Cₓₓ)^(- 1/2 )
    exponent = - 1/2 * (X - mvn.mₓ)' * (mvn.Cₓₓ)⁻¹ * (X - mvn.mₓ)
    
    return normalization * exp(exponent)
end

# Example usage
mₓ  = [1.0, 2.0]
Cₓₓ = [1.0 0.5; 0.5 1.0]

mvn = MvNormal(mₓ, Cₓₓ)

# Evaluate PDF for a specific point
point = [1.5, 2.5]
result = pdfᵦ(mvn, point, 2)

println("PDF at $point: $result")
