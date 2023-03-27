pkg load image
img = imread('pout.tif');


array = equalize(img, 256);

heq=histeq(double(img)/255,256);

subplot(2,2,1); imshow(img); title ("Original Picture");
subplot(2,2,2); imhist(img); title ("Original Picture Histogram");
subplot(2,2,3); imshow(uint8(heq*255)); title ("Equalized Picture");
subplot(2,2,4); imhist(uint8(heq*255)); title ("Equalized Picture Histogram");

