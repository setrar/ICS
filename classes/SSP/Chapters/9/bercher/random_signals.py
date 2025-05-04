import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
from plot_rea import *

M = 10
# number of bins in histograms
N = 1500 # Number of samples per realization 
K = 200 # Total number of realizations
XGauss = stats.norm(loc=0, scale=1)
#Sine wave plus noise
X = 3 * XGauss.rvs(size=(K, N)) + 3 * np.outer( np.ones((K, 1)), np.sin(2 * np.pi * np.arange(N) / N))
print("Standard deviation of time averages: ", np.std(np.mean(X, axis=1))) 
#pylab.rcParams[’figure.figsize ’] = (10.0, 8.0)
plt.rcParams['figure.figsize'] = (8, 5) 
plot_rea (X, nb=10, fig =1)
