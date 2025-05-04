fd = fopen('data/signal816.dat','r') ;
s = fread(fd,153600*16,'int16') ;
fclose(fd) ;
s2_816 = s(1:2:end) + sqrt(-1)*s(2:2:end) ;

fd = fopen('data/signal806.dat','r') ;
s = fread(fd,153600*16,'int16') ;
fclose(fd) ;
s2_806 = s(1:2:end) + sqrt(-1)*s(2:2:end) ;

fd = fopen('data/signal796.dat','r') ;
s = fread(fd,153600*16,'int16') ;
fclose(fd) ;
s2_796 = s(1:2:end) + sqrt(-1)*s(2:2:end) ;

figure(1)
s2 = s(1:2:end);
lens2 = length(s2);
f2 = linspace(-7.68e6,7.68e6,1+lens2);
f = f2(1:(length(f2)-1)); 
plot(f,20*log10(abs(fftshift(fft(s2_806)))))

figure(2)
plot(f,20*log10(abs(fftshift(fft(s2_796)))))

figure(3)
plot(f,20*log10(abs(fftshift(fft(s2_816)))))
