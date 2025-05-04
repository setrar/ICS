####################################################
# Add convenient Math functions and function aliases
####################################################

# Transpose postfix operation
struct Transposer end
const ᵀ = Transposer() #typed \^T
Base.:(*)(x, ::Transposer) = transpose(x)

# Inverser postfix operation
struct Inverser end
const ⁻¹ = Inverser() #typed \^- \^1
Base.:(*)(x, ::Inverser) = inv(x)

# Conjugater postfix operation
struct Conjugater end
const ˣ = Conjugater() #typed \^x
Base.:(*)(x, ::Conjugater) = conj.(x)

# Hermitian postfix operation
struct Hermitianer end
const ᴴ = Hermitianer() #typed \^H
Base.:(*)(x, ::Hermitianer) = conj(transpose(x))

# Convolution infix function
function ⊗(a, b) 
    return conv(a,b)
end

# Contatenation infix function
# https://math.stackexchange.com/questions/298648/is-there-a-common-symbol-for-concatenating-two-finite-sequences
# typed \doubleplus
function ⧺(a, b) 
    return vcat(a,b)
end

⦰ = reverse # https://en.wikipedia.org/wiki/APL_syntax_and_symbols#Monadic_functions
∑ = sum # Sum alias
Fᴵ = ifft # Inverse Fourier Transform
argmax = findmax # Alias used for MLE search 