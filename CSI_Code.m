Car = imread('halftone.png');
Car = rgb2gray(Car);
PQ = paddedsize(size(Car));
figure, imshow(Car)

%Create notch filters for peaks I found
H1 = notch('ideal', PQ(1), PQ(2), 10 , 136, 136);
H2 = notch('ideal', PQ(2), PQ(2), 10, 136,227);
H3 = notch('ideal', PQ(2), PQ(2), 10, 226,135);
H4 = notch('ideal', PQ(2), PQ(2), 10, 226,226);

H5 = notch('btw', PQ(1), PQ(2), 10 , 136, 136);
H6 = notch('btw', PQ(2), PQ(2), 10, 136,227);
H7 = notch('btw', PQ(2), PQ(2), 10, 226,135);
H8 = notch('btw', PQ(2), PQ(2), 10, 226,226);

H9 = notch('gaussian', PQ(1), PQ(2), 10 , 136, 136);
H10 = notch('gaussian', PQ(2), PQ(2), 10, 136,227);
H11 = notch('gaussian', PQ(2), PQ(2), 10, 226,135);
H12 = notch('gaussian', PQ(2), PQ(2), 10, 226,226);

%Transform car
F_Car = fft2(double(Car),PQ(1),PQ(2));

%figure, imshow(log(real(fftshift(F_Car))));


%Apply filters
FS_Car_Ideal = F_Car.*H1.*H2.*H3.*H4;
FS_Car_btw = F_Car.*H5.*H6.*H7.*H8;
FS_Car_gauss = F_Car.*H9.*H10.*H11.*H12;


%Transform back to spatial domain
Shifted_Car = real(ifft2(FS_Car_Ideal));
Shifted_Car = Shifted_Car(1:size(Car,1),1:size(Car,2));

Shifted_Car_btw = real(ifft2(FS_Car_btw));
Shifted_Car_btw = Shifted_Car_btw(1:size(Car,1),1:size(Car,2));

Shifted_Car_gauss = real(ifft2(FS_Car_gauss));
Shifted_Car_gauss = Shifted_Car_gauss(1:size(Car,1),1:size(Car,2));


%Show images
imtool(Shifted_Car,[]);
imtool(Shifted_Car_btw,[]);
imtool(Shifted_Car_gauss,[]);

%look at frequency spectrum for ideal filter. This is how I found peaks.
Fc = fftshift(F_Car);
Fcs = fftshift(FS_Car);
S1=log(1+abs(Fc));
Normed_Car=log(fftshift(abs(real(Fc))));
Normed_FSCar=log(fftshift(abs(real(Fcs))));

imtool(Normed_Car, [])
imtool(Normed_FSCar,[])

