Project 3: Ridge Regression

Team: Brice Rober, Ekemini Ekong

Part I – Implementing Ridge Regression from Scratch:

Task 1. Development of the ridge.py file to implement Ridge Regression without using external libraries like scikit-learn.

Task 2. Documentation and analysis of the code implementation.

We initiated the project by constructing a Ridge Regression class in Python. The primary focus was on integrating the L2 regularization directly into the linear regression framework and using a python class.




The key aspects of our implementation include a straightforward approach to the Ridge Regression algorithm without data standardization, as we worked with a single feature dataset (Olympics 100m dataset). The focus was on correctly applying the L2 penalty to the coefficients during the model fitting process.

The fit method integrates the regularization term into the linear regression, while the predict method generates the model predictions. Special attention was given to the numerical stability of the algorithm, opting for np.linalg.solve over matrix inversion methods for solving the linear equations.

Subsequent to the model development, we embarked on comparing our custom model's performance with scikit-learn's Ridge Regression implementation. Using the Mean Squared Error (MSE) metric, we observed remarkably similar results:

    Our Model's MSE: 0.18584114069835977
    scikit-learn Model MSE: 0.18584114069831603

This close similarity in performance strongly validates our model's accuracy and reliability.

Regarding the choice of the regularization parameter λ (alpha), we conducted a series of experiments by varying λ's value. The optimal λ was determined based on the balance between bias and variance, observing the changes in MSE. We found that a moderate value of λ provided the best trade-off, effectively minimizing overfitting while maintaining prediction accuracy.

In conclusion, our Ridge Regression implementation demonstrated robust performance, closely mirroring that of established machine learning libraries. The insights gained from the analysis of λ's impact on the model's performance were invaluable, highlighting the importance of regularization in machine learning algorithms.