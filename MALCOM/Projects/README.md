# Projects



# References

 - [ ] [The goal of the fork is to try METAL experiment through Jupyter Notebooks](https://github.com/setrar/JuliaExperiments/blob/main/REPORT.md)
 - [ ] [Ep 30. The Sionna Library for Link-Level Simulations (With Jakob Hoydis) [Wireless Future Podcast]](https://www.youtube.com/watch?v=NcQL9vY3ENA)
 - [ ] [Jakob Hoydis - Recent Progress in End-to-End Learning for the Physical Layer](https://www.youtube.com/watch?v=EPLJzsxReH4)

<img src=images/Jacob-Hoydis-presentation.png width='75%' height='75%' > </img>



The goal is to minimize the probability of making an error =>  Goal: Minimise $Pr( \hat{S} \neq S)$

$$
\begin{gather}
\bullet \quad s \in \mathcal{M} = \\{ 1, ..., M \\}, k = log_2 M \\
\bullet \quad x \in \mathbb{C}^n \quad with \quad E[||x||^2] \leq n \qquad  \\
\bullet \quad y \in \mathbb{C}^n \quad \sim p(y|x) \qquad \qquad \qquad  \\
\bullet \quad \hat{s}  \in \mathcal{M} \qquad \qquad \qquad \qquad \qquad \quad \\
\bullet \quad R = \frac{k}{n} \text{ bits/channel use} \quad Rate
\end{gather}
$$


$x \in \mathbb{C}^n \quad with \quad E[||x||^2] \leq n$

This expression describes a mathematical condition involving a vector $x$ in the field of complex numbers:

- $x \in \mathbb{C}^n$: This denotes that $x$ is a vector with $n$ components, each of which is a complex number. The $\mathbb{C}^n$ represents an $n$-dimensional complex vector space.

- $E[||x||^2] \leq n$: Here, $E$ is the expected value operator (mean), and $||x||^2$ represents the squared Euclidean norm (or squared magnitude) of the vector $x$. The condition states that the expected value of the squared norm of $x$ is less than or equal to $n$. 

This kind of condition might arise in signal processing or communications, where $x$ could represent a signal vector, and the condition imposes a constraint on the average power of the signal (since the squared norm is a measure of power in this context). The constraint essentially says that the average power of the vector $x$ is limited to $n$, which could be interpreted as the signal vector having an average power of at most 1 per dimension, assuming $n$ is the number of dimensions.

--- 

$$
maximise \quad I(s;y) = H(s) - h(s|y)
$$

The expression you're referring to, $I(s; y) = H(s) - h(s|y)$, represents the **mutual information** between two random variables, $s$ and $y$. Mutual information is a fundamental concept in information theory, used to quantify the amount of information obtained about one random variable through observing another random variable.

Here's a breakdown of the terms:

1. **$H(s)$**: This is the **entropy** of the random variable $s$. Entropy is a measure of the uncertainty or the average amount of "surprise" inherent in the variable's possible outcomes.

2. **$h(s|y)$**: This is the **conditional entropy** of $s$ given $y$. It measures the amount of uncertainty remaining about $s$ after $y$ is known.

3. **$I(s; y)$**: The mutual information, calculated as $H(s) - h(s|y)$, measures the reduction in uncertainty about $s$ due to the knowledge of $y$. It quantifies how much knowing one of these variables reduces the uncertainty in the other. Mutual information is symmetric, which means $I(s; y) = I(y; s)$.

### Application: Maximizing Mutual Information

When you are given the task to "maximise $I(s; y)$", it typically involves optimizing some aspect of the system or model to increase the mutual information between $s$ and $y$. This maximization is a common goal in various fields, including:

- **Signal Processing**: Enhancing the capacity of a communication channel by maximizing the mutual information between the transmitted signals and received signals.
- **Machine Learning**: Feature selection or in scenarios like training a model to maximize the mutual information between inputs and corresponding labels, which can help in learning more relevant features.
- **Neural Coding**: In neuroscience, studying how well certain responses (like neural spiking) can predict stimuli, by maximizing mutual information between the stimulus and the neural response.

### Techniques for Maximization
The methods to maximize mutual information depend largely on the context and specific properties of $s$ and $y$. Some general approaches might include:
- Adjusting the parameters of a system or model to increase dependency or correlation between $s$ and $y$.
- Transforming or processing the variables to enhance the informative content shared between them.
- Employing algorithms specifically designed for mutual information maximization, like those found in machine learning for feature extraction or complex system optimization.

In practical terms, to apply these concepts, one would often rely on statistical or computational methods to estimate and maximize mutual information from empirical data or simulated models.

# References

- [ ] Concatenate PDF Files

```
"/System/Library/Automator/Combine PDF Pages.action/Contents/MacOS/join" -o ~/Desktop/REPORT.pdf ~/Desktop/REPORT0.pdf ~/Desktop/REPORT1.pdf ~/Desktop/REPORT2.pdf
```
