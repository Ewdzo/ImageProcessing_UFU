pkg load image

blockSize = 5;
img = imread("1_1.tif");
resized = round(size(img) / blockSize);


orientations = zeros(resized);
coherence = zeros(resized);


Gxy = zeros(resized);
Gxx = zeros(resized);
Gyy = zeros(resized);

#A.*B
#multiplies every element of A by every element of B

k=1;
l=1;
xBound = size(img,1)-blockSize;
yBound = size(img,2)-blockSize;

for i = 1:blockSize:xBound
  for j = 1:blockSize:yBound
    [gradX, gradY] = imgradientxy(img(i:(i - 1 + blockSize), j:(j+blockSize-1)));
    Gxy(k,l) = sum(sum(gradX .* gradY));
    Gxx(k,l) = sum(sum(gradX .* gradX));
    Gyy(k,l) = sum(sum(gradY .* gradY));
    orientations(k,l) = 90 + 0.5 * rad2deg( atan2(2*Gxy(k,l), Gxx(k,l) * Gxy(k,l)));
    coherence(k,l) = (sqrt(((Gxx(k,l)-Gyy(k,l)) ^ 2) + (4 * (Gxy(k,l)^2))) / (Gxx(k,l) + Gyy(k,l)));

    k = 1 + ((i-1) / blockSize);
    l = 1 + ((j-1) / blockSize);
  endfor
endfor
