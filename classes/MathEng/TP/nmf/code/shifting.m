function H0=shifting(H,i)

H0=circshift(H,[0 i]);
if (i>0)
 H0(:,1:i)=0;
end

if (i<0)
s=size(H);
H0(:,s(2)+i+1:s(2))=0;
end
