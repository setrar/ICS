# REPORT

Please find the Jupyter Notebook associated with this report here [REPORT.ipynb](REPORT.ipynb)

`Project Title`: Adaboost for Medical Image Classification

`Objective`: The goal of this machine learning project is to utilize the Adaboost algorithm to
enhance the accuracy of medical image classification. Adaboost is an ensemble learning
technique that combines multiple weak classifiers to create a strong classifier. In this project, we will focus on using Adaboost to classify medical images from a given dataset.

`Dataset`: You can use a popular medical image dataset such as the MedMNIST. The dataset
contains multiple subsets with images from different organs acquired with different modalities.
You can focus on only a couple of them (you can choose them).

`Tasks`:

1. Data Preprocessing:

I was able to load the MedMNIST database, I wanted to the Blood Set since it was a small set with around 28x28 images on 11959 rows on 3 Dimensions located in the `REPORT.ipynb` notebook

Like project 2, my goal was to flatten the tensor image of 28x28 which would give a 785 number that can be used either in a on hot batch format (meaning binary classification)

3. Implement Weak Classifiers:

- AdaBoost combines multiple weak learners (typically simple decision trees, also known as decision stumps) to create a strong classifier. The implementation of the clasifiers is located in the `strong_classifier.jl` source code that is loaded and included in the `REPORT.ipynb` notebook

`strong_classifier.jl`
The function constructs the final classification decision (H) of an AdaBoost model given input features X, and parameters i, p, theta, and alpha that characterize the ensemble of weak classifiers and their respective weights in the final decision.

Parameters
X: The input features matrix where each row represents a sample, and each column represents a feature.
i: Indices of features used by each weak classifier.
p: The polarity of the weak classifiers, indicating the direction of the inequality used in classification decisions.
theta: Thresholds for the decision stumps (weak classifiers) used in the AdaBoost model.
alpha: Weights of each weak classifier, indicating their contribution to the final decision.

Process
Initialization: The function prepares the output vector H with a default classification of -1 for all samples, and an accumulator sum_weak_classifications to aggregate the weighted votes from all weak classifiers.

Weak Classifiers Aggregation: For each weak classifier j in the ensemble (up to T):

A temporary classification decision weak_classification is made for all samples based on the j-th classifier's criteria (i[j], p[j], theta[j]).
These decisions are weighted by alpha[j] and aggregated into sum_weak_classifications.
Final Decision: The sign of sum_weak_classifications determines the final classification: samples with a positive sum are classified as 1, reflecting the majority vote of the weighted weak classifiers.

Return Value
H: A vector of the final classification decisions for each sample in X.

4. Adaboost Algorithm:
 
The provided `adaboost` function in Julia implements the core idea of the AdaBoost algorithm, focusing on binary classification problems. The original AdaBoost algorithm, also known as `AdaBoost.M1`, and its variants like `SAMME` and `SAMME.R`, extend the algorithm's capabilities and adapt it for different scenarios, including multi-class classification. Here's a comparison of these approaches:

Original AdaBoost (AdaBoost.M1)
- Purpose: Designed for binary classification tasks.
Mechanism: Focuses on increasing the weight of misclassified instances so that subsequent weak classifiers pay more attention to difficult cases.
- Output: Combines weak classifiers by weighting their votes based on their accuracy, with the final decision made through a weighted majority vote.

The provided `adaboost` function aligns most closely with `AdaBoost.M1's` approach, focusing on binary classification with a straightforward implementation.

6. Ensemble Model Training:

I used training and testing errors but the result of the testing errors were always off and not aligned to the training errors.

<img src=images/training-error.png width='50%' height='50%' > <img>

8. Model Evaluation:

Based on the testing results provided by the testing errrors, the model doesn't seem to behave properly since training set error and testing set error are not aligned properly. 

9. Comparison and Analysis:

None

11. Bonus: Hyperparameter Tuning

Conclusion:

I was not able to have a good model to further classify the blood data. I didn't try to test the model against the blood data. That step was supposed to be the last step. For the sake of time, I decided to release the unfinished project but wanted to show some progress made. 

# Disclaimer 

- I used ChatGPT all along to transpile source code from Matlab, Python or any other source code that can be transpiled.
- For any source code, transpiled I used, I careffuly added its references in the `References` section at the bottom of each NoteBooks. In majority, my work is derived from those references.

