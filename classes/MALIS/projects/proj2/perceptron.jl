# Define a struct for a single perceptron (binary or multi-class)
mutable struct Perceptron
    weights::Vector{Float64}
    bias::Float64
end

# Constructor for the perceptron
function Perceptron(input_size::Int)
    weights = randn(input_size)
    bias = randn()
    return Perceptron(weights, bias)
end

# Sigmoid activation function
function sigmoid(x)
    return 1.0 / (1.0 + exp(-x))
end

# Prediction function for the perceptron
function predict(model::Perceptron, input::Vector{Float64})
    return sigmoid(dot(model.weights, input) + model.bias) > 0.5 ? 1 : 0
end

# Training function for the perceptron
function train!(model::Perceptron, inputs::Matrix{Float64}, targets::Vector{Int}, epochs::Int, learning_rate::Float64)
    for epoch in 1:epochs
        ŷ₊ = 0.0
        for i in 1:size(inputs, 2)
            x = inputs[:, i]
            y = targets[i]
            ŷ = predict(model, x); ŷ₊ += ŷ
            error = y - ŷ
            model.weights .+= learning_rate * error * x
            model.bias += learning_rate * error
        end
        if epoch == 10 
            println("Epoch $epoch, Progress: .........\t")
        end
    end
end

# Multi-class perceptron extends the basic perceptron
mutable struct MultiClassPerceptron
    perceptrons::Vector{Perceptron}
end

# Constructor for the multi-class perceptron
function MultiClassPerceptron(input_size::Int, num_classes::Int)
    perceptrons = [Perceptron(input_size) for _ in 1:num_classes]
    return MultiClassPerceptron(perceptrons)
end

# Training function for the multi-class perceptron
function train!(model::MultiClassPerceptron, inputs::Matrix{Float64}, targets::Vector{Int}, epochs::Int, learning_rate::Float64)
    for i in 1:length(model.perceptrons)
        # Create binary targets for the current perceptron
        binary_targets = [target == i ? 1 : 0 for target in targets]
        train!(model.perceptrons[i], inputs, binary_targets, epochs, learning_rate)
    end
end

# Prediction function for the multi-class perceptron
function predict(model::MultiClassPerceptron, input::Vector{Float64})
    # Get the predictions from each perceptron
    predictions = [predict(perceptron, input) for perceptron in model.perceptrons]
    # Return the index of the perceptron with the highest prediction score
    return argmax(predictions)
end

