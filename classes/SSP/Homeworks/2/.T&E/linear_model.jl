# Define a structure to hold parameters and data
struct Model
    slope::Float64
    intercept::Float64
    variance::Float64
    data::Vector{Float64}
end

# Constructor function for the Model structure
function Model(slope, intercept, variance, data)
    return Model(slope, intercept, variance, data)
end

# Likelihood function
function likelihood(model::Model)
    return prod(pdf.(Normal.(model.slope .* model.data .+ model.intercept, sqrt(model.variance)), model.data))
end

# Prior distribution
function prior(model::Model)
    return prod(pdf.(Normal(0.0, 1.0), model.slope)) * pdf(Normal(0.0, 1.0), model.intercept)
end

# Posterior distribution
function posterior(model::Model)
    return likelihood(model) * prior(model)
end

# MAP estimator
function map_estimator(model::Model)
    # Define a grid of candidate slope and intercept values
    candidate_slope = range(1.0, stop=3.0, length=100)
    candidate_intercept = range(-1.0, stop=1.0, length=100)

    # Initialize variables to store MAP estimate and maximum posterior
    map_estimate_slope = NaN
    map_estimate_intercept = NaN
    max_posterior = -Inf

    # Iterate over candidate values
    for slope in candidate_slope, intercept in candidate_intercept
        # Calculate the unnormalized posterior for each candidate
        current_posterior = posterior(Model(slope, intercept, model.variance, model.data))

        # Update MAP estimate if current posterior is higher
        if current_posterior > max_posterior
            max_posterior = current_posterior
            map_estimate_slope = slope
            map_estimate_intercept = intercept
        end
    end

    return map_estimate_slope, map_estimate_intercept
end

