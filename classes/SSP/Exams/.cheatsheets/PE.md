A cheat sheet for point estimators provides a quick reference to the most common estimators used in statistics for estimating parameters of a population based on sample data. Here's a concise overview:

### 1. Mean (Average)
- **Estimator**: Sample Mean ($\bar{x}$)
- **Formula**: $\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x_i$
- **Purpose**: Estimate the population mean ($\mu$).

### 2. Variance
- **Estimator**: Sample Variance ($s^2$)
- **Formula**: $s^2 = \frac{1}{n-1}\sum_{i=1}^{n} (x_i - \bar{x})^2$
- **Purpose**: Estimate the population variance ($\sigma^2$).

### 3. Standard Deviation
- **Estimator**: Sample Standard Deviation ($s$)
- **Formula**: $s = \sqrt{s^2}$
- **Purpose**: Estimate the population standard deviation ($\sigma$).

### 4. Proportion
- **Estimator**: Sample Proportion ($\hat{p}$)
- **Formula**: $\hat{p} = \frac{x}{n}$
  - $x$: Number of successes in the sample.
  - $n$: Sample size.
- **Purpose**: Estimate the population proportion ($p$).

### 5. Correlation Coefficient
- **Estimator**: Sample Correlation Coefficient ($r$)
- **Formula**: $r = \frac{1}{n-1}\sum \left(\frac{x_i - \bar{x}}{s_x}\right)\left(\frac{y_i - \bar{y}}{s_y}\right)$
  - $s_x$, $s_y$: Standard deviations of $x$ and $y$.
- **Purpose**: Estimate the population correlation coefficient ($\rho$).

### 6. Regression Coefficients
- **Estimators**: 
  - Slope ($\hat{\beta}_1$): $\hat{\beta}_1 = \frac{\sum (x_i - \bar{x})(y_i - \bar{y})}{\sum (x_i - \bar{x})^2}$
  - Intercept ($\hat{\beta}_0$): $\hat{\beta}_0 = \bar{y} - \hat{\beta}_1\bar{x}$
- **Purpose**: Estimate the coefficients of a linear regression model.

### Usage Notes:
- **Sample Mean** and **Sample Proportion** are unbiased estimators of their respective population parameters.
- **Sample Variance** uses $n-1$ (Bessel's correction) to provide an unbiased estimate of population variance.
- **Sample Standard Deviation** and **Sample Correlation Coefficient** are derived from variance and covariance, respectively.
- **Regression Coefficients** ($\hat{\beta}_0$ and $\hat{\beta}_1$) are used in linear regression analysis to model the relationship between two variables.

This cheat sheet succinctly covers fundamental point estimators in statistics, providing formulas and their purposes for quick reference and application in data analysis and statistical inference.
