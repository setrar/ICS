Nfft=2048;
pss0; % pss_0;
pss1; % pss_1;
pss2; % pss_2;

pss0_t = ifft(pss_0.'); 
pss0_t = pss0_t/norm(pss0_t);

pss1_t = ifft(pss_1.');
pss1_t = pss1_t / norm(pss1_t);

pss2_t = ifft(pss_2.');
pss2_t = pss2_t / norm(pss2_t);

pss0_t = [pss0_t(((2048-143):2048)) pss0_t];
pss1_t = [pss1_t(((2048-143):2048)) pss1_t];
pss2_t = [pss2_t(((2048-143):2048)) pss2_t];
