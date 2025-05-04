rng()
x=randn(1000,1); 
bincenters=[-3.5:0.5:3.5]'; 
bins=length(bincenters); 
h=zeros(bins,1);
for i=1:length(x)
   for k=1:bins
       if x(i)>bincenters(k)-0.5/2 && x(i)<=bincenters(k)+0.5/2
            h(k,1)=h(k,1)+1;
       end
   end
end
pxest=h/(1000*0.5);
xaxis=[-4:0.01:4]';
px=(1/sqrt(2*pi))*exp(-0.5*xaxis.^2);