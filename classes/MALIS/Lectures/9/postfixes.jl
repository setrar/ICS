# Transpose postfix operation
struct Transposer end
const ᵀ = Transposer() #typed \^T
Base.:(*)(x, ::Transposer) = transpose(x)

# Inverser postfix operation
struct Inverser end
const ⁻¹ = Inverser() #typed \^- \^1
Base.:(*)(x, ::Inverser) = inv(x)
