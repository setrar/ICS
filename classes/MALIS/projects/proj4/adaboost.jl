function adaboost(X_training, X_test, T, y_training, y_test)
    # Initialize weight distribution with equal weights for all points
    # dist = ones(size(X_training, 1)) / size(X_training, 1)
    dist = fill(1 / size(X_training, 1), size(X_training, 1), 1)

    # Array to store the weight of each classifier
    # alpha = zeros(T)
    alpha = zeros(T,1)
    
    # Initialize arrays to store errors and parameters for each round
    error_training_strong = fill(NaN, size(X_test, 1),1)
    error_test_strong = fill(NaN, size(X_test, 1),1)
    i_opt = zeros(Int, T, 1)
    p_opt = zeros(T, 1)
    theta_opt = zeros(T, 1)
    
    # Sum of weak learners predictions
    sum_cfs_training = zeros(size(X_training, 1),1)
    sum_cfs_test = zeros(size(X_test, 1),1)
    
    # Labels given by weak learners
    h_training = fill(-1, size(X_training, 1), T)
    h_test = fill(-1, size(X_test, 1), T)
    
    for i in 1:T
        # Train a learner from the dataset using distribution dist
        i_opt[i], p_opt[i], theta_opt[i], error_training, h_training[:, i] = choose_learner(X_training, y_training, dist)
        
        # Calculate the weight of the current classifier
        alpha[i] = 0.5 * log((1 - error_training) / error_training)
        
        # Update the distribution
        dist .*= exp.(-alpha[i] * (y_training .* h_training[:, i]))
        dist ./= sum(dist)
        
        # Update strong classifier output
        sum_cfs_training .+= alpha[i] * h_training[:, i]
        h_test[:, i] .= p_opt[i] * (X_test[:, i_opt[i]] .- theta_opt[i]) .> 0
        sum_cfs_test .+= alpha[i] * h_test[:, i]
        
        # Output labels by the strong classifier
        # H_training = fill(-1, size(X_training, 1))
        # H_test = fill(-1, size(X_test, 1))
        H_training = fill(-1, size(X_training, 1),1)
        H_test = fill(-1, size(X_test, 1),1)
        H_training[sum_cfs_training .> 0] .= 1
        H_test[sum_cfs_test .> 0] .= 1
        
        # Calculate error in training and test
        # error_training_strong[i] = sum(y_training .!= H_training) / length(y_training)
        # error_test_strong[i] = sum(y_test .!= H_test) / length(y_test)
        error_training_strong[i] = sum(y_training .!= H_training) / size(y_training,1)
        error_test_strong[i] = sum(y_test .!= H_test) / size(y_test,1)
        println("Training error of the strong classifier = $(error_training_strong[i])")
        println("Error of the strong classifier on the test set = $(error_test_strong[i])\n")
    end
    
    return error_training_strong, error_test_strong, i_opt, p_opt, theta_opt, alpha
end
