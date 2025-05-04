%M=[0xFFFFFFFF, 0x4BA5A933, 0x7D910E5A, 0x6D26339C, 0x71C7C3E0,0x7E0FFC00, 0x731D8E64, 0x6B44F5B0, 0x7DC218EC, 0x4DA1B746, 0x42F0FFFF]''
M = [4294967295,   1269147955,   2106658394,   1831220124,   1908917216,   2114976768,   1931316836, 1799681456,   2109872364,   1302443846,   1123090431];

% K=11 bit, S=14 symbols
C11_3gpp=zeros(2048,14*12);
cw_QPSK = zeros(16,1);
cw = zeros(32,1);
for C=0:2047, % C is in the input c-sequence, C=[c0 c1 c2 ... c(K-1)]
%  a
  D=mod(C,2)*M(1); % D is the d-sequence, D=[d0 d1 d2 ... d31];
  for n=2:11,
    D = bitxor(D,(mod(floor(C*(2^(1-n))),2)*M(n)));
  end
  for n=0:2:31 % This is pi/2-BPSK
    bit0=(1-(2*mod(floor(D/(2^n)),2)));
    bit1=(1-(2*mod(floor(D/(2^(n+1))),2)));
    cw(1+n) = bit0;
    cw(2+n) = sqrt(-1)*bit1; % to use normal BPSK, remove the pi/2 rotation
    cw_QPSK(1+(n/2)) = (bit0 + sqrt(-1)*bit1)/sqrt(2);
  end
  idx=0;
  for symb=0:13,
    for re=0:11,
      if (symb==3 | symb==10)
         C11_3gpp(1+C,1+(symb*12)+(0:11)) = ones(1,12); 
         C11_3gpp_QPSK(1+C,1+(symb*12)+(0:11)) = ones(1,12); 
         symb=symb+1;
      end
%      fprintf("symb %d,re %d\n",symb,re);
      C11_3gpp(1+C,1+(symb*12)+re) = cw(1+rem(idx,32)); % rate-matching of the cw-sequence
      C11_3gpp_QPSK(1+C,1+(symb*12)+re) = cw_QPSK(1+rem(idx,16)); % rate-matching of the cw-sequence
      idx=idx+1;
    end
   end
end

% C is the code sequence to be generated
C=77;
c0_t=[];
c0_t_QPSK=[];
for symb=0:13,
% extract OFDM symbols "symb" from coded sequence and do the DFT-precoding (SC-FDMA in the lecture slides)
  if (symb==3) 
    symb=4;
  end
  if (symb==10)
    symb=11;
  end
  c0_f = fft(C11_3gpp(1+C,1+(symb*12) + (0:11)));
  c0_f_QPSK = fft(C11_3gpp_QPSK(1+C,1+(symb*12) + (0:11)));
  c0_t = [c0_t ifft(c0_f,2048)];
  c0_t_QPSK = [c0_t_QPSK ifft(c0_f_QPSK,2048)];
end

figure(1)
subplot(211)
plot(real(c0_t));
subplot(212)
plot(imag(c0_t));
figure(2)
plot(real(c0_t),imag(c0_t),'.')
axis('square') 
figure(3)
plot(real(c0_t_QPSK),imag(c0_t_QPSK),'.')
axis('square')

% receiver

SNRdB = 3;
SNR=10^(.1*SNRdB);
R = sqrt(SNR) * C11_3gpp(1+C,:) + randn(1,168) + sqrt(-1)*randn(1,168);

nc_corr = abs(R * C11_3gpp');