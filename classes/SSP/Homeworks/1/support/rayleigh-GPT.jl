using Distributions
using Plots
using Random

# Set a random seed for reproducibility
Random.seed!(42)

# Generate random samples from a Rayleigh distribution
sigma = 1.0  # Scale parameter
num_samples = 1000
rayleigh_samples = rand(Rayleigh(sigma), num_samples)

# Plot a histogram of the generated samples
histogram(rayleigh_samples, bins=30, label="Rayleigh Samples", xlabel="Value", ylabel="Frequency", title="Rayleigh Distribution")

# Overlay the probability density function (PDF) of the Rayleigh distribution
x_values = range(0, stop=3, length=1000)
pdf_values = pdf.(Rayleigh(sigma), x_values)
plot!(x_values, pdf_values * num_samples * (maximum(rayleigh_samples) - minimum(rayleigh_samples)) / 30, label="Rayleigh PDF", linewidth=2)

# Show the plot
display(Plots.plot!())  # This line is necessary if running the code in a script

