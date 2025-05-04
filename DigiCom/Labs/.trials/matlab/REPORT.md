

## 1.1 PSS signals

### 1.1.1 Questions

1. Using the supplied MATLAB file (pss.m) plot the real, imaginary components and magnitude of the one of the PSS signals. What do you see?

2. Plot the power spectrum of the PSS signal on a dB-scale (using the MATLAB FFT). Estimate the bandwidth as closely as possible (in terms of physical frequencies). What do you observe about the PSS signal?

3. Plot the three auto-correlation functions and the three cross-correlation functions. To what extent can we say that these three signals are orthogonal? When using one PSS as a basis function, what is the ratio of signal energy to interference in dB if we assume that these are orthogonal?

## 1.2 Channel Model

### 1.2.1 Questions

1. You have been provided several signal snapshots with different channel realizations as MATLAB signals

2. Plot the time and frequency representations of the signals on a dB scale. What do you see?

3. Estimate the bandwidth of the received signal? What are the signal components that are located outside the band of interest?

4. In your opinion what contributes to the ”changing shape” of the main signal component?


## 1.3 Receiver

### 1.3.1 Questions

1. How is the above statistic related to the maximum-likelihood detector we considered in class? What is the reason for the difference? Think about the simpler receiver where L = 1, Nf = 0 and ∆f = 0.

2. What is the effect of the channel in all of this? How is it taken into account and what is neglected here?

3. Show how you can use the convolution operator with the matched filter to implement the above maximization in a compact form (think of the basic receiver structures we explored in class). Plot the output of the three matched filters for m = 0 (i.e. no frequency offset). Which PSS is most likely and try to determine Nf .

4. For the most likely PSS index i and Nf with m = 0, plot the peak value of the statistic in 100 Hz steps and a ±7.5kHz window around the carrier frequency (i.e. ∆fmax/∆fmin = 75). What is the most likely frequency-offset? Based on the shape of the statistic can you think of a efficient way to implement the frequency-offset estimator to obtain even finer resolution and to minimize the number of correlations that are required? (hint: think of a binary search applied to this)

## 2 MATLAB Files

The supplied MATLAB/OCTAVE files are

1. pss.m - generates the three PSS signals for fs bandwidth

2. TP1 top.m - skeleton of your exercise that should be completed
