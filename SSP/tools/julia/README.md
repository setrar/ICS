# :toolbox: Tools



## :package: Create a Julia Project

:round_pushpin: In the Julia REPL

- [ ] :keyboard: Press `]` keyboard key to access the package REPL

```julia
pkg> 
```

- [ ] create the new project

```julia
julia> mkdir("My Project")
```

- [ ] descend to the new project

```julia
julia> cd("My Project")
```

- [ ] Check the descent to the new project

```julia
julia> pwd()
"~/Developer/SSP/Homework/1/My Project"
```




### Verifying Package Location

```
julia> using DataFrames
```

```
julia> pathof(DataFrames)
"/Users/valiha/.julia/packages/DataFrames/JZ7x5/src/DataFrames.jl"
```

# References

