# SIMD in C

```c
    float a[VEC_LENGTH], b[VEC_LENGTH], c[VEC_LENGTH];

    // Initialize arrays a and b
    for(int i = 0; i < VEC_LENGTH; i++) {
        a[i] = i;
        b[i] = i + 1;
    }

    // Calculate the sum of arrays a and b into array c
    for(int i = 0; i < VEC_LENGTH; i++) {
        c[i] = a[i] + b[i];
    }

```

- [ ] Compile

```
gcc -O2 -march=native -ftree-vectorize add.c
```

- [ ] Run

```
.a.out
```
> Returns
```powershell
c[0] = 1.000000
c[1] = 3.000000
c[2] = 5.000000
c[3] = 7.000000
```


# References

- [ ] [Making use of SIMD Vectorisation to Improve Code Performance](https://www.youtube.com/watch?v=62_TLN-wk4s)
