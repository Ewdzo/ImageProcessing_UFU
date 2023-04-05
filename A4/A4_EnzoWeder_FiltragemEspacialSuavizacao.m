pkg load image

img = imread("segmenta.jpg");

subplot(2,3,1); imshow(img); title("Original Image");
subplot(2,3,2); imshow(medfilt2(img, [3 3])); title("Median Filter(3x3)");
subplot(2,3,3); imshow(medfilt2(img, [7 7])); title("Median Filter(7x7)");

subplot(2,3,4); imshow(img); title("Original Image");
subplot(2,3,5); imshow(imfilter(img, fspecial("average", [3 3]))); title("Average Filter(3x3)");
subplot(2,3,6); imshow(imfilter(img, fspecial("average", [7 7]))); title("Average Filter(7x7)");
