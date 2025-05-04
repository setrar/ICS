function show_W(W)

W=log10(W);

s=size(W);

maxv=max(max(W(:,:,1)));
minv=min(min(W(:,:,1)));

for j=2:s(3)
maxv=max([maxv max(max(W(:,:,j)))]);
minv=min([minv min(min(W(:,:,j)))]);
end


W0=ones(s(1),5);

for i=1:s(2)
for j=1:s(3)
  W0=[W0 (W(:,i,j)-minv)/(maxv-minv)];
end

  W0=[W0 ones([s(1),5])];

end


W0=1-flipud(W0);
%show axis 1 (gray)
imshow(W0)

%show aixs 2 (3-d)
%surf(W0);

%show aixs 3 (curve)
%n=min(10,min(size(W)));
%for i=1:n
%subplot(n,1,i);
%plot(W0(:,i))
%end

end

