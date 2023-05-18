pkg load image

img = imread("HE.jpg");
imshow(img);
labeled = zeros(size(img,1),size(img,2));

red = img(:,:,1);
blue = img(:,:,3);
labeled(red < 75) = 1;


subplot(1,2,1); imshow(img);
subplot(1,2,2); imshow(labeled);
