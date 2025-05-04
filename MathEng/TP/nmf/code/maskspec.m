%retrieve  magnitude spectrogram determined by WH but projected to bases from j to k
%

function [Y0]=maskspec(W,H,j,k)

%need check how much time span


if ((nargin >=3) & (j > 0 ))
 if (nargin <4 )
   k=j; 
 end
  
  W=W(:,j:k,:);
  H=H(j:k,:);
end

M=size(W,1);
N=size(H,2);
span=size(W,3);

Y0=zeros(M,N);

sprintf('W size=%d %d %d H size%d %d span %d', size(W,1),size(W,2),size(W,3), size(H,1), size(H,2), span)


for i=1:span
Y0=Y0+ W(:,:,i)*shifting(H,i-1);
end

end
