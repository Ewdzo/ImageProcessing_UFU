pkg load image

img1 = imread("pout.tif");
img2 = imread("im_cells.png");

subplot(1,2,1); imhist(img1);
subplot(1,2,2); imhist(img2);