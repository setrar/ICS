function c_seq(init::Int, lengthy::Int)
    crop = 1600
    x1 = zeros(UInt8, crop + lengthy)
    x2 = zeros(UInt8, crop + lengthy)
    x1[1] = 1  # Julia arrays are 1-indexed

    for j in 0:30
        x2[j + 1] = (init >> j) & 0x01
    end

    for j in 1:(length(x1) - 31)
        x1[j + 31] = x1[j + 3] ⊻ x1[j]
        x2[j + 31] = x2[j + 3] ⊻ x2[j + 2] ⊻ x2[j + 1] ⊻ x2[j]
    end

    return x1[crop + 1:end] .⊻ x2[crop + 1:end]  # Apply XOR to the sliced arrays
end