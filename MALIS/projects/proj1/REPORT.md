# REPORT

Team: Ekemini Ekong, Brice Robert 

## Part I – Implementing a kNN from scratch:

- [ ] Task 1.

By updating the `knn.py` source file representing the kNN `Classifier`, we were able to add/fill the nescessary methods that allows the `experiments` notebook to run.

- The `knn.py` source code mimics the `sklearn.neighbors.KNeighborsClassifier` from the Python package `scikit-learn `.
- The distance metrics used are `Euclidian distance` and `Minkowski distance` using the same function but changing the parameters

```math
D(X,Y) = ( \sum_{i=1}^n | x_i - y_i |^p )^{\dfrac{1}{p}}
```

- an accuracy score function was also added to the KNN Classifier classe for testing the highest score.
- `train_test_split` from `sklearn.model_selection` was used as model. The training datasets were then used with the KNN classifier to preform data fitting and prediction 

- [ ] Task 2.

Studying the `curse of dimensionality` issue, we figured there was no need to exceed the 300 neighbor count so we tested through the notebook by ,first, adding manual code and then looping through a function. The function was removed since it was causing delays in the execution a k-NN range was used to determine the best k.

The range loop returned with an accuracy score of 80.54% for 246, 247 neighbor points. 

The model speed needs to be worked on since despite the Python interpreter being slow, room for improvment is always possible.

Part II – The curse of dimensionality:

- [ ] Task 3.

- An attempt to calculate l (edge lenght) has been given based on a formula extracted form diverse sources (link for References are provided). 
- Another attempt to display the distances calculated from the Validation data were displayed on a plot.
- The validation data only having 2 dimensions, the demonstration were made against n (number of samples) and k nearest neighbors.
- Some [code](https://gist.github.com/BadreeshShetty/bf9cb1dced8263ef997bcb2c3926569b) explaining how the dimension can affect performances were not displayed to prove the curse of dimentionality issue.

## :bulb: Konown Issue

The `util.py` source file ws not used due to the `plt.pcolormesh` function crashing 
