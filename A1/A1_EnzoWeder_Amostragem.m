ogImg = imread('relogio.tif');

dpiOptions = {300, 150, 72};

targetDpi = dpiOptions{1};
dpiRatio = 1;


newImgH = (size(ogImg,1) / dpiRatio);
newImgW = (size(ogImg,2) / dpiRatio);
newImg = zeros(newImgH, newImgW);

k = 1;
l = 1;

for i=1:size(ogImg,1)
  for j=1:size(ogImg,2)
    newImg(i,j) = ogImg(i,j);
  endfor
endfor

imshow(newImg); title('Resized Picture');
