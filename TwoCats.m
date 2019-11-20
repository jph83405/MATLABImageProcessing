Two_Cats = imread('two_cats.jpeg');

HorizontalFilter = fspecial('prewitt');
VerticalFilter = HorizontalFilter.';

PQ = paddedsize(size(Two_Cats));

F_Horizontal = fft2(double(HorizontalFilter),PQ(1),PQ(2));
F_Vertical = fft2(double(VerticalFilter),PQ(1),PQ(2));

F_Cats = fft2(double(Two_Cats),PQ(1),PQ(2));

HorizontalCats = ifft2(F_Horizontal.*F_Cats);
VerticalCats = ifft2(F_Vertical.*F_Cats);

Cats = HorizontalCats + VerticalCats;
Cats = Cats(2:size(Two_Cats,1)+1,2:size(Two_Cats,2)+1);
figure, imshow(Cats,[])
VerticalCats = VerticalCats(2:size(Two_Cats,1)+1,2:size(Two_Cats,2)+1);
HorizontalCats = HorizontalCats(2:size(Two_Cats,1)+1,2:size(Two_Cats,2)+1);

figure, imshow(VerticalCats,[]);
figure, imshow(HorizontalCats,[]);