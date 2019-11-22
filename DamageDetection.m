im1 = imread('RooftopDamage1.png');
im2 = imread('RooftopDamage2.png');
im3 = imread('RooftopDamage3.png');

h = fspecial('sobel');

%converting to greyscale%

im1 = rgb2gray(im1);
im2 = rgb2gray(im2);
im3 = rgb2gray(im3);

%padding images%
PQ1 = paddedsize(size(im1));
PQ2 = paddedsize(size(im2));
PQ3 = paddedsize(size(im3));

H = fft2(double(h),PQ1(1),PQ1(2));

%calculating discrete FFT%

F1 = fft2(double(im1),PQ1(1),PQ1(1));
F2 = fft2(double(im2),PQ2(1),PQ2(2));
F3 = fft2(double(im3),PQ3(1),PQ3(2));


%displaying Fourier Spectrum%

F1 = fftshift(F1);
F2 = fftshift(F2);
F3 = fftshift(F3);

figure,imshow(log(1+abs(F1)),[]);
figure,imshow(log(1+abs(F2)),[]);
figure,imshow(log(1+abs(F3)),[]);

