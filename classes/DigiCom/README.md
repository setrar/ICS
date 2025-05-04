# DigiCom

Prof: Raymond KNOPP

## [OFDM](https://en.wikipedia.org/wiki/Orthogonal_frequency-division_multiplexing)

Should be able to understand 3GPP documents

Lab Sessions are based on the 5G System

## Typical Tranceiver (ptp)


|  Message Source

     - Audio, Video
     - bits, samples 
     - labs sessions (10s of bits)

- [ ] Source Encoder

      - bits
      - minimize bandwith 
      - or the number of dimensions / Source bit/ sample
      - LASSI/LASSO

- [ ] Channel Encoder

      - bits
      - adds redundancy for noise immunity (find the right amount of redundancy)
      - linking the bits together (rope on a glacier metaphor)
      - Maximize probability of receiving the message

- [ ] Modulator 

   - generates waveform


- [ ] Channel

   - Noise: emmited by amplifiers (Quantum effect, photons and electrons)
   - Propagation Medium: convolutive (linear)
   - Antenna: Radiation Pattern bringing 
   - Amplifiers: non-linear
   - signal

```math
y(t) \to y_n(t) = k Y(t) \to k_2 y^2(t) +  k_3 y^3(t \dots
```

- [ ] Demodulator 

   - degenerates waveform
   - Front-End processing
   - linear signal processing

- [ ] Channel Decoder

   - Non-linear algorithm
   - uses Graph based algorithm (not seen at Eurecom)
      
- [ ] Source Decoder

   
 - [ ] Message Destination

## Modulators

Simple system

- [ ] [Pulse Position Modulation](https://en.wikipedia.org/wiki/Pulse-position_modulation)
   
25ns Optical System

## Slide tcom1.pdf

#### Wiener-Khinchin theorem

```math
| \int_J \theta_x(t + \tau) | < \infty 
```

```math
\begin{gather}
   \\
   {\color{Purple} \mathbf{ Sampling } } \\
    \\
   {\color{Green} \text{ Revisiting Dirac Delta } } \\
    \\
    x(t) = x(t) * \delta(t) = \sum x(\tau) \delta (t - \tau )  \mathrm{d}\tau  \\
    \\
   {\color{Green} \text{ Take } x(t) = \delta (t) } \\
    \\
    \delta(t) = \delta(t) * \delta(t)  \\
    \\
    r_{\Delta} (t) = \delta_{\Delta}(t) * \delta_{\Delta}(t)  \\
    \\
\end{gather}
```

# References

- [ ] [USRP B210 (Board Only)](https://www.ettus.com/all-products/ub210-kit/)
- [ ] [The global telecom industry seeks growth in the face of rising demands.](https://www.pwc.com/gx/en/industries/tmt/telecom-outlook-perspectives.html)
- [ ] [Myrthe Scheepers - ASMLs Julia Journey](https://www.youtube.com/watch?v=Nf70byblWEU)
- [ ] [Progressing from MATLAB to Julia](https://www.datacamp.com/blog/progressing-from-matlab-to-julia)


