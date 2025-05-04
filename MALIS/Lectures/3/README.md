# &#x1F4D1;  Lecture 3: Linear Classifiers: LDA & Logistic Regression [Oct 18]

Pre-lecture Material:

Probability refresher [slides](content/02_Probability.pdf)

Topics:

1. Polynomial features and feature transformation [slides](content/03_Polynomial.pdf)
1. Linear Classifiers [slides](content/03_Classification.pdf) 
1. Logistic Regression [slides](content/03_Logistic_regression.pdf)

Supplementary material:

1. Jupyter notebook: [02_linear_classifiers.ipynb](../../demos/02_linear_classifiers.ipynb)
1. Excel sheet: [lda_playground.xls](lda_playground.xls)

## Class Session:

<img src=images/MALIS_lecture3_solution1.png width=40% height=40% > </img>
<img src=images/MALIS_lecture3_solution2.png width=40% height=40% > </img>


## Videos

- [ ] [Lecture 3: Linear Models for Classification](https://mediaserver.eurecom.fr/videos/miris-box-54b2038de454-20211022-133628-8cba)
- [ ] [Lecture 3: Part II - Introduction to Classification](https://mediaserver.eurecom.fr/videos/lecture-3-part-ii-introduction-to-classification/)
- [ ] [Lecture 3: Part III - Bayes Rule](https://mediaserver.eurecom.fr/videos/lecture-3-part-iii-bayes-rule/)
- [ ] [Lecture 3: Part IV - Linear Discriminant Analysis](https://mediaserver.eurecom.fr/videos/lecture-3-part-iv-linear-discriminant-analysis_iksyk69c/)
- [ ] [Lecture 3: Part V - Logistic Regression](https://mediaserver.eurecom.fr/videos/lecture-3-part-v-logistic-regression/)

# References

## :cat:GPT does logistic regression use log operation?

Yes, logistic regression uses the logistic function (also known as the sigmoid function), which involves the natural logarithm. The logistic function is used to model the probability that a given input belongs to a particular class in binary classification problems.

The logistic function is defined as:

$$P(Y=1) = \frac{1}{1 + e^{-(b_0 + b_1X_1 + b_2X_2 + \ldots + b_pX_p)}}$$

Where:

```math
\begin{gather}
- P(Y=1) \text{  is the probability of the binary outcome } Y \text { being 1. } \qquad \qquad \qquad \qquad \qquad \qquad 
\\
- X_1, X_2, \ldots, X_p \text { are the input features. } \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad
\\
- b_0, b_1, b_2, \ldots, b_p \text{  are the coefficients to be learned from the training data. } \qquad \qquad \qquad 
\\
\end{gather}
```

The natural logarithm (e) is used in the exponent, which allows logistic regression to model the probability of an event occurring on a scale from 0 to 1. The logistic function transforms the linear combination of input features and coefficients into a probability value. This probability is then used to make binary classification decisions.

So, while logistic regression doesn't use a log operation in the sense of taking the logarithm of the input features, it does involve the natural logarithm in the logistic function that maps the linear combination of inputs to a probability between 0 and 1.

# References

- [ ] [What is a confusion matrix?](https://medium.com/analytics-vidhya/what-is-a-confusion-matrix-d1c0f8feda5)
