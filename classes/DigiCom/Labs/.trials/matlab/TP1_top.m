%Generate the PSS signals (pss0_t,pss1_t,pss2_t)
pss

% Do section 1.1 work here


% Read in sample file (example here)
fd = fopen('data/usrp_samples.dat','r') ; 
s = fread(fd,153600*2,'int16') ; 
fclose(fd) ; 
s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ; 


%plot an approximation to the power spectrum
figure(1)
f = linspace(-7.68e6,7.68e6,153600);
plot(f,20*log10(abs(fftshift(fft(s2)))))
axis([-7.68e6 7.68e6 100 150])


% Do Sections 1.2 and 1.3 work hre
