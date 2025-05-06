# Clouds: Numerical Integration 

We saw how to do numerical integration in the class. 

You first task is to create a program that can do numerical integration with the function abs(sin(x)). 

Given an interval lower and upper, your code should break up the interval into $N$ subintervals, compute the area of the rectangle at each subinterval and add them all up. 

For example, if you give as input 0 and 3.14159 (which is approximately $\pi$), you should get $1.99…$ which is close to $2$ ($\int \sin 𝑥 = − \cos 𝑥$, ignoring aspects of continuity, which when evaluated in the range gives you $- \cos \pi + \cos 0 = 2$). 

Your program should loop and repeatedly compute numerical integral for $N = 10, 100, 100, 1000, 10k, 100k, 1M$. You will end up getting 7 values, one for each value of $N$. You will see that as $N$ increases, result converges to 2. 

This will also make the integral computation time consuming which will be useful for load testing later.

## Function

```
func start            
```
> Returns
```powershell
func start            
Found Python version 3.12.7 (python3).

Azure Functions Core Tools
Core Tools Version:       4.0.6821 Commit hash: N/A +c09a2033faa7ecf51b3773308283af0ca9a99f83 (64-bit)
Function Runtime Version: 4.1036.1.23224

[2025-01-26T05:17:45.242Z] Worker process started and initialized.

Functions:

	numericalintegralservice: [GET] http://localhost:7071/api/numericalintegralservice/{lower}/{upper}

For detailed output, run func with --verbose flag.
[2025-01-26T05:17:50.168Z] Executing 'Functions.numericalintegralservice' (Reason='This function was programmatically called via the host APIs.', Id=935386b2-1a7d-4dac-91b0-78dd39b66bae)
[2025-01-26T05:17:50.199Z] Numerical Integration Azure Function triggered.
[2025-01-26T05:17:50.222Z] Host lock lease acquired by instance ID '00000000000000000000000025882DFC'.
[2025-01-26T05:17:50.981Z] Executed 'Functions.numericalintegralservice' (Succeeded, Id=935386b2-1a7d-4dac-91b0-78dd39b66bae, Duration=823ms)
[2025-01-26T05:18:03.912Z] Executing 'Functions.numericalintegralservice' (Reason='This function was programmatically called via the host APIs.', Id=a5055145-8af9-4482-8414-2e0c4fe2a77f)
[2025-01-26T05:18:03.921Z] Numerical Integration Azure Function triggered.
[2025-01-26T05:18:04.721Z] Executed 'Functions.numericalintegralservice' (Succeeded, Id=a5055145-8af9-4482-8414-2e0c4fe2a77f, Duration=810ms)
[2025-01-26T05:18:11.881Z] Executing 'Functions.numericalintegralservice' (Reason='This function was programmatically called via the host APIs.', Id=86ad6a2f-71fd-42ee-9c50-38ad0996a09c)
[2025-01-26T05:18:11.890Z] Numerical Integration Azure Function triggered.
[2025-01-26T05:18:12.674Z] Executed 'Functions.numericalintegralservice' (Succeeded, Id=86ad6a2f-71fd-42ee-9c50-38ad0996a09c, Duration=792ms)
```

- [ ] Testing

```
curl http://localhost:7071/api/numericalintegralservice/0/3.14
```
> Returns
```
Numerical integration of |sin(x)| from 0.0 to 3.14:

N =      10, Result = 2.0082387492, Time = 0.000006 seconds
N =     100, Result = 2.0000808974, Time = 0.000008 seconds
N =    1000, Result = 1.9999995534, Time = 0.000073 seconds
N =   10000, Result = 1.9999987399, Time = 0.000725 seconds
N =  100000, Result = 1.9999987318, Time = 0.007179 seconds
N = 1000000, Result = 1.9999987317, Time = 0.069449 seconds
N = 10000000, Result = 1.9999987317, Time = 0.699966 seconds
```

```
curl http://localhost:7071/api/numericalintegralservice/0/3.14
```
> Returns
```
Numerical integration of |sin(x)| from 0.0 to 3.14:

N =      10, Result = 2.0082387492, Time = 0.000006 seconds
N =     100, Result = 2.0000808974, Time = 0.000007 seconds
N =    1000, Result = 1.9999995534, Time = 0.000067 seconds
N =   10000, Result = 1.9999987399, Time = 0.000683 seconds
N =  100000, Result = 1.9999987318, Time = 0.007041 seconds
N = 1000000, Result = 1.9999987317, Time = 0.069616 seconds
N = 10000000, Result = 1.9999987317, Time = 0.702510 seconds
```

```
curl http://localhost:7071/api/numericalintegralservice/0/3
```
> Returns
```
Numerical integration of |sin(x)| from 0.0 to 3.0:

N =      10, Result = 1.9974746040, Time = 0.000008 seconds
N =     100, Result = 1.9900671233, Time = 0.000016 seconds
N =    1000, Result = 1.9899932428, Time = 0.000161 seconds
N =   10000, Result = 1.9899925041, Time = 0.001492 seconds
N =  100000, Result = 1.9899924967, Time = 0.013169 seconds
N = 1000000, Result = 1.9899924966, Time = 0.087243 seconds
N = 10000000, Result = 1.9899924966, Time = 0.703414 seconds
```

```
curl http://localhost:7071/api/numericalintegralservice/0/3.13145
```
> Returns
```
Numerical integration of |sin(x)| from 0.0 to 3.13145:

N =      10, Result = 2.0081434343, Time = 0.000008 seconds
N =     100, Result = 2.0000302805, Time = 0.000017 seconds
N =    1000, Result = 1.9999493809, Time = 0.000161 seconds
N =   10000, Result = 1.9999485719, Time = 0.001642 seconds
N =  100000, Result = 1.9999485638, Time = 0.013421 seconds
N = 1000000, Result = 1.9999485637, Time = 0.082234 seconds
N = 10000000, Result = 1.9999485637, Time = 0.692335 seconds
```  

# References

- [ ] Creating Function

```
func init --python
```
