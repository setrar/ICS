# CheatSheet

Generate a one page cheatsheet for MachineLearning course


Creating a one-page cheat sheet for a Machine Learning course involves condensing the most important concepts, formulas, and algorithms into a succinct and visually accessible format. Here's a structured outline to guide the creation of such a cheat sheet:

### 1. Basic Concepts
- **Definition of Machine Learning**: Automated detection of meaningful patterns in data.
- **Types of Machine Learning**: Supervised, Unsupervised, Semi-supervised, Reinforcement Learning.
- **Bias-Variance Tradeoff**: Balancing model complexity to prevent underfitting or overfitting.

### 2. Data Preprocessing
- **Handling Missing Values**: Imputation techniques.
- **Feature Scaling**: Standardization, Normalization.
- **Data Splitting**: Training set, Validation set, Test set.

### 3. Supervised Learning
- **Regression**: Linear Regression, Polynomial Regression, Ridge, Lasso.
  - Equation: $y = \beta_0 + \beta_1x_1 + ... + \beta_nx_n$
  - Cost Function: Mean Squared Error (MSE)
- **Classification**: Logistic Regression, SVM, Decision Trees, Random Forest, Gradient Boosting.
  - Logistic Regression Equation: $\sigma(z) = \frac{1}{1 + e^{-z}}$

### 4. Unsupervised Learning
- **Clustering**: K-Means, Hierarchical, DBSCAN.
  - K-Means Objective: Minimize within-cluster variances.
- **Dimensionality Reduction**: PCA, t-SNE.

### 5. Neural Networks and Deep Learning
- **Basics**: Neurons, Activation Functions (ReLU, Sigmoid, Tanh).
- **Network Architecture**: Layers, Nodes, Feedforward, Backpropagation.
- **Learning**: Gradient Descent, Learning Rate, Epochs.

### 6. Evaluation Metrics
- **Regression**: MSE, RMSE, MAE.
- **Classification**: Accuracy, Precision, Recall, F1-Score, ROC-AUC.

### 7. Model Selection and Tuning
- **Cross-Validation**: K-Fold, Stratified K-Fold.
- **Hyperparameter Tuning**: Grid Search, Random Search.

### 8. Key Algorithms Overview
- **Decision Trees**: Split based on information gain, Gini impurity.
- **Random Forest**: Ensemble of decision trees, reduces overfitting.
- **Gradient Boosting**: Sequential correction of predecessor's errors.
- **SVM**: Maximizing the margin between classes.

### 9. Tools and Libraries
- **Python Libraries**: NumPy, Pandas, Scikit-learn, TensorFlow, PyTorch.
- **R Libraries**: Caret, mlr, nnet.

### 10. Important Formulas
- **Gradient Descent**: $\theta_{next} = \theta_{current} - \alpha \cdot \nabla_\theta J(\theta)$
- **Information Gain**: $IG(D, a) = Entropy(D) - \sum_{v \in Values(a)} \frac{|D_v|}{|D|} Entropy(D_v)$

This outline covers the essentials for a broad range of machine learning topics. To fit this onto a one-page cheat sheet, focus on concise explanations, use bullet points, and include small, clear diagrams or equations where applicable. The goal is to create a quick reference guide that balances readability with comprehensive coverage of key concepts.
