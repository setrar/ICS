# Gaussian




# References

- [ ] [Gaussian process](https://en.wikipedia.org/wiki/Gaussian_process)
- [ ] [Gaussian Processes for Machine Learning in Julia](https://github.com/JuliaGaussianProcesses)
- [ ] [Gaussian Processes enable flexible models: But you need to smell the Math ](https://www.youtube.com/watch?v=UBDgSHPxVME&t=722s)
- [ ] [AugmentedGaussianProcesses.`AffineMean` — Type](https://theogf.dev/AugmentedGaussianProcesses.jl/dev/api/#AugmentedGaussianProcesses.AffineMean)

- [ ] one needs to be careful when deciding what type of probability distribution a random variable follows.

<img src=images/distributional_choices.png width=60% height=60% > </img>

- [ ] [NUTS speed is very slow for high dimension parameter inference in Turing.jl](https://discourse.julialang.org/t/nuts-speed-is-very-slow-for-high-dimension-parameter-inference-in-turing-jl/80349)

```julia
testx = rand(1000,10000) 
trueE = rand(10000)
testy = testx*trueE
@model toy(x,y) = begin
    sig ~ InverseGamma(1,1)
    M ~ MvNormal(10000,sig)
    y ~ MvNormal(x*M,sig)
end
model = toy(testx,testy)
@time chain = sample(model, NUTS(0.65), 1000);
```
