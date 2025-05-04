# HW1

Due: 23/11/2023 (HW1 to be turned in by email to xxxxx.xxxxx@eurecom.fr)

Dear SSP Students,

Please find attached the first [homework](hw.pdf) for the SSP course.

Also attached are some useful files for the homework.

These files also appear on the SSP page on `moodle.eurecom.fr` .

Note that the file with the list of host IP's is probably totally outdated, so just consider it as a suggestion. 
Please indicate in your homework report which  computer you pinged to in your experiments (preferably choose one outside Europe).

As for the machine name, you can use e.g.
`atalante.stanford.edu`

If you want to find other machines, in a cmd window, you can do

```
nslookup
```
> |> set querytype=MX
> > 
> |> stanford.edu
<pre>
Server:		10.3.2.200
Address:	10.3.2.200#53

Non-authoritative answer:
stanford.edu	mail exchanger = 10 mxb-00000d07.gslb.pphosted.com.
stanford.edu	mail exchanger = 10 mxa-00000d07.gslb.pphosted.com.

Authoritative answers can be found from:
>
</pre>

to find all mail machines in the `stanford.edu domain`.
Or `mit.edu` etc.

You may also want to use more than 100 samples to get more reliable results
(the ping time for atalante.stanford.edu seems to have some outliers or have a tail in its distribution).

The Matlab script pingstats.m should work properly on Windows and Linux 
machines.

Let us know if there is a problem.


# References

- [ ] [JuliaPlots: Recipes](https://docs.juliaplots.org/latest/recipes/)

```julia
julia> include("rayleigh-GPT.jl")
```

- [ ] [Linear mixed effect models](https://oizin.github.io/posts/linear-mixed-effects/index.html)
