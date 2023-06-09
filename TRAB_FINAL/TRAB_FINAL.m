pkg load image

img = imread("leaf.jpg");
img = imresize(img, 0.01);

img = padarray(img, [4,4]);

newImg = zeros(size(img));

for j=5:(size(img,1) - 4)
  for k=5:(size(img,2) - 4)
      smoothValue = smoothness(img, j, k);

      redValue = img(j,k,1);
      greenValue = img(j,k,2);
      blueValue = img(j,k,3);

      #if(smoothValue > 12 && (blueValue < (0.8 * greenValue)))
      if(blueValue < (0.8 * greenValue))
        newImg(j,k,:) = img(j,k,:);
      endif
  endfor
endfor


newImg = uint8(newImg);

imshow(newImg);
