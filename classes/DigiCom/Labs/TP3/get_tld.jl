function get_tdl(fs, SCS, PRBS, DS, chan)
    # Check the type of channel
    if chan == "tdlc"
        coef_start = 1
        # TDL-C channel coefficients
        tdl = [1.0 0.0 -4.4;
               2.0 0.2099 -1.2;
               3.0 0.2219 -3.5;
               4.0 0.2329 -5.2;
               5.0 0.2176 -2.5;
               6.0 0.6366 0.0;
               7.0 0.6448 -2.2;
               8.0 0.6560 -3.9;
               9.0 0.6584 -7.4;
               10.0 0.7935 -7.1;
               11.0 0.8213 -10.7;
               12.0 0.9336 -11.1;
               13.0 1.2285 -5.1;
               14.0 1.3083 -6.8;
               15.0 2.1704 -8.7;
               16.0 2.7105 -13.2;
               17.0 4.2589 -13.9;
               18.0 4.6003 -13.9;
               19.0 5.4902 -15.8;
               20.0 5.6077 -17.1;
               21.0 6.3065 -16.0;
               22.0 6.6374 -15.7;
               23.0 7.0427 -21.6;
               24.0 8.6523 -22.8]
    elseif chan == "tdld"
        coef_start = 2
        # TDL-D channel coefficients
        tdl = [1.0 0.0 -0.00147;
               2.0 0.035 -18.8;
               3.0 0.612 -21.0;
               4.0 1.363 -22.8;
               5.0 1.405 -17.9;
               6.0 1.804 -20.1;
               7.0 2.596 -21.9;
               8.0 1.775 -22.9;
               9.0 4.042 -27.8;
               10.0 7.937 -23.6;
               11.0 9.424 -24.8;
               12.0 9.708 -30.0;
               13.0 12.525 -27.7]
    else
        error("unknown channel $chan")
    end

    # Compute the normalization factor for channel coefficients
    tdl_norm = sum(10 .^(0.1 * tdl[coef_start:end, 3]))

    # Generate frequency grid for the channel
    PRB = 1:12
    fgrid = []
    for PRBs in PRBS
       # fgrid = [fgrid SCS * ((PRBs * 12) .+ PRB)]
        append!(fgrid, SCS * ((PRBs * 12) .+ PRB))
    end

    # compute channel impulse response
    Htdl = [
       vec(exp.(-im * 2 * π * f * tdl[coef_start:end, 2] * DS) .* sqrt.(10 .^(0.1 * tdl[coef_start:end, 3])))
        for f in fgrid
    ]

    # Generate random complex gains for each channel tap
    # gv = vec(sqrt(0.5) * randn(1, length(tdl[coef_start:end, 2])) + im * sqrt(0.5) * randn(1, length(tdl[coef_start:end, 2])))

    # Combine channel response and gains
    # H = Htdl * gv / sqrt.(tdl_norm)

    # Add mean for Ricean channel
    # if coef_start == 2
        # H += transpose(exp.(-im * 2 * π * f * tdl[1, 2] * DS) .* sqrt.(10 .^ (0.1 * tdl[1, 3]))) / sqrt(tdl_norm)
    # end

    # return H
    return Htdl
end

# Example usage
fs = 61.44e6
SCS = 30e3
PRBS = 0:105
DS = 300e-9
chan = "tdlc"

H = get_tdl(fs, SCS, PRBS, DS, chan)

# Display the resulting channel matrix
# println("Channel Matrix (H):")
# println(H)

