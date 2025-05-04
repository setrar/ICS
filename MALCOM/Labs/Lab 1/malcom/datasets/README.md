### CIFAR-10 Data Loading

### :a: Python Version

We will now train the implemented neural network in a real dataset, the widely used CIFAR-10. You can download this dataset at: `https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz` Then, you can put it in the folder malcom/datasets (or anywhere else you want, but then you will need to change the path in the below code).


- [ ] Download the compressed tar file from the UofT's server

```
wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
```
> Returns
```powershell
--2024-03-26 09:56:28--  https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
Resolving www.cs.toronto.edu (www.cs.toronto.edu)... 128.100.3.30
Connecting to www.cs.toronto.edu (www.cs.toronto.edu)|128.100.3.30|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 170498071 (163M) [application/x-gzip]
Saving to: ‘cifar-10-python.tar.gz.1’

cifar-10-python.tar.gz.1               100%[============================================================================>] 162.60M  19.3MB/s    in 10s     

2024-03-26 09:56:39 (16.0 MB/s) - ‘cifar-10-python.tar.gz.1’ saved [170498071/170498071]
```

- [ ] Decompress the file

```
tar zxvf cifar-10-python.tar.gz
```
> Returns
```powershell
x cifar-10-batches-py/
x cifar-10-batches-py/data_batch_4
x cifar-10-batches-py/readme.html
x cifar-10-batches-py/test_batch
x cifar-10-batches-py/data_batch_3
x cifar-10-batches-py/batches.meta
x cifar-10-batches-py/data_batch_2
x cifar-10-batches-py/data_batch_5
x cifar-10-batches-py/data_batch_1
```

### :b: Matlab Version

We will now train the implemented neural network in a real dataset, the widely used CIFAR-10. You can download this dataset at: `https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz` Then, you can put it in the folder malcom/datasets (or anywhere else you want, but then you will need to change the path in the below code).


- [ ] Download the compressed tar file from the UofT's server

```
wget https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz
```
> Returns
```powershell
--2024-04-08 21:16:13--  https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz
Resolving www.cs.toronto.edu (www.cs.toronto.edu)... 128.100.3.30
Connecting to www.cs.toronto.edu (www.cs.toronto.edu)|128.100.3.30|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 183434414 (175M) [application/x-gzip]
Saving to: ‘cifar-10-matlab.tar.gz’

cifar-10-matlab.tar.gz          100%[======================================================>] 174.94M  26.2MB/s    in 7.5s    

2024-04-08 21:16:21 (23.3 MB/s) - ‘cifar-10-matlab.tar.gz’ saved [183434414/183434414]

FINISHED --2024-04-08 21:16:21--
Total wall clock time: 8.2s
Downloaded: 1 files, 175M in 7.5s (23.3 MB/s)
```

- [ ] Decompress the file

```
tar zxvf cifar-10-matlab.tar.gz
```
> Returns
```powershell
x cifar-10-batches-mat/
x cifar-10-batches-mat/data_batch_1.mat
x cifar-10-batches-mat/batches.meta.mat
x cifar-10-batches-mat/data_batch_5.mat
x cifar-10-batches-mat/data_batch_2.mat
x cifar-10-batches-mat/test_batch.mat
x cifar-10-batches-mat/readme.html
x cifar-10-batches-mat/data_batch_3.mat
x cifar-10-batches-mat/data_batch_4.mat
```

### :x: Not saved to `github`

```
cat .gitignore
```
> cifar-10-*

# References

- [ ] [UofT's Alex Krizhevsky's home page](http://www.cs.toronto.edu/~kriz/cifar.html)
- [ ] [Showing images from CIFAR-10 with Plots.jl](https://discourse.julialang.org/t/showing-images-from-cifar-10-with-plots-jl/58143)

Note: The files are not uploaded to github :x:
