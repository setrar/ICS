using Plots
using FFTW

include("./SimplePSD.jl")
using .SimplePSD

carrierFreq = 2.58495e9
samplingRate = 30.72e6
gain = 30.0
N = 614400

carrierFreq = 5.320e9
samplingRate = 20e9
gain = 30.0

xAx, psd = SimplePSD.computePSD(carrierFreq,samplingRate,gain;args="",N,nbMean=32)

#plot(xAx,10*log10.(psd))
plot(xAx,10*log10.(abs2.(fftshift(fft(psd)))))
