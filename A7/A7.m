pkg load image

#img = imread("image.jpg");
#img = imread("image2.jpg");
#img = imread("Lenna.jpg");

red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

img = rgb2hsv(img);
h = img(:,:,1);
s = img(:,:,2);
v = img(:,:,3);


subplot(2,3,1); imhist(red); title("Red");
subplot(2,3,2); imhist(green); title("Green");
subplot(2,3,3); imhist(blue); title("Blue");
subplot(2,3,4); imhist(h); title("Hue");
subplot(2,3,5); imhist(s); title("Saturation");
subplot(2,3,6); imhist(v); title("Value");
