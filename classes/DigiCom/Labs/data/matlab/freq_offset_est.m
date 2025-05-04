% Filename: freq_offset_est.m
function [ f_offset ] = freq_offset_est(signal, pss_t, Nf)
  %%Frequency offset estimator

  % pss;

  DELTA_F = 10;

  Fs = 61.44e6;
  f_min = -7500;
  f_max = 7500;

  m = f_min:DELTA_F:f_max;
  Y = zeros(1,length(m));  
  L = length(pss_t);
  t = 0:(1/Fs):((L-1)/Fs);

  for j = 1:length(m)                   
    Y(j) = Y(j) + abs(sum(exp(-2*pi*1i*m(j).*t).* conj(pss_t).* signal(Nf:(Nf + L - 1)).')).^2;
  end
  
  [A_fo, fo] = max(Y);
  fprintf('m %d, A_fo %d, fo %d \n',length(m),10 * log10(A_fo),fo);

  fprintf('Detected_offset = %d Hz\n', m(fo));

  figure;
  subtitle('Frequency offset');
  plot(10 * log10(abs(Y)),".")

  % f_offset = Y

end