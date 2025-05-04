function choose_learner(X, y, w)
    # Getting the range for theta
    minVal = minimum(minimum(X))
    maxVal = maximum(maximum(X))
    theta = range(minVal, maxVal, length=100) # Search range for theta
    p = [-1, 1]    # Search range for p
    error_min = 1.1

    # h_opt = fill(-1, size(X, 1))  # Vector of labels assigned by the best classifier
    h_opt = fill(-1, size(X, 1), 1)   # 2 colume vector
    i_opt, p_opt, theta_opt = 0, 0, 0.0

    for i in 1:size(X, 2)
        for j in theta
            for k in p
                # Vector of labels assigned by the weak classifier
                h = fill(-1, size(X, 1))
                idx = (X[:, i] .- j) .* k .> 0  # Use k directly, which is the value from p
                h[idx] .= 1
            
                error_curr = sum(w .* (y .!= h))
            
                if error_curr < error_min
                    error_min = error_curr
                    i_opt = i
                    p_opt = k  # k is already the value from p, not an index
                    theta_opt = j
                    h_opt = h
                end
            end
        end
    end

    return i_opt, p_opt, theta_opt, error_min, h_opt
end