struct LeastMeanSquare
    x    #   x     - Input array x[n]
    d    #   d     - Desired array d[n], length must be same as x
    Δ    #   Δ     - Step size
    N    #   N     - Length of the FIR filter    
end

function solve(LMS::LeastMeanSquare)
    # LMS Algorithm for Coefficient Adjustment
    # ----------------------------------------
    # Inputs:
    #   LMS   - Input Structure LMS
    # Outputs:
    #   h     - Estimated FIR filter coefficients
    #   y     - Output array y[n]

    x, d, Δ, N = LMS.x, LMS.d, LMS.Δ, LMS.N
    
    M = length(x)
    y = zeros(Float64, M)
    h = zeros(Float64, N)
    
    for n in N:M
        x₁ = reverse(x[n-N+1:n])
        # x₁ = x[n:-1:n-N+1]        # Reverse the slice to mimic MATLAB's order
        y[n] = (h)ᵀ * x₁  # Calculate the output using dot product
        ϵ = d[n] - y[n]           # Error calculation
        h += Δ * ϵ * x₁           # Update the filter coefficients
    end
    
    return h, y
end