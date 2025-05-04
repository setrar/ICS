# TP1



## Channel


```matlab
cd '~/Developer/DigiCom/Labs/tp1/MATLAB'
load('rxsignal_withchannelandfreqoff.mat')
run('pss')
m2_chan = 10*log10(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan)
plot(m2_chan); axis ([1 10000 10 60])
```

For the most likely PSS index i and Nf with m = 0, plot the peak value of the statistic in 100 Hz steps and a ±7.5kHz window around the carrier frequency (i.e. ∆fmax/∆fmin = 75). 

What is the most likely frequency-offset? 

Based on the shape of the statistic can you think of a efficient way to implement the frequency-offset estimator to obtain even finer resolution and to minimize the number of correlations that are required? (hint: think of a binary search applied to this)


## CFO Estimate

```matlab
% Grab the function Profs Frequency Offset with his values
> freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
Detected_offset: 150 Hz
ans = 766
```


<img src=images/CFO_estimate.png width='50%' height='50%' > </img>

# References 

- [ ] [Sharetechnote PSS](https://www.sharetechnote.com/html/Handbook_LTE_PSS.html)
