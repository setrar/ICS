# Lecture 1


## Training Data

```math
\begin{gather}
   \\
\text { D and y ∈ C }.
 \\
\text { The entire training set is denoted as: }
    \\
   \text{ The training data comes in input pairs }  ( {\color{Orange} x }, {\color{Orange} y } ) \\
    \\
    D = {(xi, yi)}
    \\
N i=1 ⊆ R
    \\
D × C
with
• R
D - D-dimensional feature space
    \\
• C - label space
    \\
• xi - input vector of the ith training sample
    \\
• yi - label of the ith training sample
    \\
• N - number of training samples
    \\
    \\
Question: In the previous slide, what is x? and y?

\end{gather}
```

```math
\begin{gather}
| \text{ Symbol} | \text{ Reads as } | \\
|-|-| \\
| X | \text{Input variable} ( \mathscr{R}^D ) | \\
xi
X = (x1,x2,...,xN)T xj
Y
yi
y = (y1,...,yN)T

ith feature vector. Observed value of X. Matrix of N input D−dimensional vectors xi jth element of the ith input vector xi, i.e. xji Output variable (C)
ith output label
Observed vector of outputs yi

\end{gather}
```

## Generalization

```math
   h({\color{Orange} x}) =
  \begin{cases}
    {\color{Orange} y}_i       & \quad \text{if } \exists ({\color{Orange} x}_i, y_i) \in \mathcal{D} s.t.x = x_i \\
    0  & \quad \text{ otherwise } 
  \end{cases}
```

To derive the below expression, you'll find its derivative with respect to x. 
```math
3x^2 - 2x + 5
```

The derivative represents the rate of change of the function with respect to x. 

Here's how you can derive it using the `power rule`:

Given the below function , let's find its derivative f'(x):

```math
f(x) = 3x^2 - 2x + 5
```


1. Differentiate the term `3x^2` with respect to x:

```math
   \frac{d}{dx} (3x^2) = 2 * 3x^(2-1) = 6x
```

3. Differentiate the term -2x with respect to x:
   d/dx (-2x) = -2

4. Differentiate the constant term 5 with respect to x:
   d/dx (5) = 0

Now, you can combine these derivatives to find the derivative of the entire function:

f'(x) = 6x - 2

So, the derivative of 3x^2 - 2x + 5 is f'(x) = 6x - 2.


- [ ] To find the integral of the below expression you can apply the power rule for integration. Here are the steps:

```math
\int (4x^3 - 2x^2 + 3x) \mathrm{dx}
```

Integrate each term separately:

```math
\int (4x^3) \mathrm{dx} - \int (2x^2) \mathrm{dx} + \int (3x) \mathrm{dx}
```

Now, apply the `power rule` for `integration`:

```math
\text{ For } \int x^n \mathrm{dx} \text{ , where }  n \neq -1 \text{, the result is } (\frac{1}{(n+1)}) * x^{n+1} + C \text{, where C is the constant of integration.}
```

```math
\int(4x^3) \mathrm{dx} = \frac{4}{4} * x^{3+1} + C = x^4 + C
```

```math
\int(2x^2) \mathrm{dx} = \frac{2}{3} * x^{2+1} + C = \frac{2}{3} * x^3 + C
```

```math
\int(3x) dx = \frac{3}{2} * x^{1+1} + C = \frac{3}{2} * x^2 + C
```

Now, combine the results:

```math
\int(4x^3 - 2x^2 + 3x) \mathrm{dx} = x^4 + \frac{2}{3} * x^3 + \frac{3}{2} * x^2 + C
```

```math
\text{So, the indefinite integral of } 4x^3 - 2x^2 + 3x \text{ with respect to x is: } x^4 + \frac{2}{3}x^3 + \frac{3}{2}x^2 + C \text{, where C is the constant of integration.}
```

# References

- [ ] [No free lunch theorem](https://en.wikipedia.org/wiki/No_free_lunch_theorem)




