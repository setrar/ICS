using Plots
using FFTW

include("./SimplePSD.jl")
using .SimplePSD

carrierFreq = 5.320e9
samplingRate = 20e9
gain = 30.0

xAx, psd = SimplePSD.computePSD(carrierFreq,samplingRate,gain;args="",N=1024,nbMean=32)

#plot(xAx,10*log10.(psd))
plot(xAx,10*log10.(abs2.(fftshift(fft(psd)))))

# Show the plot
display(Plots.plot!())  # This line is necessary if running the code in a script

sleep()
