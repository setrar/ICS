%generate spectrum
%wavename: filename of the input wave
%y:speech data in time domain 
%Y:FFT, complex spectrogram
%YA:magnitude spectrogram
%YG:phase spectrogram

function [y,Y, YA, YG]=loadspec(wavename)
%FW=1024;
FW=512;
%HP=round(FW/4);
HP=0;
f=16000;

if (nargin == 0)
wavename='../dt/mwbt0.wav';
%wavename='../dt/yaxis.wav';
end

boxw=ones([1 FW]);

[y,Fs,nbits]=wavread(wavename);
%[Y,x,t,p]=spectrogram(y,FW,HP,FW,f,'yaxis');
[Y,x,t,p]=spectrogram(y,boxw,HP,FW,f,'yaxis');

%this is used to draw the color picture of the spectrum
%spectrogram(y,FW,HP,FW,f,'yaxis');

YA=abs(Y);
YG=exp(1i*angle(Y));


%----------------------------------------------
%the following might be useful for optimization
%----------------------------------------------

YB=10*log10(YA);
%normalized Y
minv=min(min(YA));
maxv=max(max(YA));
YAscale=maxv-minv;
YAshift=minv;
YAN=(YA-YAshift)./YAscale;
%imshow(YA);

%log normalized Y
minv=min(min(YB));
maxv=max(max(YB));
YBscale=maxv-minv;
YBshift=minv;
YBN=(YB-YBshift)./YBscale;
%imshow(YB);

clear minv maxv

end
