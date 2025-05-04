% Filename: freq_offset_est.m
function [ f_offset ] = freq_offset_est(signal, pss, Nf, m, Fs)
  %%Frequency offset estimator

  Y = zeros(1,length(m));  
  
  L = length(pss);
  t = 0:(1/Fs):((L-1)/Fs);

  signal_part = signal(Nf:(Nf + L - 1));
  trans = signal_part.';
  transConj = conj(pss).* trans;

  for j = 1:length(m)
    exp_comp = exp(-2*pi*1i*m(j).*t);
    signal_offset = sum(exp_comp.*transConj);
    value = abs(signal_offset).^2;
    fprintf('adding %d at %d\n',value,j);
    Y(j) = Y(j) + value;
  end
  
  [A_fo, fo] = max(Y);
  fprintf('m %d, A_fo %d, fo %d \n',length(m),10 * log10(A_fo),fo);

  % disp('Detected offset = 150Mhz',real(m2_chan));

  figure;
  subtitle('Frequency offset');
  plot(1:length(m),10 * log10(abs(Y)),".")

end