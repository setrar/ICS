using LinearAlgebra

# Perceptron class definition
mutable struct Perceptron
    weights::Vector{Float64}
    bias::Float64
end

# Constructor for Perceptron
function Perceptron(input_size::Int)
    weights = rand(Float64, input_size)
    bias = rand()
    return Perceptron(weights, bias)
end

# Activation function (step function)
function activate(x)
    return x > 0 ? 1.0 : 0.0
end

# Prediction method for Perceptron
function predict(perceptron::Perceptron, input::Vector{Float64})
    weighted_sum = (perceptron.weights ⋅ input) + perceptron.bias
    return activate(weighted_sum)
end

# Train the perceptron model
function train_perceptron!(model, train_data, epochs = 10, lr = 0.1)
    for epoch in 1:epochs
        for (x, y) in train_data
            ŷ = predict(model, x)
            error = y - ŷ
            
            # Update weights and bias
            model.weights .+= lr * error * x
            model.bias += lr * error
        end
        println("Epoch $epoch")
    end
end
