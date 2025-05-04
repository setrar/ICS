# Examples

julia --project="." agwn_example.jl

# References

- [ ] [Make Julia VSCode use Manifest.toml and Project.toml files from the folder of script being run](https://discourse.julialang.org/t/make-julia-vscode-use-manifest-toml-and-project-toml-files-from-the-folder-of-script-being-run/82046)

```julia
using  Pkg
cd(Base.source_dir())        # Changes into the directory , where your "my_julia.jl" is.
Pkg.activate(".")                  # active the project, with a  static environment
# Pkg.activate(; temp=true)    #  activate the project with a temporary environment
Pkg.update()                       # update the ..tom-files

# [here starts your code]
```
