# Using Julia


## :o: Install Julia

- [ ] On mac :apple:

- use [juliaup](https://github.com/JuliaLang/juliaup) convenient script

```
curl -fsSL https://install.julialang.org | sh
```

- On mac, install `Julia` using `homebrew` package manager :x: Not recommanded

```
brew install julia
```

## Jupyter Lab Kernel Specs

```
jupyter kernelspec list
```
> returns :
<pre>
Available kernels:
  python3      /opt/homebrew/lib/python3.10/site-packages/ipykernel/resources
  julia-1.9    /Users/valiha/Library/Jupyter/kernels/julia-1.9
</pre>

If you need to change the Jupyter Kernel Spec

```
grep juliaup  ~/Library/Jupyter/kernels/julia-1.9/kernel.json
```
>    "/Users/valiha/.juliaup/bin/julia",


## Installing [AWS CodeWhisper](https://docs.aws.amazon.com/codewhisperer/latest/userguide/jupyterlab-setup.html) using Jupyter Lab (only works with Python)

```
which IPython
```
> /opt/homebrew/bin/IPython

```
/opt/homebrew/bin/pip --version
```
> pip 23.3.1 from /opt/homebrew/lib/python3.10/site-packages/pip (python 3.10)

```
/opt/homebrew/bin/pip install amazon-codewhisperer-jupyterlab-ext 
```
> Returns:
<pre>
Collecting amazon-codewhisperer-jupyterlab-ext
  Downloading amazon-codewhisperer-jupyterlab-ext-2.0.0.tar.gz (115 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 115.7/115.7 kB 2.6 MB/s eta 0:00:00
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
  Preparing metadata (pyproject.toml) ... done
Collecting boto3 (from amazon-codewhisperer-jupyterlab-ext)
  Downloading boto3-1.28.84-py3-none-any.whl.metadata (6.7 kB)
Collecting botocore (from amazon-codewhisperer-jupyterlab-ext)
  Downloading botocore-1.31.84-py3-none-any.whl.metadata (6.1 kB)
...
Building wheels for collected packages: amazon-codewhisperer-jupyterlab-ext
  Building wheel for amazon-codewhisperer-jupyterlab-ext (pyproject.toml) ... done
  Created wheel for amazon-codewhisperer-jupyterlab-ext: filename=amazon_codewhisperer_jupyterlab_ext-2.0.0-py3-none-any.whl size=103038 sha256=2665d4d8c2ef779cddfe04a740a2fd735bf19cb44a5b0254733397a8940e4cd5
  Stored in directory: /Users/valiha/Library/Caches/pip/wheels/2c/fb/9e/ad8a03f92debc777a9b198b70433e206508540e37d8fe98549
Successfully built amazon-codewhisperer-jupyterlab-ext
Installing collected packages: jmespath, botocore, s3transfer, boto3, amazon-codewhisperer-jupyterlab-ext
Successfully installed amazon-codewhisperer-jupyterlab-ext-2.0.0 boto3-1.28.84 botocore-1.31.84 jmespath-1.0.1 s3transfer-0.7.0
</pre>

# References

- [ ] [Writing an exam paper with Julia and Jupyter Lab](https://discourse.julialang.org/t/writing-an-exam-paper-with-julia-and-jupyter-lab/78082)
- [ ] [Installing and setting up Julia](https://faun.pub/installation-and-setting-up-julia-c4a94a85738c)


- Enter `Julia`'s CLI, by typing `julia` at the command line

<img src=images/julia_package_install.png width='50%' height='50%' > </img>

- Install `julia's kernel` packages by pressing `]` key and `add IJulia` at the prompt

<img src=images/julia_kernel.png width='50%' height='50%' > </img>

- Add more `Julia` packages with the `add` command 

```julia
] add SymPy
```

- [ ] [Newbie: Gradient of a gradient performance in Zygote](https://discourse.julialang.org/t/newbie-gradient-of-a-gradient-performance-in-zygote/57593)

- [ ] Install [Pluto](https://plutojl.org/)

* Start Julia REPL

```julia
import Pluto
 │ Package Pluto not found, but a package named Pluto is available from a registry. 
 │ Install package?
 │   (@v1.9) pkg> add Pluto 
 └ (y/n/o) [y]: y
    Updating registry at `~/.julia/registries/General.toml`
   Resolving package versions...
   Installed PrecompileSignatures ─ v3.0.3
   Installed Malt ───────────────── v1.1.0
   Installed FuzzyCompletions ───── v0.5.3
   Installed MsgPack ────────────── v1.2.0
   Installed HypertextLiteral ───── v0.9.5
   Installed MIMEs ──────────────── v0.1.4
   Installed Configurations ─────── v0.17.6
   Installed ExproniconLite ─────── v0.10.4
   Installed Pluto ──────────────── v0.19.32
    Updating `~/.julia/environments/v1.9/Project.toml`
  [c3e4b0f8] + Pluto v0.19.32
    Updating `~/.julia/environments/v1.9/Manifest.toml`
  [5218b696] + Configurations v0.17.6
  [55351af7] + ExproniconLite v0.10.4
  [fb4132e2] + FuzzyCompletions v0.5.3
  [ac1192a8] + HypertextLiteral v0.9.5
  [6c6e2e6c] + MIMEs v0.1.4
  [36869731] + Malt v1.1.0
  [99f44e22] + MsgPack v1.2.0
  [c3e4b0f8] + Pluto v0.19.32
  [91cefc8d] + PrecompileSignatures v3.0.3
Precompiling project...
  9 dependencies successfully precompiled in 31 seconds. 482 already precompiled.
┌ Info: 
│   Welcome to Pluto v0.19.32 🎈
│   Start a notebook server using:
│ 
│ julia> Pluto.run()
│ 
│   Have a look at the FAQ:
│   https://github.com/fonsp/Pluto.jl/wiki
└ 
```
