# SSP

[Slock Dirk](https://www.eurecom.fr/en/people/slock-dirk)

## ABSTRACT

The proper treatment of modern communication systems requires the modelling of signals as random processes. Often the signal description will involve several parameters such as carrier frequency, timing, channel impulse response, noise variance, and interference spectrum. The values of these parameters are unknown and need to be estimated for the receiver to be able to proceed.

Parameters may also occur in the description of other random analysis of communication networks, or in the descriptions of sounds and images, or other data, e.g. geolocation. This course introduces the basic techniques for estimation of a finite set of parameters, of a signal spectrum or of one complete signal based on a correlated signal (optimal filtering, Wiener and Kalman filtering). The techniques introduced in this course have a proven track record of many decades. They are complementary to the techniques introduced in the EURECOM course “Applied statistics” (AppStat). They are useful for other application branches such as machine learning, in the EURECOM courses “Machine Learning and Intelligent System” (MALIS) and “Advanced Statistical Inference” (ASI).

`Teaching and Learning Methods`: Lectures, homework, exercise, and Lab session (groups of 1-2 students depending on the size of the class).

`Course Policies`: Attendance of the lab. sessions are mandatory (15% of the final grade).

| BIBLIOGRAPHY |
|:-| 
| Book: VAN TREES H.L. Detection, Estimation and Modulation Theory, volume 1. Wiley, New York, 1968, 1176p.                    |
| Book: SCHARF L. Statistical Signal Processing. Addison-Wesley, Reading, MA, 1991, 544p.                                      |
| Book: KAY S.M. Fundamentals of Statistical Signal Processing: Estimation Theory. Prenctice Hall, 1993, 608p.                 |
| Book: PORAT B. Digital Processing of Random Signals: Theory and Methods. Prentice Hall, 1994, 462p.                          |
| Book: THERRIEN C.W. Discrete Random Signals and Statistical Signal Processing. Prentice Hall, 1992, 576p.                    |
| Book: HAYES M.H. Statistical Digital Signal Processing and Modeling Wiley. WILEY, 1996, 628p. (PDF available on the internet)|
| Book: KAY S. Modern Spectral Estimation: Theory and Application. Prentice Hall, 1988.                                        |
| Book: STOICA P., MOSES R. Spectral Analysis of Signals. Prentice hall, 2005. http://user.it.uu.se/ps/SAS-new.pdf             |
| Book: KAILATH T. Lectures on Wiener and Kalman Filtering. Springer-Verlag, Wien – New York, 1981, 191p.                      |
| Book: KAILATH T., SAYED A.H., HASSIBI B. Linear Estimation. Prentice Hall, 2000, 880p.                                       |
| Book: SAYED A.H. Adaptive Filters. Wiley-IEEE Press, 2008, 1168p.                                                            |

The transparencies used are available. A non-finalized handout is also available.

## REQUIREMENTS

  - Basics in probability and random variables/processes, basics in (digital) signal processing (linear systems, Fourier Transform, z transform), 
  - basics in linear algebra (vectors, matrices, solving linear equations). Notions from Optimization. 
  
  The useful prerequisite course at EURECOM: “Essential Mathematical Methods for Engineers” (MathEng).

## DESCRIPTION

`Parameter estimation`: Random parameters, Bayesian estimation: minimum mean squared error estimation, orthogonality principle, maximum a posteriori estimation, performance bounds, linear estimation, the linear model. 

`Deterministic unknown parameters`: minimum variance estimation, bias, efficiency, consistency, Cramer-Rao lower bound, maximum likelihood estimation, EM algorithm, least-squares and BLUE methods, method of moments, and the linear model.

`Spectrum estimation`: Non-parametric techniques: periodogram, windowing, spectral leakage and resolution. Parametric techniques: autoregressive processes, linear prediction, maximum entropy, Levinson and Schur algorithms, lattice filters. Time and frequency domain localization, short-time Fourier transform, wavelet transform, QMF, subbands, perfect reconstruction filter banks.

`Optimal filtering`: Wiener filtering, non-causal, causal and FIR, application to channel equalization. Kalman filtering: time-varying and time-invariant state-space models. Application to channel tracking.

`Adaptive Filtering`: Some elements from optimization theory, steepest-descent algorithm. The LMS (least mean Square) and RLS (Recursive Least-Squares) algorithms, performance analysis. Tracking time-varying parameters, and applications.

`Sinusoids in Noise`: Maximum likelihood estimation, Cramer-Rao bounds, IQML algorithm and variations, subspace techniques, moment matching, MVDR filtering, Prony and Pisarenko techniques, Capon method, adaptive notch filtering.

## Learning Outcomes:

- Bayesian and deterministic parameter estimation methods;
- Non-parametric spectrum estimation, linear prediction and auto-regressive modeling;
- Wiener filtering;
- Adaptive filtering (in particular the LMS algorithm, the main stochastic gradient technique).

Nb hours: 42.00

## Evaluation: 

- Homework (15% of the final grade),
- Lab reports (15% of the final grade),
- Final written exam (70% of the final grade) - 2 hours - all authorized documents

# References

- [ ] [Overview of Adaptive Filters and Applications](https://www.mathworks.com/help/dsp/ug/overview-of-adaptive-filters-and-applications.html)
- [ ] [:tv: Transformer Network-based Optimal Decoupling Capacitor Design Method using Reinforcement Learning](https://www.youtube.com/playlist?list=PLv7izQ1itK4XHQ_SF0NIgMi0VTE6Ph6yp) by [AI Engineering Research in TERA LAB](https://www.youtube.com/@terakaist2011)
- [ ] [Essential topics of Signal Processing and their codes in python language in Jupyter Notebook.](https://github.com/alirezap94/Signal_Processing_Course)
- [ ] [A Journey in Signal Processing with Jupyter](https://perso.esiee.fr/~bercherj/Lectures_SignalProcessing/)
- [ ] [Essential topics of Signal Processing and their codes in python language in Jupyter Notebook.](https://github.com/alirezap94/Signal_Processing_Course)

Books to ask for
- [ ] [Statistics with Julia](https://www.amazon.com/Statistics-Julia-Fundamentals-Artificial-Intelligence/dp/3030709000)
- [ ] [Interactive Visualization and Plotting with Julia: Create impressive data visualizations through Julia packages such as Plots, Makie, Gadfly, and more](https://www.amazon.com/Interactive-Visualization-Plotting-Julia-visualizations/dp/1801810516)
- [ ] [Algorithms for Optimization (Mit Press) Illustrated Edition](https://www.amazon.com/Algorithms-Optimization-Press-Mykel-Kochenderfer/dp/0262039427)
- [ ] [Signal processing problems, solved in MATLAB and in Python](https://www.udemy.com/course/signal-processing/)
