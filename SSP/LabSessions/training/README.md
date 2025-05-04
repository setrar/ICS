# Matlab Training


```matlab
fs = 1000;
t = 0:1/fs:2;
x = vco(sin(2*pi*t),[10 490],fs);

strips(x,0.25,fs)
```

<img src=images/signal1.png width='40%' height='40%' > </img>
