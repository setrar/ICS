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
const ꜛ = Hermitianer() #typed \^uparrow
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
𝓕 = fft # Fourier Transform types \bscrF
𝓕⁻¹ = ifft # Inverse Fourier Transform types \bscrF\^-\^1
argmax = findmax # Alias used for MLE search 

ℜ = real # Real Part Function to extract real number from Complex Number \frakR
ℑ = imag # Imaginary Part Function to extract imaginary part from Complex Number \frakI

j = √Complex(-1)

|  = abs
|₂ = norm