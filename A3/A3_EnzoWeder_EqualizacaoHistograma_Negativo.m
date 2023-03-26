img = imread("im_cells.png");

for i=1:size(img,1)
  for j=1:size(img,2)
      img(i,j) = 255 - img(i,j);
  endfor
endfor

subplot(1,2,1); imshow(img); title("Negative");


for i=1:size(img,1)
  for j=1:size(img,2)
      img(i,j) = 255 - img(i,j);
  endfor
endfor

subplot(1,2,2); imshow(img); title("Positive from Negative");
