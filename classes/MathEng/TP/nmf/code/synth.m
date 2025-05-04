%synthesize singal in time domain by IFFT
%Y: complex spectrogram
%HP: window overlapping, default 0
function x=synth(Y,HP)

if (nargin<2)
%HP=round(size(Y,1)/4);
HP=0;
end

%check if it's something stupid half spectrum
if (mod(size(Y,1),2)==1)

  Y=[ Y; conj(flipud(Y(2:size(Y,1)-1,:))) ]   ;

end

hw=hamming(size(Y,1));
hw=1./hw';

X=real(ifft(Y));
x=X(:,1)';
%x=x.*hw;

len0=size(X,1);
len=len0;

for i=2:size(X,2)
  x0=X(:,i)';
  %x0=x0.*hw;
  
  x(len-HP+1: len)=0.5*(x(len-HP+1:len)+x0(1:HP));
  x=[x  x0(HP+1:len0)];

  len=len+len0-HP;

end

end
