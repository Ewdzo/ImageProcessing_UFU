pkg load image

blockSize = 5;
img = imread("1_1.tif");
resized = round(size(img) / blockSize);


orientations = zeros(resized);


aux = zeros(blockSize, blockSize);

#A.*B
#multiplies every element of A by every element of B

for k = 1:blockSize:size(img, 1)
  for l = 1:blockSize:size(img, 2)


    for i = k:(k + blockSize - 1)
      for j = k:(k + blockSize - 1)
        [gradX, gradY] = imgradientxy(img(i,j));
        aux(i,j) = (gradX * gradY);
      endfor
    endfor
    Gxy = sum(sum(aux));

    for i = k:(k + blockSize - 1)
      for j = k:(k + blockSize - 1)
        [gradX, gradY] = imgradientxy(img(i,j));
        aux(i,j) = (gradX * gradX);
      endfor
    endfor
    Gxx = sum(sum(aux));

    for i = k:(k + blockSize - 1)
      for j = k:(k + blockSize - 1)
        [gradX, gradY] = imgradientxy(img(i,j));
        aux(i,j) = (gradY * gradY);
      endfor
    endfor
    Gyy = sum(sum(aux));


    m = ((k-1)/5) + 1;
    n = ((k-1)/5) + 1;
    orientations(m,n) = (0.5 * (atan2(2 * Gxy, Gxx - Gxy)));
  endfor
endfor








