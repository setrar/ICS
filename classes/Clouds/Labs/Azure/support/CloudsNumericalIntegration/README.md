# Clouds: Numerical Integration 

We saw how to do numerical integration in the class. 

You first task is to create a program that can do numerical integration with the function abs(sin(x)). 

Given an interval lower and upper, your code should break up the interval into $N$ subintervals, compute the area of the rectangle at each subinterval and add them all up. 

For example, if you give as input 0 and 3.14159 (which is approximately $\pi$), you should get $1.99…$ which is close to $2$ ($\int \sin 𝑥 = − \cos 𝑥$, ignoring aspects of continuity, which when evaluated in the range gives you $- \cos \pi + \cos 0 = 2$). 

Your program should loop and repeatedly compute numerical integral for $N = 10, 100, 100, 1000, 10k, 100k, 1M$. You will end up getting 7 values, one for each value of $N$. You will see that as $N$ increases, result converges to 2. 

This will also make the integral computation time consuming which will be useful for load testing later.

---

## Local

- [ ] Run Locally

```
python app.py
```
> Returns
```powershell
 * Serving Flask app 'app'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:8080
 * Running on http://192.168.1.103:8080
Press CTRL+C to quit
```

- [ ] Test using curl

```
curl -X GET http://192.168.1.103:8080/numericalintegralservice/0/3.14
```
> Returns
```powershell
Numerical integration of |sin(x)| from 0.0 to 3.14:

N =      10, Result = 2.0082387492, Time = 0.000011 seconds
N =     100, Result = 2.0000808974, Time = 0.000016 seconds
N =    1000, Result = 1.9999995534, Time = 0.000141 seconds
N =   10000, Result = 1.9999987399, Time = 0.001405 seconds
N =  100000, Result = 1.9999987318, Time = 0.012417 seconds
N = 1000000, Result = 1.9999987317, Time = 0.079974 seconds
N = 10000000, Result = 1.9999987317, Time = 0.715536 seconds
```
