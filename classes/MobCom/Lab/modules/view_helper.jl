function add_combined_hlines!(offsets::Vector{Float64}, base_values::Vector{Float64}; 
                              label::String="", linestyle=:dash, lw=1, color=:gray, alpha=0.3)
    # Combine all horizontal line y-values based on base values and offsets
    combined_hlines = vcat([base_values .+ offset for offset in offsets]...)  # Combine adjusted base values
    # Plot all combined horizontal lines
    hline!(combined_hlines, label=label, linestyle=linestyle, lw=lw, color=color, alpha=alpha)
end

# Define base values and offsets
base_values = [-0.00, -1.00, -2.00, -3.00, -4.00, -5.00]
offsets = [0.0, -0.05, -0.10, -0.15, -0.20, -0.30, -0.40, -0.70]

# Plot with function
plot(
    xlabel="P [dB]", ylabel="log₁₀(Pₑ)"
    , title = "Horizontal Lines with Combined Function"
    , grid = true
)  # Initialize a plot
add_combined_hlines!(offsets, base_values, linestyle=:dash, lw=1, color=:gray, alpha=0.3)

