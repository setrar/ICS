function levinson(r)
    # r: correlation sequence
    
    # Initialize parameters
    p = length(r) - 1
    σₛᵩ = zeros(p+1)
    A = zeros(p+1, p+1)
    K = zeros(p)
    
    # Initialization
    σₛᵩ[1] = r[1]
    A[1, 1] = 1
    
    for m in 1:p
        # Compute reflection coefficient
        sum_term = dot(r[m+1:-1:2], A[m, 1:m])
        K[m] = -sum_term / σₛᵩ[m]
        
        # Update prediction error variance
        σₛᵩ[m+1] = σₛᵩ[m] * (1 - K[m]^2)
        
        # Update filter coefficients
        A[m+1, 1:m+1] .= [A[m, 1:m] .+ K[m] * A[m, m:-1:1]; K[m]]
    end
    
    return σₛᵩ, A, K
end