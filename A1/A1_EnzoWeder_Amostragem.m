ogImg = imread('relogio.tif');

dpiOptions = [300, 150, 72]

targetDpi = dpiOptions[1];
dpiRatio = round(1250 / targetDpi);


newImgH = round(size(ogImg,1) / dpiRatio);
newImgW = round(size(ogImg,2) / dpiRatio);
newImg = zeros(newImgH, newImgW);

k = 1;
l = 1;

for i=1:dpiRatio:size(ogImg,1)
  l=1;
    for j=1:dpiRatio:size(ogImg,2)
    newImg(k,l) = ogImg(i,j);
    l++;
  endfor
    k++;
endfor

subplot(1,2,1); imshow(ogImg); title('Original Picture');
subplot(1,2,2); imshow(newImg); title('Resized Picture');
