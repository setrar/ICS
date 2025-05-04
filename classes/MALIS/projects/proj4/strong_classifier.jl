function strong_classifier(X, i, p, theta, alpha)
    T = length(i)
    
    H = fill(-1, size(X, 1))
    sum_weak_classifications = zeros(size(X, 1))
    
    for j in 1:T
        weak_classification = fill(-1, size(X, 1))
        idx = p[j] * (X[:, i[j]] .- theta[j]) .> 0
        weak_classification[idx] .= 1
        sum_weak_classifications .+= alpha[j] .* weak_classification
    end
    
    H[sum_weak_classifications .> 0] .= 1
    
    return H
end