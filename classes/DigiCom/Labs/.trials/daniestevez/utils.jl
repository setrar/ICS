j = √Complex(-1)
tolerance = 0.0002

function approximately_equal(v1::Vector{ComplexF64}, v2::Vector{ComplexF64}, tol::Float64)
    length(v1) == length(v2) || return false
    for (a, b) in zip(v1, v2)
        if abs(a - b) > tol
            return false
        end
    end
    return true
end