pkg load image

img = imread("leaf.jpg");
img = imresize(img, 0.03);

img = padarray(img, [4,4]);

newImg = zeros(size(img));
skeletonImg = zeros(size(newImg,1), size(newImg,2));

for j=5:(size(img,1) - 4)
  for k=5:(size(img,2) - 4)
      if(blueValue < (0.8 * greenValue))
        newImg(j,k,:) = img(j,k,:);
      endif
  endfor
endfor

img = newImg;
newImg = zeros(size(img));

for j=5:(size(img,1) - 4)
  for k=5:(size(img,2) - 4)
      smoothValue = smoothness(img, j, k);

      redValue = img(j,k,1);
      greenValue = img(j,k,2);
      blueValue = img(j,k,3);

      if(smoothValue < 12)
        newImg(j,k,:) = img(j,k,:);
      endif
  endfor
endfor

for j=5:(size(newImg,1) - 4)
  for k=5:(size(newImg,2) - 4)
        skeletonImg(j,k) = skeletonCandidate(newImg, j,k);
  endfor
endfor


newImg = uint8(newImg);
subplot(1,2,1); imshow(newImg);
subplot(1,2,2); imshow(skeletonImg);
