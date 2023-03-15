ogImg = imread('ctskull-256.tif');

newImg = imresize (ogImg, (7/8));

subplot(1,2,1); imshow(ogImg); title('Original Picture');
subplot(1,2,2); imshow(newImg); title('7-bits Picture');
