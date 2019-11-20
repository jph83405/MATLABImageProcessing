hat = imread('97.jpg');
hat = rgb2gray(hat);

PQ = paddedsize(size(hat));

D0 = .05*PQ(1);
H = hpfilter('btw',PQ(1),PQ(2),D0);

F = fft2(double(hat), size(H,1),size(H,2));

HighPassHat = H.*F;

SpatialHat = real(ifft2(HighPassHat));

SpatialHat = SpatialHat(1:size(hat,1), 1:size(hat,2));

figure, imshow(SpatialHat,[]);

Fc = fftshift(F);
Fcf = fftshift(HighPassHat);

S1 = log(1+abs(Fc));
S2 = log(1+abs(Fcf));

figure, imshow(S1, []);
figure, imshow(S2, []);

