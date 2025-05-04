function window(type, L)
    w = ones(L, 1)

    if type == "bartlett"
        w = 2 * (0:(L-1)/2) / (L-1)
        if isodd(L)
            w = vcat(w, reverse(w[1:end-1]))
        else
            w = vcat(w, reverse(w))
        end
    elseif type == "blackman"
        w = 0.42 .- 0.5 * cos.(2π * (0:L-1) / (L-1)) + 0.08 * cos.(4π * (0:L-1) / (L-1))
    elseif type == "boxcar"
        w .= ones(L)
    elseif type == "hamming"
        w .= 0.54 .- 0.46 * cos.(2π * (0:L-1) / (L-1))
    elseif type == "hanning"
        w .= 0.5 * (1 .- cos.(2π * (1:L) / (L+1)))
    elseif type == "triang"
        if isodd(L)
            w = 2 * (1:(L+1)/2) / (L+1)
            w = vcat(w, reverse(w[1:end-1]))
        else
            w = (2 * (1:(L+1)/2) .- 1) / L
            w = vcat(w, reverse(w))
        end
    end

    return w
end
