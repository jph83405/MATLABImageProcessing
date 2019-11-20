image = imread('97.jpg');
image = rgb2gray(image);

PQ = paddedsize(size(image));
D0 = 0.05*PQ(1);
H = lpfilter('btw', PQ(1), PQ(2), D0);
F=fft2(double(image),size(H,1),size(H,2));
LPimage = H.*F;
SpatialImage = real(ifft2(LPimage));
SpatialImage = SpatialImage(1:size(image,1),1:size(image,2));

figure, imshow(SpatialImage,[])

Fc=fftshift(F);
Fcf=fftshift(LPimage);

S1=log(1+abs(Fc));
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])