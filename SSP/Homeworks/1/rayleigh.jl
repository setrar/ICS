module custom

import Distributions #: Rayleigh, Sampleable, Continuous, Univariate

# Export All
for n in names(@__MODULE__; all=true)
    if Base.isidentifier(n) && n ∉ (Symbol(@__MODULE__), :eval, :include)
        @eval export $n
    end
end

"""
https://discourse.julialang.org/t/implementing-a-custom-sampler-in-distributions-jl/41066
include("rayleigh.jl")
julia> using Random: seed!; seed!(42)
julia> splr = ScaledShiftedRayleighSampler(Rayleigh(), 3.0, 6.0)
julia> using Distributions
julia> splr = Tempo.ScaledShiftedRayleighSampler(Rayleigh(), 3.0, 6.0)
julia> rand(splr)
7.281532405238072

"""


struct ScaledShiftedRayleighSampler <: Distributions.Sampleable{Distributions.Univariate, Distributions.Continuous}
    distribution::Distributions.Rayleigh
    a::Float64
    b::Float64
end

function Base.rand(d::ScaledShiftedRayleighSampler)
    sample = rand(d.distribution)
    return sample * (d.b - d.a) + d.a
end

"""
            https://github.com/JuliaStats/Distributions.jl/blob/master/src/univariate/continuous/rayleigh.jl
"""

struct ScaledShiftedRayleigh{T<:Real} <: Distributions.ContinuousUnivariateDistribution
    α::T
    σ::T
    ScaledShiftedRayleigh{T}(α::T, σ::T) where {T<:Real} = new{T}(α, σ)
end

function ScaledShiftedRayleigh(α::T, σ::T; check_args::Bool=true) where {T<:Real}
    Distributions.@check_args ScaledShiftedRayleigh (α, α > zero(α)) (σ, σ > zero(σ))
    return ScaledShiftedRayleigh{T}(α, σ)
end

ScaledShiftedRayleigh(α::Integer, σ::Integer; check_args::Bool=true) = ScaledShiftedRayleigh(float(α), float(σ); check_args=check_args)
ScaledShiftedRayleigh() = ScaledShiftedRayleigh{Float64}(1.0, 1.0)

#### Conversions

convert(::Type{ScaledShiftedRayleigh{T}}, σ::S) where {T <: Real, S <: Real} = ScaledShiftedRayleigh(T(α),T(σ))
## Base.convert(::Type{Rayleigh{T}}, d::Rayleigh) where {T<:Real} = Rayleigh{T}(T(d.σ))
## Base.convert(::Type{Rayleigh{T}}, d::Rayleigh{T}) where {T<:Real} = d

# Implement the PDF method for the custom distribution
pdf(d::ScaledShiftedRayleigh, x::T) where {T<:Real} = (x - d.α) / d.σ^2 * exp(-((x - d.α)^2) / (2 * d.σ^2))

# Implement the mean method for the custom distribution
mean(d::ScaledShiftedRayleigh) = sqrt(pi / 2) * d.σ + d.α

# Implement the log-likelihood method for the custom distribution
function logpdf(d::ScaledShiftedRayleigh, x::T) where {T<:Real}
    return -(x - d.α)^2 / (2 * d.σ^2) - log(d.σ) - 0.5 * log(2 * π)
end

# ! Not finished
function log_likelihood(d::ScaledShiftedRayleigh, data::ScaledShiftedRayleighSampler) 
    return sum(logpdf(CustomRayleigh(true_α, true_σ), x) for x in data)
end

# pdf(d::MyDist, x::Float64) = pdf(Normal(d.mu, 2*d.sigma), x)
# rand(d::MyDist) = rand(Normal(d.mu, 2*d.sigma))
# sampler(d::MyDist) = sampler(Normal(d.mu, 2*d.sigma))
# logpdf(d::MyDist, x::Real) = logpdf(Normal(d.mu, 2*d.sigma), x)
# cdf(d::MyDist, x::Real) = cdf(Normal(d.mu, 2*d.sigma), x)
# quantile(d::MyDist, q::Real) = quantile(Normal(d.mu, 2*d.sigma), q)
# minimum(d::MyDist) = -Inf
# maximum(d::MyDist) = Inf
# insupport(d::MyDist, x::Real) = insupport(Normal(d.mu, 2*d.sigma), x)
# mean(d::MyDist) = mean(Normal(d.mu, 2*d.sigma))
# var(d::MyDist) = var(Normal(d.mu, 2*d.sigma))

end


