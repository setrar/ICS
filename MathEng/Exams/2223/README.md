# 2223

```sh
jupyter nbconvert MathEng2223.ipynb --to latex
```
>
```powershell
[NbConvertApp] Converting notebook MathEng2223.ipynb to latex
[NbConvertApp] Support files will be in MathEng2223_files/
[NbConvertApp] Making directory MathEng2223_files
[NbConvertApp] Writing 62666 bytes to MathEng2223.tex
```

```sh
pdflatex -output-directory=. -jobname=MathEng2223-output MathEng2223.tex
```
>
```powershell
This is pdfTeX, Version 3.141592653-2.6-1.40.26 (TeX Live 2024) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
...
```

