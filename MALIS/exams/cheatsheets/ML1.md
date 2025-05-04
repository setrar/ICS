# CheatSheet

Generate a condensed cheat sheet base of the below lectures
- Lecture 2: Linear Models for Regression
- Lecture 3: Linear Classifiers: LDA & Logistic Regression
- Lecture 4: Gradient Descent
- Lecture 5: The Perceptron & Bias-Variance Decomposition
- Lecture 6: Support Vector Machines & Kernels 
- Lecture 7: Kernels
- Lecture 8: Kernels, Bias-variance decomposition and regularization
- Lecture 9: Regularization, Validation & Trees
- Lecture 10: Ensembles
- Lecture 11: Unsupervised Learning
- Lecture 12: Neural Networks


Creating a condensed cheat sheet that encompasses the key concepts from the listed lectures on machine learning can provide a quick reference to the most important principles, formulas, and algorithms covered in your course. Here's a structured summary:

### Linear Models for Regression
- **Linear Regression**: $y = \beta_0 + \beta_1x_1 + ... + \beta_nx_n + \epsilon$
- **Ordinary Least Squares (OLS)**: Minimize $\sum (y_i - \hat{y}_i)^2$

### Linear Classifiers: LDA & Logistic Regression
- **Logistic Regression**: $\log\left(\frac{p}{1-p}\right) = \beta_0 + \beta_1x_1 + ... + \beta_nx_n$
- **Linear Discriminant Analysis (LDA)**: Maximizes the ratio of between-class variance to within-class variance in any particular data set thereby guaranteeing maximal separability.

### Gradient Descent
- **Gradient Descent Formula**: $\theta := \theta - \alpha \nabla_\theta J(\theta)$
- **Learning Rate ($\alpha$)**: Controls the step size at each iteration.

### The Perceptron & Bias-Variance Decomposition
- **Perceptron Learning Rule**: $w := w + \alpha(y - \hat{y})x$
- **Bias-Variance Tradeoff**: Total error = $Bias^2$ + Variance + Noise

### Support Vector Machines & Kernels
- **SVM Objective**: Maximize margin between classes; $w \cdot x + b = 0$
- **Kernel Trick**: Allows SVMs to learn non-linear boundaries.

### Kernels
- **Kernel Types**: Linear, Polynomial, Radial Basis Function (RBF)
- **Application**: Transform input space into a higher-dimensional space.

### Bias-Variance Decomposition & Regularization
- **Regularization**: L1 (Lasso), L2 (Ridge) to prevent overfitting.
- **Effect**: Balances bias and variance, adds penalty term to loss function.

### Regularization, Validation & Trees
- **Cross-Validation**: For model evaluation, e.g., k-fold cross-validation.
- **Decision Trees**: Split based on feature that results in highest information gain.

### Ensembles
- **Random Forest**: Ensemble of decision trees, reduces overfitting through bagging.
- **Boosting**: Sequentially focus on difficult examples; e.g., AdaBoost, Gradient Boost.

### Unsupervised Learning
- **Clustering**: k-Means, hierarchical clustering.
- **Dimensionality Reduction**: Principal Component Analysis (PCA), t-SNE.

### Neural Networks
- **Feedforward Neural Network**: Layers of nodes, activation functions (ReLU, sigmoid).
- **Backpropagation**: Algorithm for training, via chain rule of calculus.

This cheat sheet distills the essence of each lecture topic into a compact form, aiming to capture the foundational elements that are critical for understanding and applying machine learning concepts. It serves as a quick reference guide for the key theoretical principles and practical algorithms in the course.
