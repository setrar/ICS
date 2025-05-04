D = 3.2537e+09  
for n=0:2:31 % This is pi/2-BPSK
    bit0=(1-(2*mod(floor(D/(2^n)),2)));
    bit1=(1-(2*mod(floor(D/(2^(n+1))),2)));
    cw(1+n) = bit0;
    cw(2+n) = sqrt(-1)*bit1; % to use normal BPSK, remove the pi/2 rotation
    cw_QPSK(1+(n/2)) = (bit0 + sqrt(-1)*bit1)/sqrt(2);
end
plot(cw), plot(cw_QPSK)