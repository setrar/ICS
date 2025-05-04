# REPORT

Project 2: The Perceptron

Team: Ekemini Ekong, Brice Robert 

## Part I – Implementing a perceptron algorithm from scratch:

- [ ] Task 1. Several experiments have been implemented to create the  [`perceptron.jl`](perceptron.jl) source code.

- [ ] Task 2. Document your code.

First, as [simple perceptron](experiments/perceptron.jl) file has been layed out with a `mutable` structure `Perceptron` since Julia like C uses data structure rather than object oriented encapsulation `Class`, then all necessary functions have been added to allow the perceptron to do some basic training.

During the training, the Perceptron data will be mutated this is why `mutable` has been added. By default, Julia tends to take the functional programming side and favors immutability and function first approach.

```julia
# Perceptron class definition
mutable struct Perceptron
    weights::Vector{Float64}
    bias::Float64
end
# Constructor for Perceptron
function Perceptron(input_size::Int) ...
# Activation function (step function)
function activate(x) ...
# Prediction method for Perceptron
function predict(perceptron::Perceptron, input::Vector{Float64}) ...
# Train the perceptron model
function train_perceptron!(model, train_data, epochs = 10, lr = 0.1) ...
```

1. The [simple Perceptron](experiments/perceptron.jl) uses the `sign` step function as its activation function, during training the prediction is called and from the first [experiment](experiments/experiment.ipynb) a mere `.098` acuracy score was achieved. The training was already using the MINST Dataset.
2. We then tried to use the sigmoid function as its activation function and the result was literally the same.
3. We started thinking about decomposing the predition/training work. We extended the simple Perceptron by allowing multiple instances to call the process. We created the [MultiClass Perceptron](perceptron.jl). The `MCP` can be split into multiple classes per epoch calls. The multiple calls are then joined by fetching the best prediction.
4. Finally, before calling the training process, the data has been massaged and being flattened.

The best acuracy result we received was around `.81` when splitting to 10 classes and rounding the epochs to 100. The learning rate was left to `.01`
It obviously took some time, around 5 minutes. 

## Part II – Using the perceptron:

- [ ] Task 3. The [MINST Database](https://en.wikipedia.org/wiki/MNIST_database) was loaded through the [Flux.jl](https://fluxml.ai/) package. The majority of our testing have been done using the MINST Database. While focusing on the implementation, and optimisation of the Perceptron. We used the `Flux.jl` package to better understand how to use the Perceptron through a Machine Learning environment:

- [Full DB Analysis - 0 to 9 digits](experiments/experiment_with-Flux-MNIST-full.jl.ipynb) is used to display the images, the misidentified images, the acuracy score (0.998) and the learning curve.
- [Partial DB Analysis - 0 to 1](experiments/experiment_with-Flux-MNIST-part.jl.ipynb), this notebook was used to split the data by only using the 0 and 1 images. The learning curve was not as sharp as the full dataset.

- [ ] Task 5. Somehow, The perceptron was used using the training set.

## Part III – Getting familiar with the gradient:


- [ ] Task 6.

Solve exercises 5.1-5.3, 5.5-5.7 and 5.9 from Chapter 5 in [The Mathematics of Machine Learning](https://mml-book.github.io/book/mml-book.pdf)

Click here &#x1F449; [Exercises REPORT](REPORT_Part-III.jl.ipynb) 

## &#x1F4D5; Displaimer
- [ ] ChatGPT was used all along the project
- [ ] Any references that helped making the project have been added at the bottom of each notebooks in the `References` section
