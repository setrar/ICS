##------------------------------------------------------------------------------
"""
    Standardise(y₀,X₀)

Demean and make std=1 for `y` and `X` (vector or matrices)

"""
function Standardise(y₀,X₀)
    y = (y₀ .- mean(y₀,dims=1))./std(y₀,dims=1)
    X = (X₀ .- mean(X₀,dims=1))./std(X₀,dims=1)
    return y,X
end
##------------------------------------------------------------------------------


##------------------------------------------------------------------------------
"""
    RidgeRegression(y,X,λ,β₀=0)

Calculate ridge regression estimate with target vector `β₀`.
"""
function RidgeRegression(y,X,λ,β₀=0)
    (T,K) = (size(X,1),size(X,2))
    isa(β₀,Number) && (β₀=fill(β₀,K))
    Cₓₓ = (X)ᵀ*X 
    Cₓᵧ = (X)ᵀ*y
    b = (Cₓₓ/T+λ*I)⁻¹*(Cₓᵧ/T+λ*β₀) #same as inv(X'X/T+λ*I)*(X'Y/T+λ*β₀) or (Cₓₓ/T+λ*I)\(Cₓᵧ/T+λ*β₀)
    return b
end
##------------------------------------------------------------------------------
