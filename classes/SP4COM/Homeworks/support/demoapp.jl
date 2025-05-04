using AdaptiveFilters, Plots, Interact, Statistics
# inspectdr() # Preferred plotting backend for waveforms

y = [sin.(1:100); sin.(0.2 .*(1:100))] # A sinusoid with changing frequency
yn = y .+ 0.1*randn(length(y)) # A sinusoid with noise


function app(req=nothing)
    @manipulate for order = 2:2:10,
                    lr = LinRange(0.01, 0.99, 100),
                    alg = [ExponentialWeight, MSPI, OMAP, OMAS, ADAM]
        yh = adaptive_filter(yn, alg, order=order, lr=lr)
        e = yn.-yh
        plot([yn yh], lab=["Measured signal" "Prediction"], layout=(2,1), show=false, sp=1)
        plot!(e, lab="Error", sp=2, title="RMS: $(√mean(abs2, e))")
    end
end

app()

# Save filtered sound to disk
using WAV
yh = adaptive_filter(yn, OMAP, order=4, lr=0.25)
e = yn.-yh
wavwrite(e, "filtered.wav", Fs=fs)
