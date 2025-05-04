# Define the Nakagami distribution
struct Nakagami{T<:Real} <: ContinuousUnivariateDistribution
    μ::T
    ω::T
end

# Import necessary functions from Distributions
import Distributions: pdf, rand, logpdf, fit_mle

# Functions for Nakagami distribution
function pdf(d::Nakagami, x::Real)
    if x < 0
        return 0.0
    end
    (2 * (d.μ ^ d.μ) / (gamma(d.μ) * d.ω ^ d.μ)) * (x ^ (2 * d.μ - 1)) * exp(-d.μ * (x ^ 2) / d.ω)
end

function rand(d::Nakagami, n::Int=1)
    if n == 1
        return sqrt(d.ω / d.μ) * sqrt(rand(Gamma(d.μ, 1)))
    else
        return sqrt(d.ω / d.μ) .* sqrt.(rand(Gamma(d.μ, 1), n))
    end
end

function logpdf(d::Nakagami, x::Real)
    if x < 0
        return -Inf
    end
    log(2) + d.μ * log(d.μ) - log(gamma(d.μ)) - d.μ * log(d.ω) + (2 * d.μ - 1) * log(x) - d.μ * (x ^ 2) / d.ω
end

function fit_mle(::Type{Nakagami}, data::Vector{T}) where T
    positive_data = data[data .>= 0]
    μ̂ = (mean(positive_data) ^ 2) / mean(positive_data .^ 2)
    ω̂ = mean(positive_data .^ 2)
    Nakagami(μ̂, ω̂)
end
