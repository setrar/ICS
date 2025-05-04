%convolutive NMF
%D: data matrix MxN  M:base matrix MxRxtt (tt fixed to 4)
%rr:number of bases tt: time span, fixed to 4
%it: number of iteration
%updateW: boolean, whether update W. In training, W is updated, while in decoding, W is read from inW and remains constant. 
%

function [W,H]=cnmf(D,rr,it,updateW,inW)

%the time space set as 4
tt=4;

if (nargin >3)
if (nargin <5 )
  sprintf('usage cnmf(D,rr,it [, updateW, inW]')
  return;
end
W=inW;
rr=size(W,2);
tt=size(W,3);
else
W=rand([size(D,1),rr,tt]);
updateW='true'
end


%rr is the number of axis

H=rand([rr,size(D,2)]);

%for j=1:tt
%W(:,:,j)=W(:,:,1);
%end

one=ones(size(D));

thred=1e-6*size(D,1)*size(D,2);

prevNorm=1e20;

for i=1:it

%get current estimatino
DD=zeros(size(D));
for j=1:tt
 DD=DD + W(:,:,j)*shifting(H,j-1);
end

if (mod(i,100)==0)
del=norm(D-DD);
sprintf('Iteration: %d residence %f\n',i, del)

if ((del > prevNorm) | (del < thred))
break;
end

%prevNorm=del;

end

%it is D/DD
DD=D ./ DD;

Hsum=zeros(size(H));

%update W only if updateW is set
if (updateW)
  for j=1:tt
    tH=shifting(H,j-1);
    tW=W(:,:,j);
    %KL object function
    W(:,:,j)=tW .* (DD  * tH') ./ (one * tH');

  end

end

DD=zeros(size(D));
for j=1:tt
 DD=DD + W(:,:,j)*shifting(H,j-1);
end
DD=D ./DD;

for j=1:tt
tW=W(:,:,j);
tD=shifting(DD,-j+1);
Hsum=Hsum+H .* (tW'*tD)./(tW'*one);
end

%average among H0
H=Hsum./tt;

end


