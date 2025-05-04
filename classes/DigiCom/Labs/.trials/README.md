# Signal Analysis

# References

- [ ] [Basic Spectral Analysis](https://www.mathworks.com/help/matlab/math/basic-spectral-analysis.html)


```
IPython -m pip install webio_jupyter_extension
```
> Returns
```powershell
Collecting webio_jupyter_extension
  Downloading webio_jupyter_extension-0.1.0-py3-none-any.whl (219 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 219.9/219.9 kB 3.6 MB/s eta 0:00:00
Installing collected packages: webio_jupyter_extension
Successfully installed webio_jupyter_extension-0.1.0
```

julia> using Conda

julia> Conda.pip_interop(true)
[ Info: Running `conda config --set pip_interop_enabled true --file /Users/valiha/.julia/conda/3/aarch64/condarc-julia.yml` in root environment

julia> Conda.pip("install", "webio_jupyter_extension")
[ Info: Running `pip install webio_jupyter_extension` in root environment
Requirement already satisfied: webio_jupyter_extension in /Users/valiha/.julia/conda/3/aarch64/lib/python3.10/site-packages (0.1.0)

jupyter labextension list
JupyterLab v4.0.7

Build recommended, please run `jupyter lab build`:
    No built application
valiha@ankarana DSPIllustrations.com % jupyter lab build        
[LabBuildApp] JupyterLab 4.0.7
[LabBuildApp] Building in /opt/homebrew/Cellar/python@3.10/3.10.13/Frameworks/Python.framework/Versions/3.10/share/jupyter/lab
[LabBuildApp] Building jupyterlab assets (production, minimized)
valiha@ankarana DSPIllustrations.com % jupyter labextension list
JupyterLab v4.0.7

python3 -m pip install --upgrade webio_jupyter_extension
Defaulting to user installation because normal site-packages is not writeable
Collecting webio_jupyter_extension
  Using cached webio_jupyter_extension-0.1.0-py3-none-any.whl (219 kB)
DEPRECATION: pybombs 2.3.5.MacPorts has a non-standard version number. pip 23.3 will enforce this behaviour change. A possible replacement is to upgrade to a newer version of pybombs or contact the author to suggest that they release a version with a conforming version number. Discussion can be found at https://github.com/pypa/pip/issues/12063
Installing collected packages: webio_jupyter_extension
Successfully installed webio_jupyter_extension-0.1.0



https://juliagizmos.github.io/WebIO.jl/latest/providers/ijulia/
